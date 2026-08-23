import { onSchedule } from "firebase-functions/v2/scheduler";
import { FieldValue } from "firebase-admin/firestore";
import { db } from "../lib/admin";
import { Paths, OwnerType, monthKeyFor } from "../lib/constants";
import { notifyUser, notifyUsers } from "../lib/fcm";

/**
 * Runs on the 1st of every month. For every active expenseTemplates doc
 * (created alongside a doctor's first "متكرر شهريًا" expense — see
 * ExpenseRepository.createRecurringExpense on the client), creates this
 * month's Expense instance if one doesn't already exist — idempotent via
 * the templateId+monthKey check, so a retried/duplicate invocation can
 * never double-book a month.
 */
export const generateRecurringExpenses = onSchedule(
  { schedule: "0 3 1 * *", timeZone: "Asia/Jerusalem" },
  async () => {
    const monthKey = monthKeyFor(new Date());
    const templatesSnap = await db
      .collection(Paths.expenseTemplates)
      .where("active", "==", true)
      .get();

    await Promise.all(
      templatesSnap.docs.map(async (templateDoc) => {
        const template = templateDoc.data();
        const existing = await db
          .collection(Paths.expenses)
          .where("templateId", "==", templateDoc.id)
          .where("monthKey", "==", monthKey)
          .limit(1)
          .get();
        if (!existing.empty) return;

        await db.collection(Paths.expenses).add({
          ownerId: template.ownerId,
          ownerType: template.ownerType,
          description: template.description,
          category: template.category,
          costType: template.costType,
          isRecurringMonthly: true,
          templateId: templateDoc.id,
          monthKey,
          totalAmount: template.amount,
          amountPaid: 0,
          amountRemaining: template.amount,
          paymentStatus: "unpaid",
          expenseDate: FieldValue.serverTimestamp(),
          createdByUid: template.createdByUid,
          createdAt: FieldValue.serverTimestamp(),
        });

        const title = "مصروف شهري متكرر";
        const body = `${template.description} — ${template.amount} ₪`;
        const data = { templateId: templateDoc.id, type: "recurring_expense_generated" };
        if (template.ownerType === OwnerType.center) {
          const centerDoc = await db.collection(Paths.medicalCenters).doc(template.ownerId).get();
          const memberUids = (centerDoc.data()?.memberUids as string[] | undefined) ?? [];
          await notifyUsers(memberUids, title, body, data);
        } else {
          await notifyUser(template.ownerId, title, body, data);
        }
      })
    );
  }
);
