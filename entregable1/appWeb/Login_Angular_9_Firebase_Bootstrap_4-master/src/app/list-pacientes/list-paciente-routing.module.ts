import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { ListPacientesComponent } from './list-pacientes.component';

const routes: Routes = [{ path: '', component: ListPacientesComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ListPacientesRoutingModule {}
