package answer4

import answer4.models.Equipment
import answer4.usecases.CreateEquipmentsUseCase

fun main(args: Array<String>) {
    testAnswer()
}

fun testAnswer() {
    // Locally stored equipments
    val equipments =
        arrayListOf(
            Equipment(name = "Camera"),
            Equipment(name = "Camera Stand"),
            Equipment(name = "Camera Lens")
        )

    CreateEquipmentsUseCase().invoke(equipments)
        .subscribe({
            println("Equipments size: " + it?.size)
            it?.forEach {
                println("Item serverId: " + it.serverId)
                println("Item name: " + it.name)
            }
        }, {
            println("Oh oh error: " + it.localizedMessage)
        })
}