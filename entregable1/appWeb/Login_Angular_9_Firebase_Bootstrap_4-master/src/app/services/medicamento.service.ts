import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MedicamentoService {

  constructor(private firestore: AngularFirestore) { }

  agregarMedicamento(medicamento: any): Promise<any> {
    return this.firestore.collection('medicamentos').add(medicamento);
  }

  getMedicamentos(): Observable<any> {
    return this.firestore.collection('medicamentos', ref => ref.orderBy('fechaCreacion', 'asc')).snapshotChanges();
  }

  eliminarMedicamento(id: string): Promise<any> {
    return this.firestore.collection('medicamentos').doc(id).delete();
  }

  getMedicamento(id: string): Observable<any> {
    return this.firestore.collection('medicamentos').doc(id).snapshotChanges();
  }

  actualizarEmpleado(id: string, data:any): Promise<any> {
    return this.firestore.collection('empleados').doc(id).update(data);
  }

}
