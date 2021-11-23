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
      idPaciente: ['', Validators.required],
      idMedicamento: ['', Validators.required],
      cantidad: ['', Validators.required],
      hora: [''],
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
      idPaciente: this.createRecordatorio.value.idPaciente,
      idMedicamento: this.createRecordatorio.value.idMedicamento,
      cantidad: this.createRecordatorio.value.cantidad,
      hora: this.createRecordatorio.value.hora,
    }
    this.loading = true;
    this._recordatorioService.agregarRecordatorio(recordatorio).then(() => {
      this.toastr.success('El recordatorio fue registrado con exito!', 'Recordatorio Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list-recordatorio']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarRecordatorio(id: string) {

    const recordatorio: any = {
      idPaciente: this.createRecordatorio.value.idPaciente,
      idMedicamento: this.createRecordatorio.value.idMedicamento,
      cantidad: this.createRecordatorio.value.cantidad,
      hora: this.createRecordatorio.value.hora,
    }

    this.loading = true;

    this._recordatorioService.actualizarRecordatorio(id, recordatorio).then(() => {
      this.loading = false;
      this.toastr.info('El recordatorio fue modificado con exito', 'Recordatorio modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-recordatorio']);
    })
  }


  esEditar() {
    this.titulo = 'Agregar Recordatorio'
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
