import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateMedicamentoComponent } from './create-medicamento.component';

describe('CreateMedicamentoComponent', () => {
  let component: CreateMedicamentoComponent;
  let fixture: ComponentFixture<CreateMedicamentoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateMedicamentoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateMedicamentoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
