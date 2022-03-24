<template>
   <div class="resetEmail">
    <div class="container" style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">
      <div class="card text-center" style="width: 20rem; border-radius:20px">
        <div class="card-body">
          <h1 style="color:black">Recuperar contraseña</h1>
          <li></li>
          <form @submit.prevent="resetEmail">
            <div class="form-group">
              <label for="email" style="color: black;">Correo</label>
              <input type="email" class="form-control" id="email" placeholder="Ingresa tu correo" style="text-align: center" v-model="email">
            </div>
            <li></li>
            <button type="submit" class="btn btn-outline-secondary">Ingresar</button>
          </form>
        </div>
      </div>
    </div>
   </div>
</template>

<script>
import {ref} from 'vue';
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth'
import router from '@/router';
export default {
    setup(){
        const email = ref("");
        
        const resetEmail = () => {
            console.log(email.value)
            firebase
            .auth()
            .sendPasswordResetEmail(email.value)
            .then(
                window.alert('Se ha enviado al correo un link para reestablecer la contraseña.'),
                router.replace('/login')
            )
            .catch(err => console.log(err));
        }
        return {
            resetEmail,
            email
        }
    }
}
</script>

<style>

</style>