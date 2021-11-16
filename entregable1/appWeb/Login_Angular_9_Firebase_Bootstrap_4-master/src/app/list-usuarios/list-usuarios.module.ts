import { NgModule } from '@angular/core';
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
  ]
})
export class ListUsuariosModule {}
