import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MedicamentoService } from '@app/services/Medicamento.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-create-medicamento',
  templateUrl: './create-medicamento.component.html',
  styleUrls: ['./create-medicamento.component.css']
})
export class CreateMedicamentoComponent implements OnInit {
  createMedicamento: FormGroup;
  submitted = false;
  loading = false;
  id: string | null;
  titulo = 'Agregar Medicamento';

  constructor(private fb: FormBuilder,
    private _medicamentoService: MedicamentoService,
    private router: Router,
    private toastr: ToastrService,
    private aRoute: ActivatedRoute) {
    this.createMedicamento = this.fb.group({
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

  agregarEditarMedicamento() {
    this.submitted = true;

    if (this.createMedicamento.invalid) {
      return;
    }

    if (this.id === null) {
      this.agregarMedicamento();
    } else {
      this.editarMedicamento(this.id);
    }

  }

  agregarMedicamento() {
    const medicamento: any = {
      edad: this.createMedicamento.value.edad,
      identificacion: this.createMedicamento.value.identificacion,
      idMedico: this.createMedicamento.value.idMedico,
      rol: this.createMedicamento.value.rol,
      idTratamiento: this.createMedicamento.value.idTratamiento,
      nombre: this.createMedicamento.value.nombre,
      fechaCreacion: new Date(),
      fechaActualizacion: new Date()
    }
    this.loading = true;
    this._medicamentoService.agregarMedicamento(medicamento).then(() => {
      this.toastr.success('El medicamento fue registrado con exito!', 'Medicamento Registrado', {
        positionClass: 'toast-bottom-right'
      });
      this.loading = false;
      this.router.navigate(['/list']);
    }).catch(error => {
      console.log(error);
      this.loading = false;
    })
  }

  editarMedicamento(id: string) {

    const medicamento: any = {
      nombre: this.createMedicamento.value.nombre,
      apellido: this.createMedicamento.value.apellido,
      documento: this.createMedicamento.value.documento,
      salario: this.createMedicamento.value.salario,
      fechaActualizacion: new Date()
    }

    this.loading = true;

    this._medicamentoService.actualizarMedicamento(id, medicamento).then(() => {
      this.loading = false;
      this.toastr.info('El medicamento fue modificado con exito', 'Medicamento modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-medicamentos']);
    })
  }


  esEditar() {
    this.titulo = 'Editar Medicamento'
    if (this.id !== null) {
      this.loading = true;
      this._medicamentoService.getMedicamento(this.id).subscribe(data => {
        this.loading = false;
        this.createMedicamento.setValue({
          nombre: data.payload.data()['nombre'],
          apellido: data.payload.data()['apellido'],
          documento: data.payload.data()['documento'],
          salario: data.payload.data()['salario'],
        })
      })
    }
  }

}
