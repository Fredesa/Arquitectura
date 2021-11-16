import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
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
    private _usuarioService: UsuarioService,
    private router: Router,
    private toastr: ToastrService,
    private aRoute: ActivatedRoute) {
    this.createUsuario = this.fb.group({
      nombre: ['', Validators.required],
      edad: ['', Validators.required],
      identificacion: ['', Validators.required],
      idMedico: [''],
      rol: ['', Validators.required],
      idTratamiento:[''],

    })
    this.id = this.aRoute.snapshot.paramMap.get('id');
    console.log(this.id)
  }

  ngOnInit(): void {
    this.esEditar();
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
    const usuario: any = {
      nombre: this.createUsuario.value.nombre,
      apellido: this.createUsuario.value.apellido,
      documento: this.createUsuario.value.documento,
      salario: this.createUsuario.value.salario,
      fechaCreacion: new Date(),
      fechaActualizacion: new Date()
    }
    this.loading = true;
    this._usuarioService.agregarUsuario(usuario).then(() => {
      this.toastr.success('El usuario fue registrado con exito!', 'Usuario Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list-usuarios']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarUsuario(id: string) {

    const usuario: any = {
      nombre: this.createUsuario.value.nombre,
      apellido: this.createUsuario.value.apellido,
      documento: this.createUsuario.value.documento,
      salario: this.createUsuario.value.salario,      
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
    this.titulo = 'Editar Usuario'
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
