import utils.getReadableBetween
import java.time.Duration
import java.util.*

fun main(args: Array<String>) {
    testAnswer1()
}

private fun testAnswer1() {
    val readableTimeStamp = getReadableBetween(1573759380 * 1000L, 1574629200 * 1000L)
    println("\nRemaining time is $readableTimeStamp")
}