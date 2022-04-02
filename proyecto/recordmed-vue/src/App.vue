<template>
  <div id="nav">
    <nav
      class="container navbar navbar-expand-lg navbar-light bg-light"
      style="border-radius: 20px"
    >
      <a class="navbar-brand">
        <img
          src="../public/Captura.svg"
          alt=""
          width="30"
          height="24"
          class="d-inline-block align-text-top"
        />
        RecordMed
      </a>
      <div>
        <ul class="navbar-nav ml-auto">
          <router-link
            class="btn btn-outline-secondary my-2 my-sm-0 float-right"
            style="border-radius: 20px"
            to="/"
            >Login</router-link
          >
        </ul>
      </div>
    </nav>
  </div>
  <router-view />
</template>

<script>
import { onBeforeMount } from "vue";
import { useRouter, useRoute } from "vue-router";
import firebase from "firebase/compat/app";
import "firebase/compat/auth";
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters({
      user: "user",
    }),
  },
  setup() {
    const router = useRouter();
    const route = useRoute();

    onBeforeMount(() => {
      firebase.auth().onAuthStateChanged((user) => {
        if (!user) {
          router.replace("/login");
        } else if (route.path == "/login" || route.path == "/reset-password") {
          router.replace("/");
        }
      });
    });
  },
  methods: {
    signOut() {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$router.replace({
            name: "home",
          });
        });
    },
  },
};
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
a {
  color: inherit;
}
</style>
