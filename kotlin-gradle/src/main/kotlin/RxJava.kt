import io.reactivex.Observable
import io.reactivex.subjects.PublishSubject

fun main(args: Array<String>) {
    // testAnswer1()
    testAnswer2()
}

// https://stackoverflow.com/questions/54281902/rxjava-observable-create-not-emitting-events-for-switchifemptyobservable/54284694#54284694
fun testAnswer1() {
    val numbers = Observable.just("one", "two", "three")
    val languages = Observable.create<String> { emitter ->
        emitter.onNext("java")
        emitter.onNext("kotlin")
        emitter.onNext("swift")
        emitter.onComplete() // <-- Invoke this
    }

    languages
        .filter { s -> s.toLowerCase().startsWith("z") }
        .switchIfEmpty(numbers)
        .subscribe({
            println(it)
        }, {
            println(it)
        })

    numbers
        .filter { s -> s.toLowerCase().startsWith("z") }
        .switchIfEmpty(languages)
        .subscribe({
            println(it)
        }, {
            println(it)
        })
}

// https://stackoverflow.com/questions/54357888/rxjava-how-to-stop-publishsubject-from-publishing-even-if-onnext-is-called/54362033#54362033
fun testAnswer2() {
    val maxEmittedItemCount = 10
    var currentEmittedItemCount = 0
    val someStringValue = "Some observable" // Create whatever observable you have
    val publishSubject = PublishSubject.create<String>()

    publishSubject.subscribe({
        currentEmittedItemCount++
        println(it)
    }, {
        println(it)
    })

    while (currentEmittedItemCount != maxEmittedItemCount) {
        // Print indication that the loop is still running
        println("Still looping")

        // Publish value on the subject
        publishSubject.onNext(someStringValue)

        // Test flag for trigger
        if (currentEmittedItemCount == maxEmittedItemCount) publishSubject.onComplete()
    }
}