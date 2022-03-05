import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { AuthService } from '@app/auth/services/auth.service';
import { User } from '@app/shared/models/user.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private firestore: AngularFirestore) {}


  agregarUsuario(usuario: any): Promise<any> {
    return this.firestore.collection('usuarios').add(usuario);

  }

  getUsuarios(): Observable<any> {
    return this.firestore.collection('usuarios').snapshotChanges();
  }

  getDoctores(): Observable<any> {
    return this.firestore.collection('usuarios', ref => ref.where('rol','==','Medico')).snapshotChanges();
  }

  eliminarUsuario(id: string): Promise<any> {
    return this.firestore.collection('usuarios').doc(id).delete();
  }

  getUsuario(id: string): Observable<any> {
    return this.firestore.collection('usuarios').doc(id).snapshotChanges();
  }

  actualizarUsuario(id: string, data:any): Promise<any> {
    return this.firestore.collection('usuarios').doc(id).update(data);
  }

}
