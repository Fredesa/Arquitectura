import { Component, Input, OnInit } from '@angular/core';
import dayGridPlugin  from '@fullcalendar/daygrid';
import timeGridPlugin  from '@fullcalendar/timegrid';
import interactionPlugin  from '@fullcalendar/interaction';
import listPlugin  from '@fullcalendar/list';

@Component({
  selector: 'ddr-events',
  templateUrl: './events.component.html',
  styleUrls: ['./events.component.css'] 
})
export class EventsComponent implements OnInit {

public events: any;

public optionsMonth: any;
public optionsList: any;

  constructor() {
    this.events=[
      {
        "title":"prueba",
        "start":"2021-11-21T16:00:00"
      },  {
        "title":"pruebaa",
        "start":"2021-11-22T13:00:00",
        "end":"2021-11-22"
      },{
        "title":"prueba",
        "start":"2021-11-20T20:00:00"
      },{
        "title":"prueba",
        "start":"2021-08-20T20:00:00"
      }
        ];

    this.optionsMonth = {
      plugins:[dayGridPlugin,timeGridPlugin,interactionPlugin],
      defaultDate: new Date(),
      header: {
          left: 'prev,next',
          center: 'title',
          right:''
      },
      editable: false
};

this.optionsList = {
  plugins:[listPlugin,dayGridPlugin,interactionPlugin],
  defaultDate: new Date(),
  defaultView:'listWeek',
  headerToolbar: {
      center: 'Fechas de Tratamiento',
     
  },
  editable: false
};
   }

  ngOnInit(): void {
  }

}
