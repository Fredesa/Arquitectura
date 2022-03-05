import { NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Home2RoutingModule } from '@app/home2/home2-routing.module';
import { Home2Component } from '@app/home2/home2.component';

@NgModule({
  declarations: [Home2Component],
  imports: [CommonModule, Home2RoutingModule],
  schemas:[
    NO_ERRORS_SCHEMA
  ]
})
export class Home2Module {}
