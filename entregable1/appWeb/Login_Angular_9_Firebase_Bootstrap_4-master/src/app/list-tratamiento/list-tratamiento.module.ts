import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ListTratamientosRoutingModule } from './list-tratamiento-routing.module';
import { ListTratamientosComponent } from './list-tratamiento.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListTratamientosComponent],
  imports: [CommonModule, ListTratamientosRoutingModule,
    ReactiveFormsModule],
  exports: [
    ReactiveFormsModule
  ]
})
export class ListTratamientosModule {}
