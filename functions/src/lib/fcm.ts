import { messaging } from "./admin";
import { ADMIN_ALERTS_TOPIC } from "./constants";
import * as logger from "firebase-functions/logger";

/** Admin device(s) subscribe to this shared topic on login rather than
 * per-token fan-out — simpler, and avoids stale-token bookkeeping for what
 * is realistically one owner across a couple of devices. Doctors receive
 * no push notifications per spec. */
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
