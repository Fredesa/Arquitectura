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
    path: 'register',
    loadChildren: () =>
      import('./auth/register/register.module').then((m) => m.RegisterModule),
  },
  {
    path: 'list',
    loadChildren: () =>
      import('./list-usuarios/list-usuarios.module').then((m) => m.ListUsuariosModule),
  },
  {
    path: 'create',
    loadChildren: () =>
      import('./create-usuario/create-usuario.module').then((m) => m.CreateUsuarioModule),
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
