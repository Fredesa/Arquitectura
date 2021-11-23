import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ListMedicamentosRoutingModule } from './list-medicamento-routing.module';
import { ListMedicamentosComponent } from './list-medicamento.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListMedicamentosComponent],
  imports: [CommonModule, ListMedicamentosRoutingModule,
    ReactiveFormsModule],
  exports: [
    ReactiveFormsModule
  ],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class ListMedicamentosModule {}
