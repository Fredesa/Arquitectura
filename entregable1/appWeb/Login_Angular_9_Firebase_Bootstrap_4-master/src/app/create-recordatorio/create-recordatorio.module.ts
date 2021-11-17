import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CreateRecordatorioRoutingModule } from './create-recordatorio-routing.module';
import { CreateRecordatorioComponent } from './create-recordatorio.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [CreateRecordatorioComponent],
  imports: [
    CommonModule,
    CreateRecordatorioRoutingModule,
    ReactiveFormsModule,
  ],
  exports:[
    ReactiveFormsModule,
  ]
})
export class CreateRecordatorioModule { }
