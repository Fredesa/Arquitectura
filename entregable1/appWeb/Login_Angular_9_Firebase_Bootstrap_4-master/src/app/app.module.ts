import { environment } from './../environments/environment';
import { NavbarComponent } from './shared/navbar/navbar.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ReactiveFormsModule } from '@angular/forms';

import { AngularFireAuthModule } from '@angular/fire/auth';
import { AngularFireModule } from '@angular/fire';
import { AngularFireStorageModule, BUCKET } from '@angular/fire/storage';
import { SendEmailComponent } from './auth/send-email/send-email.component';

import { AuthService } from '@auth/services/auth.service';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CreateUsuarioComponent } from './create-usuario/create-usuario.component';
import { ToastrModule } from 'ngx-toastr';



@NgModule({
  declarations: [AppComponent, NavbarComponent, SendEmailComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFireAuthModule,
    AngularFireStorageModule,
    ToastrModule.forRoot(),
    BrowserAnimationsModule,
  ],
  providers: [
    AuthService,
    ReactiveFormsModule,
    { provide: BUCKET, useValue: 'gs://crud-7e0a7.appspot.com' },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
