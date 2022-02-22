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


  createUsuario: FormGroup;
  submitted = false;
  loading = false;
  id: string | null;
  titulo = 'Agregar Usuario';

  constructor(private fb: FormBuilder,
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
      rol: ['', Validators.required],
      idTratamiento:[''],
      password: ['', Validators.required],
      passwordtwo: ['', Validators.required],
      correo: ['', Validators.required]

    })
    this.id = this.aRoute.snapshot.paramMap.get('id');
    console.log(this.id)
  }

  ngOnInit(): void {
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
        idMedico: this.createUsuario.value.idMedico,
        rol: this.createUsuario.value.rol,
        idTratamiento: this.createUsuario.value.idTratamiento,
        nombre: this.createUsuario.value.nombre,
        fechaCreacion: new Date(),
        fechaActualizacion: new Date(),
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
        this.router.navigate(['/list-users2']);
      }).catch(error => {
        console.log(error);
        this.loading = false;
      })
    }

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


  esEditar() {
    this.titulo = 'Agregar Usuario'
    if (this.id !== null) {
      this.loading = true;
      this._usuarioService.getUsuario(this.id).subscribe(data => {
        this.loading = false;
        this.createUsuario.setValue({
          nombre: data.payload.data()['nombre'],
          apellido: data.payload.data()['apellido'],
          documento: data.payload.data()['documento'],
          salario: data.payload.data()['salario'],
        })
      })
    }
  }

}
