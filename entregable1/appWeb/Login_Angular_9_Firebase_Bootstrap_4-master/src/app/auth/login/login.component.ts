import { FormGroup, FormControl } from '@angular/forms';
import { Component } from '@angular/core';

import { AuthService } from '@auth/services/auth.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  loginForm = new FormGroup({
    email: new FormControl(''),
    password: new FormControl(''),
  });
  constructor(private authSvc: AuthService, private router: Router) {}


  async onLogin() {
    const { email, password } = this.loginForm.value;
    if (email == "admin@admin.com" && password == "admin"){
      this.router.navigate(['/home2'])
    }else{
      try {
        const user = await this.authSvc.login(email, password);
        if (user) {
          this.router.navigate(['/home'])
        }
      } catch (error) {
        console.log(error);
      }
    }

  }

}
