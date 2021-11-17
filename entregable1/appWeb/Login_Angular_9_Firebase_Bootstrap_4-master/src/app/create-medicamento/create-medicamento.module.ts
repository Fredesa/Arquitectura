import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CreateMedicamentoRoutingModule } from './create-medicamento-routing.module';
import { CreateMedicamentoComponent } from './create-medicamento.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [CreateMedicamentoComponent],
  imports: [
    CommonModule,
    CreateMedicamentoRoutingModule,
    ReactiveFormsModule,
  ],
  exports:[
    ReactiveFormsModule,
  ]
})
export class CreateMedicamentoModule { }
