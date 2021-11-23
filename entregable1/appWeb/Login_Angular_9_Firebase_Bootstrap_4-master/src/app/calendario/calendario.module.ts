import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CalendarioRoutingModule } from './calendario-routing.module';
import { CalendarioComponent } from './calendario.component';
import { ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [CalendarioComponent],
  imports: [
    CommonModule,
    CalendarioRoutingModule,
    ReactiveFormsModule,
  ],
  exports:[
    ReactiveFormsModule,
  ],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class CalendarioModule { }
