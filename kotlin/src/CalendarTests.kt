import java.time.Duration
import java.util.*

fun main(args: Array<String>) {
    testAnswer1()
}

private fun testAnswer1() {
    val startDate = Date(1573759380 * 1000L)
    val endDate = Date(1574629200 * 1000L)
    var duration = Duration.between(startDate.toInstant(), endDate.toInstant())

    val days = duration.toDays()
    duration = duration.minusDays(days)
    val hours = duration.toHours()
    duration = duration.minusHours(hours)
    val minutes = duration.toMinutes()
    duration = duration.minusMinutes(minutes)

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

    // Outputs the timestamp millis to X days X hours 12 minutes.
    println("Remaining time is $stringBuilder")
    println("\nBreakdown:")
    println("Days: $days")
    println("Hours: $hours")
    println("Minutes: $minutes")
}