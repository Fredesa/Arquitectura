import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {MatSelectModule} from '@angular/material/select';

import { CreateUsuarioRoutingModule } from './create-usuario-routing.module';
import { CreateUsuarioComponent } from './create-usuario.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';


@NgModule({
  declarations: [CreateUsuarioComponent],
  imports: [
    CommonModule,
    CreateUsuarioRoutingModule,
    ReactiveFormsModule,
    MatSelectModule,
    FormsModule
  ],
  exports:[
    ReactiveFormsModule,

  ]
})
export class CreateUsuarioModule { }
