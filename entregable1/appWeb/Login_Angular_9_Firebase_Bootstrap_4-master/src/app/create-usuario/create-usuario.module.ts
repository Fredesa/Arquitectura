import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CreateUsuarioRoutingModule } from './create-usuario-routing.module';
import { CreateUsuarioComponent } from './create-usuario.component';


@NgModule({
  declarations: [CreateUsuarioComponent],
  imports: [
    CommonModule,
    CreateUsuarioRoutingModule
  ]
})
export class CreateUsuarioModule { }
