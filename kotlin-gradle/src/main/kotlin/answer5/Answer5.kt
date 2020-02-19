package answer5

import java.text.SimpleDateFormat
import java.util.*

fun main(args: Array<String>) {
    val date = Date()
    println("Month " + date.getDateMonth())
    println("Day " + date.getDateDay())
    println("Year " + date.getDateYear())
}

// Extensions
fun Date.getDateMonth(): Int {
    val sdf = SimpleDateFormat("MM")
    return sdf.format(this).toInt()
}

fun Date.getDateDay(): Int {
    val sdf = SimpleDateFormat("dd")
    return sdf.format(this).toInt()
}

fun Date.getDateYear(): Int {
    val sdf = SimpleDateFormat("YYYY")
    return sdf.format(this).toInt()
}