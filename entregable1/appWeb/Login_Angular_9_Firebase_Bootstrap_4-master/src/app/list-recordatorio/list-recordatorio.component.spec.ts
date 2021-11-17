import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListRecordatoriosComponent } from './list-recordatorio.component';

describe('ListRecordatoriosComponent', () => {
  let component: ListRecordatoriosComponent;
  let fixture: ComponentFixture<ListRecordatoriosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListRecordatoriosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListRecordatoriosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
