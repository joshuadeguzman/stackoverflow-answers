package answer4.usecases

import answer4.models.Equipment
import io.reactivex.Observable
import io.reactivex.Single

interface ICreateEquipmentsUseCase {
    operator fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?>
}

class CreateEquipmentsUseCase : ICreateEquipmentsUseCase {
    override fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?> {
        return Observable.create<List<Equipment>> { emitter ->
            val serverEquipments: MutableList<Equipment> = mutableListOf()
            if (!emitter.isDisposed) {
                equipments.forEachIndexed { index, equipment ->
                    // I need to send a post request in the server to create each of the equipment
                    // And expect for the list of equipments with server IDs
                    createEquipment(equipment)
                        .subscribe({
                            println("Item serverId: " + it.serverId)
                            println("Item name: " + it.name)
                            serverEquipments.add(it)

                            if (equipments.size == index - 1) {
                                emitter.onNext(serverEquipments)
                                emitter.onComplete()
                            }
                        }, {
                            println("Error: " + it.localizedMessage)
                            emitter.onError(it)
                        })
                }
            }
        }
    }

    // Mock server request returning an updated Equipment object
    private fun createEquipment(equipment: Equipment): Single<Equipment> {
        equipment.serverId = 100
        // return Single.error(Exception("Error"))
        return Single.just(equipment)
    }
}