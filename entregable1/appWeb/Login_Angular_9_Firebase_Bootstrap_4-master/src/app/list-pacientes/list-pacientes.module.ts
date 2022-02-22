import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ListPacientesRoutingModule } from './list-paciente-routing.module';
import { ListPacientesComponent } from './list-pacientes.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListPacientesComponent],
  imports: [CommonModule, ListPacientesRoutingModule,
    ReactiveFormsModule],
  exports: [
    ReactiveFormsModule
  ],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class ListPacientesModule {}
