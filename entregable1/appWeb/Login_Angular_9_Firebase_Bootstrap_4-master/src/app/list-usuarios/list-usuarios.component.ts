import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { UsuarioService } from 'src/app/services/Usuario.service';

@Component({
  selector: 'app-list-Usuarios',
  templateUrl: './list-Usuarios.component.html',
  styleUrls: ['./list-Usuarios.component.css']
})
export class ListUsuariosComponent implements OnInit {
  usuarios: any[] = [];

  constructor(private _usuarioService: UsuarioService,
              private toastr: ToastrService) {
  }

  ngOnInit(): void {
    this.getUsuarios()
  }

  getUsuarios() {
    this._usuarioService.getUsuarios().subscribe(data => {
      this.usuarios = [];
      data.forEach((element: any) => {
        this.usuarios.push({
          id: element.payload.doc.id,
          ...element.payload.doc.data()
        })
      });
      console.log(this.usuarios);
    });
  }

  eliminarUsuario(id: string) {
    this._usuarioService.eliminarUsuario(id).then(() => {
      console.log('empelado eliminado con exito');
      this.toastr.error('El Usuario fue eliminado con exito', 'Registro eliminado!', {
        positionClass: 'toast-bottom-right'
      });
    }).catch(error => {
      console.log(error);
    })
  }

}
