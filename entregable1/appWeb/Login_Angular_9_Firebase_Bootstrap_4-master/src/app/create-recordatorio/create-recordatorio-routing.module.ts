import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CreateRecordatorioComponent } from './create-recordatorio.component';

const routes: Routes = [{ path: '', component:  CreateRecordatorioComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CreateRecordatorioRoutingModule { }
