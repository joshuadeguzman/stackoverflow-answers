import utils.getReadableBetween
import utils.getReadableBetweenLegacy
import java.time.Duration
import java.util.*

fun main(args: Array<String>) {
    testAnswer1()
}

private fun testAnswer1() {
    // val readableTimeStamp = getReadableBetween(1573759380 * 1000L, 1574629200 * 1000L)
    val readableTimeStamp = getReadableBetweenLegacy(1574128800 * 1000L, 1574361120 * 1000L)
    println("\nRemaining time is $readableTimeStamp")
}