import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { ListTratamientosComponent } from './list-tratamiento.component';

const routes: Routes = [{ path: '', component: ListTratamientosComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ListTratamientosRoutingModule {}
