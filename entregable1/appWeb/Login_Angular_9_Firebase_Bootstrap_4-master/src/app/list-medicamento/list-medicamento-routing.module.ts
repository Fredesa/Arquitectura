import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { ListMedicamentosComponent } from './list-medicamento.component';

const routes: Routes = [{ path: '', component: ListMedicamentosComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ListMedicamentosRoutingModule {}
