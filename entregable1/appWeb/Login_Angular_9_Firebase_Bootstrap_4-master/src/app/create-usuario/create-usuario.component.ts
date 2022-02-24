import { Component, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '@app/auth/services/auth.service';
import { UsuarioService } from '@app/services/Usuario.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-create-usuario',
  templateUrl: './create-usuario.component.html',
  styleUrls: ['./create-usuario.component.css']
})
export class CreateUsuarioComponent implements OnInit {

  usuarios: any[] = [];
  doctorAsignado: string;
  createUsuario: FormGroup;
  submitted = false;
  loading = false;
  id: string | null;
  titulo = 'Agregar Paciente';

  constructor(private fb: FormBuilder,
    private firestore: AngularFirestore,
    private authSvc: AuthService,
    private _usuarioService: UsuarioService,
    private router: Router,
    private toastr: ToastrService,
    private aRoute: ActivatedRoute) {
    this.createUsuario = this.fb.group({
      nombre: ['', Validators.required],
      edad: ['', Validators.required],
      identificacion: ['', Validators.required],
      idMedico: ['', Validators.required],
      password: ['', Validators.required],
      passwordtwo: ['', Validators.required],
      correo: ['', Validators.required]

    })
    this.id = this.aRoute.snapshot.paramMap.get('id');
    console.log(this.id)
  }

  ngOnInit(): void {
    this.getUsuarios();
    this.agregarEditarUsuario();

  }

  agregarEditarUsuario() {
    this.submitted = true;

    if (this.createUsuario.invalid) {
      return;
    }

    if (this.id === null) {
      this.agregarUsuario();
    } else {
      this.editarUsuario(this.id);
    }

  }
  agregarUsuario() {
    if (this.createUsuario.value.password == this.createUsuario.value.passwordtwo){
      const usuario: any = {
        edad: this.createUsuario.value.edad,
        identificacion: this.createUsuario.value.identificacion,
        idMedico: parseInt(this.createUsuario.value.idMedico),
        rol: "Paciente",
        nombre: this.createUsuario.value.nombre,
        fechaCreacion: new Date(),
        password:this.createUsuario.value.password,
        correo:  this.createUsuario.value.correo
      }
      console.log(usuario)
      this.loading = true;
      this.authSvc.register(usuario.correo, usuario.password)
      this._usuarioService.agregarUsuario(usuario).then(() => {
        this.toastr.success('El usuario fue registrado con exito!', 'Usuario Registrado', {
          positionClass: 'toast-bottom-right'
        });
        this.loading = false;
        this.router.navigate(['/list-user']);
      }).catch(error => {
        console.log(error);
        this.loading = false;
      })
      this.authSvc.login('admin@admin.com','admin1')
    }

  }

  getUsuarios() {
    this._usuarioService.getDoctores().subscribe(data => {
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

  editarUsuario(id: string) {

    const usuario: any = {
      edad: this.createUsuario.value.edad,
        identificacion: this.createUsuario.value.identificacion,
        idMedico: this.createUsuario.value.idMedico,
        rol: this.createUsuario.value.rol,
        idTratamiento: this.createUsuario.value.idTratamiento,
        nombre: this.createUsuario.value.nombre,
        fechaActualizacion: new Date()
    }

    this.loading = true;

    this._usuarioService.actualizarUsuario(id, usuario).then(() => {
      this.loading = false;
      this.toastr.info('El usuario fue modificado con exito', 'Usuario modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-usuarios']);
    })
  }

}
