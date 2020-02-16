package answer4.usecases

import answer4.createEquipment
import answer4.models.Equipment
import io.reactivex.Observable

interface ICreateEquipmentsUseCase {
    operator fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?>
}

class CreateEquipmentsUseCase : ICreateEquipmentsUseCase {
    override fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?> {
        return Observable.create<List<Equipment>> { emitter ->
            val serverEquipments: MutableList<Equipment> = mutableListOf()
            if (!emitter.isDisposed) {
                equipments.forEach {
                    // I need to send a post request in the server to create each of the equipment
                    // And expect for the list of equipments with server IDs
                    createEquipment(it)
                        .subscribe({
                            println("Item serverId: " + it.serverId)
                            println("Item name: " + it.name)
                            serverEquipments.add(it)
                        }, {
                            println("Error: " + it.localizedMessage)
                            emitter.onError(it)
                        })
                }

                emitter.onNext(serverEquipments)
                emitter.onComplete()
            }
        }
    }
}