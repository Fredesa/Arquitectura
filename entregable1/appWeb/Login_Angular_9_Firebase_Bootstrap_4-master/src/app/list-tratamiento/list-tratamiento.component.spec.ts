import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListTratamientosComponent } from './list-tratamiento.component';

describe('ListTratamientosComponent', () => {
  let component: ListTratamientosComponent;
  let fixture: ComponentFixture<ListTratamientosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListTratamientosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListTratamientosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
