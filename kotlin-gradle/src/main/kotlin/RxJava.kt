import io.reactivex.Observable

fun main(args: Array<String>) {
    testAnswer1()
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