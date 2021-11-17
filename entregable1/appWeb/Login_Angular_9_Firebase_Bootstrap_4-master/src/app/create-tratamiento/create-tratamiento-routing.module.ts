import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CreateTratamientoComponent } from './create-tratamiento.component';

const routes: Routes = [{ path: '', component:  CreateTratamientoComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CreateTratamientoRoutingModule { }
