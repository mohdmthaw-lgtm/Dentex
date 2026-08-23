/**
 * Asia/Jerusalem-local midnight, [daysFromToday] days out, expressed as
 * the UTC instant it actually occurs at (handles the DST offset switch
 * automatically via Intl, rather than hardcoding UTC+2/UTC+3).
 *
 * Used to build correct day-boundary range queries (e.g. "every
 * appointment scheduled tomorrow") from inside a scheduled function —
 * onSchedule's own `timeZone` option only controls *when the function
 * fires*, not how `new Date()` behaves once it's running (that's always
 * UTC), so this is still needed even though the schedule itself already
 * specifies "Asia/Jerusalem".
 */
export function jerusalemMidnightUtc(daysFromToday: number, now: Date = new Date()): Date {
  const offsetFormatter = new Intl.DateTimeFormat("en-US", {
    timeZone: "Asia/Jerusalem",
    timeZoneName: "shortOffset",
  });
  const offsetPart = offsetFormatter.formatToParts(now).find((p) => p.type === "timeZoneName")!.value;
  const match = offsetPart.match(/GMT([+-]\d+)(?::(\d+))?/);
  const offsetHours = match ? parseInt(match[1], 10) : 0;
  const offsetMinutes = match?.[2] ? parseInt(match[2], 10) : 0;
  const totalOffsetMinutes = offsetHours * 60 + (offsetHours < 0 ? -offsetMinutes : offsetMinutes);

  const ymd = new Intl.DateTimeFormat("en-CA", {
    timeZone: "Asia/Jerusalem",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(now);
  const [year, month, day] = ymd.split("-").map(Number);

  return new Date(Date.UTC(year, month - 1, day + daysFromToday, 0, 0, 0) - totalOffsetMinutes * 60_000);
}
