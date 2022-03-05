import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { AuthService } from '@app/auth/services/auth.service';
import { User } from '@app/shared/models/user.interface';
import { ToastrService } from 'ngx-toastr';
import { element, ElementArrayFinder } from 'protractor';
import { Observable } from 'rxjs';
import { UsuarioService } from 'src/app/services/Usuario.service';

@Component({
  selector: 'app-list-Pacientes',
  templateUrl: './list-Pacientes.component.html',
  styleUrls: ['./list-Pacientes.component.css']
})
export class ListPacientesComponent implements OnInit {

  usuarios: any[] = [];
  id

  constructor(private _pacienteService: UsuarioService,
              private toastr: ToastrService,
              public authSvc: AuthService,
              private firestore: AngularFirestore) {  }

  ngOnInit(): void {
    this.getPacientes()
  }

  async getPacientes(){
    await (await this.authSvc.getStatus()).subscribe(
     status => {
        this._pacienteService.getUsuario(status.uid).subscribe(
          data => {
            this.id = data.payload.data()['identificacion']
            console.log(this.id)
            this.firestore.collection('usuarios', ref => ref.where('idMedico','==',this.id)).snapshotChanges().subscribe(
              data => {
                this.usuarios = [];
                data.forEach((element: any) =>{
                  this.usuarios.push({
                    id: element.payload.doc.id,
                    ...element.payload.doc.data()
                  })
                });
              }
            )
          }
        )
      }
    )
  }

}
