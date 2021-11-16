import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CreateUsuarioComponent } from './create-usuario.component';

const routes: Routes = [{ path: '', component:  CreateUsuarioComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CreateUsuarioRoutingModule { }
