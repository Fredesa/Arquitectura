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
      idMedicamento: ['',Validators.required],
      idPaciente:['',Validators.required],
      tipoAdministracion:['',Validators.required],
      Dosis:['',Validators.required],
      fechaInicio: ['', Validators.required],
      fechaFin: ['', Validators.required],
    

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
      nombre: this.createTratamiento.value.nombre,
      idMedicamento: this.createTratamiento.value.idMedicamento,
      idPaciente: this.createTratamiento.value.idPaciente,
      tipoAdministracion: this.createTratamiento.value.tipoAdministracion,
      Dosis: this.createTratamiento.value.Dosis,
      fechaInicio: firebase.f  (new Date(this.createTratamiento.value.fechaInicio)).getTime(),
      fechaFin: (new Date(this.createTratamiento.value.fechaFin)).getTime(),
    }
    this.loading = true;
    this._tratamientoService.agregarTratamiento(tratamiento).then(() => {
      this.toastr.success('El tratamiento fue registrado con exito!', 'Tratamiento Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list-tratamiento']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarTratamiento(id: string) {

    const tratamiento: any = {
      nombre: this.createTratamiento.value.nombre,
      idMedicamento: this.createTratamiento.value.idMedicamento,
      idPaciente: this.createTratamiento.value.idPaciente,
      tipoAdministracion: this.createTratamiento.value.tipoAdministracion,
      Dosis: this.createTratamiento.value.Dosis,
      fechaInicio: this.createTratamiento.value.fechaInicio,
      fechaFin: this.createTratamiento.value.fechaFin,
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
    this.titulo = 'Agregar Tratamiento'
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
