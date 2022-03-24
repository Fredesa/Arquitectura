<template>
  <div class="login">
    <div class="container" style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">
      <div class="card text-center" style="width: 20rem; border-radius:20px">
        <div class="card-body">
          <h1 style="color:black">Ingreso</h1>
          <form @submit.prevent="Login">
            <div class="form-group">
              <label for="email" style="color: black;">Correo</label>
              <input type="email" class="form-control" id="email" placeholder="Ingresa tu correo" style="text-align: center; border-radius:20px;" v-model="email">
            </div>
            <li></li>
            <div class="form-group">
              <label for="password" style="color: black;">Contraseña</label>
              <input type="password" class="form-control" id="password" placeholder="Ingresa tu contraseña" style="text-align: center; border-radius:20px;" v-model="password">
            </div>
            <li></li>
            <button type="submit" class="btn btn-outline-secondary" style="border-radius:20px;">Ingresar</button>
            <li></li>
            <p style="color:black; font-size:medium">Se te ha olvidado la contraseña: </p>
            <router-link to="/reset-password" style="text-decoration:none; font-size:medium; color: grey"> Recuperarla</router-link>
          </form>
        </div>
      </div>
    </div>
  </div>
  
</template>

<script>
import {ref} from 'vue';d
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth'
import router from '@/router';
export default {
  setup(){
    const email = ref("");
    const password = ref("");
    const Login = () => {
      firebase
          .auth()
          .signInWithEmailAndPassword(email.value, password.value)
          .then(data => {if (data.user.uid == "W8930eacw6dYAlt0FlCATBwZdxx1"){
                router.replace('/admin');
          }else{
            console.log(data),
            router.replace('/home')
          }}).catch(err => alert(err.message));
    }
    return {
      Login,
      email,
      password
    }
  }
}
</script>

<style>

</style>