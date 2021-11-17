import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { TratamientoService } from '@app/services/Tratamiento.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-create-tratamiento',
  templateUrl: './create-tratamiento.component.html',
  styleUrls: ['./create-tratamiento.component.css']
})
export class CreateTratamientoComponent implements OnInit {
  createTratamiento: FormGroup;
  submitted = false;
  loading = false;
  id: string | null;
  titulo = 'Agregar Tratamiento';

  constructor(private fb: FormBuilder,
    private _tratamientoService: TratamientoService,
    private router: Router,
    private toastr: ToastrService,
    private aRoute: ActivatedRoute) {
    this.createTratamiento = this.fb.group({
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

  agregarEditarTratamiento() {
    this.submitted = true;

    if (this.createTratamiento.invalid) {
      return;
    }

    if (this.id === null) {
      this.agregarTratamiento();
    } else {
      this.editarTratamiento(this.id);
    }

  }

  agregarTratamiento() {
    const tratamiento: any = {
      edad: this.createTratamiento.value.edad,
      identificacion: this.createTratamiento.value.identificacion,
      idMedico: this.createTratamiento.value.idMedico,
      rol: this.createTratamiento.value.rol,
      idTratamiento: this.createTratamiento.value.idTratamiento,
      nombre: this.createTratamiento.value.nombre,
      fechaCreacion: new Date(),
      fechaActualizacion: new Date()
    }
    this.loading = true;
    this._tratamientoService.agregarTratamiento(tratamiento).then(() => {
      this.toastr.success('El tratamiento fue registrado con exito!', 'Tratamiento Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarTratamiento(id: string) {

    const tratamiento: any = {
      nombre: this.createTratamiento.value.nombre,
      apellido: this.createTratamiento.value.apellido,
      documento: this.createTratamiento.value.documento,
      salario: this.createTratamiento.value.salario,
      fechaActualizacion: new Date()
    }

    this.loading = true;

    this._tratamientoService.actualizarTratamiento(id, tratamiento).then(() => {
      this.loading = false;
      this.toastr.info('El tratamiento fue modificado con exito', 'Tratamiento modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-tratamientos']);
    })
  }


  esEditar() {
    this.titulo = 'Editar Tratamiento'
    if (this.id !== null) {
      this.loading = true;
      this._tratamientoService.getTratamiento(this.id).subscribe(data => {
        this.loading = false;
        this.createTratamiento.setValue({
          nombre: data.payload.data()['nombre'],
          apellido: data.payload.data()['apellido'],
          documento: data.payload.data()['documento'],
          salario: data.payload.data()['salario'],
        })
      })
    }
  }

}
