import { NgModule } from '@angular/core';
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
  ]
})
export class ListMedicamentosModule {}
