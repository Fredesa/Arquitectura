import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ListUsuariosRoutingModule } from './list-usuario-routing.module';
import { ListUsuariosComponent } from './list-usuarios.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ListUsuariosComponent],
  imports: [CommonModule, ListUsuariosRoutingModule,
    ReactiveFormsModule],
  exports: [
    ReactiveFormsModule
  ],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class ListUsuariosModule {}
