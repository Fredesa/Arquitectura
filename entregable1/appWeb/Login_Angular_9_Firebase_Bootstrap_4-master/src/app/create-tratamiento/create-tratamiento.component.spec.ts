import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateTratamientoComponent } from './create-tratamiento.component';

describe('CreateTratamientoComponent', () => {
  let component: CreateTratamientoComponent;
  let fixture: ComponentFixture<CreateTratamientoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateTratamientoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateTratamientoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
