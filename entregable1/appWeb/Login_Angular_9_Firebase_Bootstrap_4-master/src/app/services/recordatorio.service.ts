import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RecordatorioService {

  constructor(private firestore: AngularFirestore) { }

  agregarRecordatorio(recordatorio: any): Promise<any> {
    return this.firestore.collection('Recordatorios').add(recordatorio);
  }

  getRecordatorios(): Observable<any> {
    return this.firestore.collection('Recordatorios').snapshotChanges();
  }

  eliminarRecordatorio(id: string): Promise<any> {
    return this.firestore.collection('Recordatorios').doc(id).delete();
  }

  getRecordatorio(id: string): Observable<any> {
    return this.firestore.collection('Recordatorios').doc(id).snapshotChanges();
  }

  actualizarRecordatorio(id: string, data:any): Promise<any> {
    return this.firestore.collection('Recordatorios').doc(id).update(data);
  }

}
