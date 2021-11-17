import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { RecordatorioService } from '@app/services/Recordatorio.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-create-recordatorio',
  templateUrl: './create-recordatorio.component.html',
  styleUrls: ['./create-recordatorio.component.css']
})
export class CreateRecordatorioComponent implements OnInit {
  createRecordatorio: FormGroup;
  submitted = false;
  loading = false;
  id: string | null;
  titulo = 'Agregar Recordatorio';

  constructor(private fb: FormBuilder,
    private _recordatorioService: RecordatorioService,
    private router: Router,
    private toastr: ToastrService,
    private aRoute: ActivatedRoute) {
    this.createRecordatorio = this.fb.group({
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

  agregarEditarRecordatorio() {
    this.submitted = true;

    if (this.createRecordatorio.invalid) {
      return;
    }

    if (this.id === null) {
      this.agregarRecordatorio();
    } else {
      this.editarRecordatorio(this.id);
    }

  }

  agregarRecordatorio() {
    const recordatorio: any = {
      edad: this.createRecordatorio.value.edad,
      identificacion: this.createRecordatorio.value.identificacion,
      idMedico: this.createRecordatorio.value.idMedico,
      rol: this.createRecordatorio.value.rol,
      idTratamiento: this.createRecordatorio.value.idTratamiento,
      nombre: this.createRecordatorio.value.nombre,
      fechaCreacion: new Date(),
      fechaActualizacion: new Date()
    }
    this.loading = true;
    this._recordatorioService.agregarRecordatorio(recordatorio).then(() => {
      this.toastr.success('El recordatorio fue registrado con exito!', 'Recordatorio Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarRecordatorio(id: string) {

    const recordatorio: any = {
      nombre: this.createRecordatorio.value.nombre,
      apellido: this.createRecordatorio.value.apellido,
      documento: this.createRecordatorio.value.documento,
      salario: this.createRecordatorio.value.salario,
      fechaActualizacion: new Date()
    }

    this.loading = true;

    this._recordatorioService.actualizarRecordatorio(id, recordatorio).then(() => {
      this.loading = false;
      this.toastr.info('El recordatorio fue modificado con exito', 'Recordatorio modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-recordatorios']);
    })
  }


  esEditar() {
    this.titulo = 'Editar Recordatorio'
    if (this.id !== null) {
      this.loading = true;
      this._recordatorioService.getRecordatorio(this.id).subscribe(data => {
        this.loading = false;
        this.createRecordatorio.setValue({
          nombre: data.payload.data()['nombre'],
          apellido: data.payload.data()['apellido'],
          documento: data.payload.data()['documento'],
          salario: data.payload.data()['salario'],
        })
      })
    }
  }

}
