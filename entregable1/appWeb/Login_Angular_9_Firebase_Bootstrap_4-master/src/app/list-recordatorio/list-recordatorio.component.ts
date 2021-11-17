import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { RecordatorioService } from 'src/app/services/Recordatorio.service';

@Component({
  selector: 'app-list-Recordatorios',
  templateUrl: './list-Recordatorio.component.html',
  styleUrls: ['./list-Recordatorio.component.css']
})
export class ListRecordatoriosComponent implements OnInit {
  recordatorios: any[] = [];

  constructor(private _recordatorioService: RecordatorioService,
              private toastr: ToastrService) {
  }

  ngOnInit(): void {
    this.getRecordatorios()
  }

  getRecordatorios() {
    this._recordatorioService.getRecordatorios().subscribe(data => {
      this.recordatorios = [];
      data.forEach((element: any) => {
        this.recordatorios.push({
          id: element.payload.doc.id,
          ...element.payload.doc.data()
        })
      });
      console.log(this.recordatorios);
    });
  }

  eliminarRecordatorio(id: string) {
    this._recordatorioService.eliminarRecordatorio(id).then(() => {
      console.log('empelado eliminado con exito');
      this.toastr.error('El Recordatorio fue eliminado con exito', 'Registro eliminado!', {
        positionClass: 'toast-bottom-right'
      });
    }).catch(error => {
      console.log(error);
    })
  }

}
