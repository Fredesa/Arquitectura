import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ListRecordatoriosRoutingModule } from './list-recordatorio-routing.module';
import { ListRecordatoriosComponent } from './list-recordatorio.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListRecordatoriosComponent],
  imports: [CommonModule, ListRecordatoriosRoutingModule,
    ReactiveFormsModule],
  exports: [
    ReactiveFormsModule
  ],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class ListRecordatoriosModule {}
