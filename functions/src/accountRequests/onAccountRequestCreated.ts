import { onDocumentCreated } from "firebase-functions/v2/firestore";
import { Paths } from "../lib/constants";
import { notifyAdmins } from "../lib/fcm";

/**
 * Fires the moment a prospective doctor submits the public "request an
 * account" form (signed-out, see AccountRequest's doc comment) — the admin
 * only ever finds out about a new request by opening the app otherwise, so
 * this is the one clinic-management-era notification that isn't about an
 * existing doctor's activity.
 */
export const onAccountRequestCreated = onDocumentCreated(
  `${Paths.accountRequests}/{requestId}`,
  async (event) => {
    const request = event.data?.data();
    if (!request) return;

    const typeLabel =
      request.accountType === "center"
        ? `مركز طبي — ${request.centerName || "بدون اسم"}`
        : "عيادة منفردة";

    await notifyAdmins(
      "طلب حساب جديد",
      `${request.name} — ${typeLabel}`,
      { requestId: event.params.requestId, type: "account_request_created" }
    );
  }
);
