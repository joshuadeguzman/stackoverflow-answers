package answer4.usecases

import answer4.models.Equipment
import io.reactivex.Observable

interface ICreateEquipmentsUseCase {
    operator fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?>
}

class CreateEquipmentsUseCase : ICreateEquipmentsUseCase {
    override fun invoke(equipments: MutableList<Equipment>): Observable<List<Equipment>?> {
        return Observable.create<List<Equipment>> { emitter ->
            if (!emitter.isDisposed) {
                // I need to send a post request in the server to create each of the equipment
                // And expect for the list of equipments with server IDs
                Observable.fromIterable(equipments)
                    .flatMap { equipment ->
                        createEquipment(equipment)
                    }
                    .toList()
                    .subscribe({
                        emitter.onNext(it)
                        emitter.onComplete()
                    }, {
                        println("Error: " + it.localizedMessage)
                        emitter.onError(it)
                    })
            }
        }
    }

    // Mock server request returning an updated Equipment object
    private fun createEquipment(equipment: Equipment): Observable<Equipment> {
        equipment.serverId = 100
        // return Single.error(Exception("Error"))
        return Observable.just(equipment)
    }
}