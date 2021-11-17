import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { ListRecordatoriosComponent } from './list-recordatorio.component';

const routes: Routes = [{ path: '', component: ListRecordatoriosComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ListRecordatoriosRoutingModule {}
