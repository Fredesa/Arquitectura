import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { TratamientoService } from 'src/app/services/Tratamiento.service';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-list-Tratamientos',
  templateUrl: './list-Tratamiento.component.html',
  styleUrls: ['./list-Tratamiento.component.css']
})
export class ListTratamientosComponent implements OnInit {
  tratamientos: any[] = [];

  constructor(private _tratamientoService: TratamientoService,
              private toastr: ToastrService,
              private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get['id']
    console.log(id)
    this.getTratamientos(id)
  }

  getTratamientos(id: string) {
    this._tratamientoService.getTratamientosPaciente(id).subscribe(data => {
      this.tratamientos = [];
      data.forEach((element: any) => {
        this.tratamientos.push({
          id: element.payload.doc.id,
          ...element.payload.doc.data()
        })
      });
      console.log(this.tratamientos);
    });
  }

  eliminarTratamiento(id: string) {
    this._tratamientoService.eliminarTratamiento(id).then(() => {
      console.log('empelado eliminado con exito');
      this.toastr.error('El Tratamiento fue eliminado con exito', 'Registro eliminado!', {
        positionClass: 'toast-bottom-right'
      });
    }).catch(error => {
      console.log(error);
    })
  }

}
