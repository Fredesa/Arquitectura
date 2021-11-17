import { CanAdminGuard } from '@auth/guards/can-admin.guard';

import { SendEmailComponent } from '@auth/send-email/send-email.component';
import { ListUsuariosComponent } from './list-usuarios/list-usuarios.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full',
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then((m) => m.HomeModule),
  },
  {
    path: 'login',
    loadChildren: () =>
      import('./auth/login/login.module').then((m) => m.LoginModule),
  },
  {
    path: 'list-user',
    loadChildren: () =>
      import('./list-usuarios/list-usuarios.module').then((m) => m.ListUsuariosModule),
  },
  {
    path: 'create-user',
    loadChildren: () =>
      import('./create-usuario/create-usuario.module').then((m) => m.CreateUsuarioModule),
  },
  {
    path: 'list-medicamento',
    loadChildren: () =>
      import('./list-medicamento/list-medicamento.module').then((m) => m.ListMedicamentosModule),
  },
  {
    path: 'create-medicamento',
    loadChildren: () =>
      import('./create-medicamento/create-medicamento.module').then((m) => m.CreateMedicamentoModule),
  },
  {
    path: 'list-recordatorio',
    loadChildren: () =>
      import('./list-recordatorio/list-recordatorio.module').then((m) => m.ListRecordatoriosModule),
  },
  {
    path: 'create-recordatorio',
    loadChildren: () =>
      import('./create-recordatorio/create-recordatorio.module').then((m) => m.CreateRecordatorioModule),
  },
  {
    path: 'list-tratamiento',
    loadChildren: () =>
      import('./list-tratamiento/list-tratamiento.module').then((m) => m.ListTratamientosModule),
  },
  {
    path: 'create-tratamiento',
    loadChildren: () =>
      import('./create-tratamiento/create-tratamiento.module').then((m) => m.CreateTratamientoModule),
  },
  {
    path: 'verification-email',
    component: SendEmailComponent,
  },
  {
    path: 'forgot-password',
    loadChildren: () =>
      import('./auth/forgot-password/forgot-password.module').then(
        (m) => m.ForgotPasswordModule
      ),
  },
  {
    path: 'admin',
    loadChildren: () =>
      import('./admin/admin.module').then((m) => m.AdminModule),
    canActivate: [CanAdminGuard],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
