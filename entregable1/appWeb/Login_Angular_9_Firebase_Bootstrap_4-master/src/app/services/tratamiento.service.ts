import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TratamientoService {

  constructor(private firestore: AngularFirestore) { }

  agregarTratamiento(tratamiento: any): Promise<any> {
    return this.firestore.collection('tratamientos').add(tratamiento);
  }

  getTratamientos(): Observable<any> {
    return this.firestore.collection('tratamientos').snapshotChanges();
  }
  getTratamientosPaciente(id: string): Observable<any> {
    return this.firestore.collection('usuarios').doc(id).collection('tratamientos').snapshotChanges();
  }

  eliminarTratamiento(id: string): Promise<any> {
    return this.firestore.collection('tratamientos').doc(id).delete();
  }

  getTratamiento(id: string): Observable<any> {
    return this.firestore.collection('tratamientos').doc(id).snapshotChanges();
  }

  actualizarTratamiento(id: string, data:any): Promise<any> {
    return this.firestore.collection('tratamientos').doc(id).update(data);
  }

}
