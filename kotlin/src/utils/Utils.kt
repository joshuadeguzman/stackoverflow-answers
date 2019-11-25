package utils

import java.time.Duration
import java.util.*

/**
 * @param start Epoch time in milliseconds
 * @param end Epoch time in milliseconds
 */
fun getReadableBetween(start: Long, end: Long): String {
    val startDate = Date(start)
    val endDate = Date(end)
    var duration = Duration.between(startDate.toInstant(), endDate.toInstant())

    val days = duration.toDays()
    duration = duration.minusDays(days)
    val hours = duration.toHours()
    duration = duration.minusHours(hours)
    val minutes = duration.toMinutes()

    val stringBuilder = StringBuilder()

    if (days != 0L) {
        stringBuilder.append(days)
        if (days == 1L) {
            stringBuilder.append(" day ")
        } else {
            stringBuilder.append(" days ")
        }
    }

    if (hours != 0L) {
        stringBuilder.append(hours)
        if (hours == 1L) {
            stringBuilder.append(" hour ")
        } else {
            stringBuilder.append(" hours ")
        }
    }


    if (minutes != 0L) {
        stringBuilder.append(minutes)
        if (minutes == 1L) {
            stringBuilder.append(" minute.")
        } else {
            stringBuilder.append(" minutes.")
        }
    }

    println("Breakdown:")
    println("Days: $days")
    println("Hours: $hours")
    println("Minutes: $minutes")

    return stringBuilder.toString()
}