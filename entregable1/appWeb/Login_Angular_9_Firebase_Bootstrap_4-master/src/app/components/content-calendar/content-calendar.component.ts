import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ddr-content-calendar',
  templateUrl: './content-calendar.component.html',
  styleUrls: ['./content-calendar.component.scss']
})
export class ContentCalendarComponent implements OnInit {
 
  public events:any;
  constructor() { }

  ngOnInit(): void {
  }

}
