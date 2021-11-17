import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CreateMedicamentoComponent } from './create-medicamento.component';

const routes: Routes = [{ path: '', component:  CreateMedicamentoComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CreateMedicamentoRoutingModule { }
