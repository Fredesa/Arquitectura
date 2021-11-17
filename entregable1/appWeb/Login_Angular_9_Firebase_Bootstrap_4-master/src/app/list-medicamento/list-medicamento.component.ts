import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { MedicamentoService } from 'src/app/services/Medicamento.service';

@Component({
  selector: 'app-list-Medicamentos',
  templateUrl: './list-Medicamento.component.html',
  styleUrls: ['./list-Medicamento.component.css']
})
export class ListMedicamentosComponent implements OnInit {
  medicamentos: any[] = [];

  constructor(private _medicamentoService: MedicamentoService,
              private toastr: ToastrService) {
  }

  ngOnInit(): void {
    this.getMedicamentos()
  }

  getMedicamentos() {
    this._medicamentoService.getMedicamentos().subscribe(data => {
      this.medicamentos = [];
      data.forEach((element: any) => {
        this.medicamentos.push({
          id: element.payload.doc.id,
          ...element.payload.doc.data()
        })
      });
      console.log(this.medicamentos);
    });
  }

  eliminarMedicamento(id: string) {
    this._medicamentoService.eliminarMedicamento(id).then(() => {
      console.log('empelado eliminado con exito');
      this.toastr.error('El Medicamento fue eliminado con exito', 'Registro eliminado!', {
        positionClass: 'toast-bottom-right'
      });
    }).catch(error => {
      console.log(error);
    })
  }

}
