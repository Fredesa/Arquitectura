import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CreateTratamientoRoutingModule } from './create-tratamiento-routing.module';
import { CreateTratamientoComponent } from './create-tratamiento.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [CreateTratamientoComponent],
  imports: [
    CommonModule,
    CreateTratamientoRoutingModule,
    ReactiveFormsModule,
  ],
  exports:[
    ReactiveFormsModule,
  ]
})
export class CreateTratamientoModule { }
