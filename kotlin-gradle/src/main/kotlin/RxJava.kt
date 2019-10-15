import io.reactivex.Observable
import io.reactivex.functions.BiFunction
import io.reactivex.subjects.PublishSubject

fun main(args: Array<String>) {
    // testAnswer1()
    // testAnswer2()
    testAnswer3()
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

// Swift related issue, but seems like they (kotlin/java) behave the same:
// https://github.com/ReactiveX/RxSwift/issues/1205
fun testAnswer3() {
    val obs1 = Observable.just("test1")
    val obs2 = Observable.just("test2")

    // Passing this empty obs will not trigger the combineLatest
    // val obs2 = Observable.empty<String>()

    Observable.combineLatest(obs1, obs2, BiFunction { t1: String, t2: String ->
        t1 + t2
    }).subscribe({
        print(it)
    }, {
        print(it)
    })
}