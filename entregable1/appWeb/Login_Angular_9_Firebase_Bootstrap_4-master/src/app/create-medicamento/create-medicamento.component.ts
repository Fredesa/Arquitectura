import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
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
      id: ['',Validators.required],
      nombre: ['', Validators.required],
      laboratorio: ['', Validators.required],
      cantidad: ['', Validators.required],
      concentracion: ['', Validators.required],
      formafarmaceutica: ['', Validators.required],
      unidadmedida: ['', Validators.required],
      viaadministracion: ['', Validators.required],
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
      id: this.createMedicamento.value.id,
      nombre: this.createMedicamento.value.nombre,
      laboratorio: this.createMedicamento.value.laboratorio,
      cantidad: this.createMedicamento.value.cantidad,
      concentracion: this.createMedicamento.value.concentracion,
      formafarmaceutica: this.createMedicamento.value.formafarmaceutica,
      unidadmedida: this.createMedicamento.value.unidadmedida,
      viaadministracion: this.createMedicamento.value.viaadministracion,
    }
    this.loading = true;
    console.log(medicamento)
    this._medicamentoService.agregarMedicamento(medicamento.id,medicamento).then(() => {
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
      nnombre: this.createMedicamento.value.nombre,
      laboratorio: this.createMedicamento.value.laboratorio,
      cantidad: this.createMedicamento.value.cantidad,
      concentracion: this.createMedicamento.value.concentracion,
      formafarmaceutica: this.createMedicamento.value.formafarmaceutica,
      unidadmedida: this.createMedicamento.value.unidadmedida,
      viaadministracion: this.createMedicamento.value.viaadministracion,
    }

    this.loading = true;

    this._medicamentoService.actualizarMedicamento(id, medicamento).then(() => {
      this.loading = false;
      this.toastr.info('El medicamento fue modificado con exito', 'Medicamento modificado', {
        positionClass: 'toast-bottom-right'
      })
      this.router.navigate(['/list-medicamento']);
    })
  }


  esEditar() {
    this.titulo = 'Crear Medicamento'
    if (this.id !== null) {
      this.loading = true;
      this._medicamentoService.getMedicamento(this.id).subscribe(data => {
        this.loading = false;
        this.createMedicamento.setValue({
          nombre: this.createMedicamento.value.nombre,
      laboratorio: this.createMedicamento.value.laboratorio,
      cantidad: this.createMedicamento.value.cantidad,
      concentracion: this.createMedicamento.value.concentracion,
      formafarmaceutica: this.createMedicamento.value.formafarmaceutica,
      unidadmedida: this.createMedicamento.value.unidadmedida,
      viaadministracion: this.createMedicamento.value.viaadministracion,
        })
      })
    }
  }

}
