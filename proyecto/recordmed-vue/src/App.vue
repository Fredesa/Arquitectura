<template>
<div id="nav">
 <nav class="container navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
      <img src="../public/Captura.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
      RecordMed
    </a>
        <div class="navbar-nav ms-auto">
            <router-link to="/Login" class="nav-item nav-link">Login</router-link>
    </div>
</nav>
 </div>
  <router-view/>
</template>

<script>
  import { onBeforeMount } from 'vue';
  import { useRouter, useRoute} from 'vue-router';
  import firebase from 'firebase/compat/app';
  import 'firebase/compat/auth';

  export default {
    setup(){
      const router = useRouter();
      const route = useRoute();

      onBeforeMount(() => {
        firebase.auth().onAuthStateChanged((user) => {
          if (!user){
            router.replace('/login');
          } else if (route.path == '/login'|| route.path == '/reset-password'){
            router.replace('/');
          }
        })
      })
    }
  }
</script>


<style lang="scss">
body {
  background: #2c3e50;
  color: white;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
a{
  color: inherit;
}


</style>
