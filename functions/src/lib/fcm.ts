import { db, messaging } from "./admin";
import { ADMIN_ALERTS_TOPIC, Paths } from "./constants";
import { FieldValue } from "firebase-admin/firestore";
import * as logger from "firebase-functions/logger";

/** Admin device(s) subscribe to this shared topic on login rather than
 * per-token fan-out — simpler, and avoids stale-token bookkeeping for what
 * is realistically one owner across a couple of devices. */
export async function notifyAdmins(title: string, body: string, data?: Record<string, string>) {
  try {
    await messaging.send({
      topic: ADMIN_ALERTS_TOPIC,
      notification: { title, body },
      data,
    });
  } catch (err) {
    // A notification failure should never fail the underlying Firestore
    // write it's reacting to (stock decrement, order creation, etc.) —
    // log and move on.
    logger.error("Failed to send admin notification", err);
  }
}

/** A doctor's own device(s), targeted by the FCM tokens saved on their
 * users/{uid} doc (see UserRepository.registerFcmToken / app.dart's
 * post-login registration) — per-token fan-out rather than a shared topic,
 * since unlike the single admin, every doctor must only ever see their own
 * notifications. Silently no-ops if the doctor has never registered a
 * token (e.g. push permission denied, or hasn't opened the app since this
 * feature shipped) — same fire-and-forget-on-failure contract as
 * notifyAdmins. Any token Firebase reports as no-longer-valid (uninstalled
 * app, revoked permission) is pruned from the array so it stops being
 * retried forever. */
export async function notifyUser(uid: string, title: string, body: string, data?: Record<string, string>) {
  try {
    const userDoc = await db.collection(Paths.users).doc(uid).get();
    const tokens = (userDoc.data()?.fcmTokens as string[] | undefined) ?? [];
    if (tokens.length === 0) return;

    const res = await messaging.sendEachForMulticast({ tokens, notification: { title, body }, data });
    const invalidTokens = res.responses
      .map((r, i) => (r.success ? null : tokens[i]))
      .filter((t): t is string => t !== null);
    if (invalidTokens.length > 0) {
      await db.collection(Paths.users).doc(uid).update({
        fcmTokens: FieldValue.arrayRemove(...invalidTokens),
      });
    }
  } catch (err) {
    logger.error(`Failed to send notification to user ${uid}`, err);
  }
}

/** Fans [notifyUser] out to several doctors at once — used wherever a
 * medical-center-wide event (no single assigned doctor) needs to reach
 * every member, e.g. an unassigned appointment's reminder. */
export async function notifyUsers(uids: string[], title: string, body: string, data?: Record<string, string>) {
  await Promise.all(uids.map((uid) => notifyUser(uid, title, body, data)));
}
