import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MedicamentoService {

  constructor(private firestore: AngularFirestore) { }

  agregarMedicamento(id: string,medicamento: any): Promise<any> {
    console.log(id)
    return this.firestore.collection('medicamentos').doc(id).set(medicamento);
  }

  getMedicamentos(): Observable<any> {
    return this.firestore.collection('medicamentos').snapshotChanges();
  }

  eliminarMedicamento(id: string): Promise<any> {
    return this.firestore.collection('medicamentos').doc(id).delete();
  }

  getMedicamento(id: string): Observable<any> {
    return this.firestore.collection('medicamentos').doc(id).snapshotChanges();
  }

  actualizarMedicamento(id: string, data:any): Promise<any> {
    return this.firestore.collection('medicamentos').doc(id).update(data);
  }

}
