import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CreateUsuarioRoutingModule } from './create-usuario-routing.module';
import { CreateUsuarioComponent } from './create-usuario.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [CreateUsuarioComponent],
  imports: [
    CommonModule,
    CreateUsuarioRoutingModule,
    ReactiveFormsModule,
  ],
  exports:[
    ReactiveFormsModule,
  ]
})
export class CreateUsuarioModule { }
