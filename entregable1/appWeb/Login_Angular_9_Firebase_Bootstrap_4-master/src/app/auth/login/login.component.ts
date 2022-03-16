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
    try {
      const user = await this.authSvc.login(email, password);
      if (user) {
        if (user.uid == "185s8zyv06a5VmwgXVKY5z5eiAn1"){
          this.router.navigate(['/home2'])
        }else{
          this.router.navigate(['/list-user2'])
        }

      }
    } catch (error) {
      console.log(error);
    }

  }

}
