import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListMedicamentosComponent } from './list-medicamento.component';

describe('ListMedicamentosComponent', () => {
  let component: ListMedicamentosComponent;
  let fixture: ComponentFixture<ListMedicamentosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListMedicamentosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListMedicamentosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
