<template>
  <div class="tratamiento">
    <div
      class="container"
      style="
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 90vh;
      "
    >
      <div class="card text-center" style="width: 20rem; border-radius: 20px">
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
            <li class="nav-item">
              <h1 style="color: black">Bienvenido</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <button
                @click.stop="crearTratamiento($route.params.id)"
                class="btn btn-outline-secondary my-2 my-sm-0"
                style="border-radius: 20px"
              >
                Crear Tratamiento
              </button>
              >
            </li>
            <li class="nav-item me-1">
              <router-link
                to="/medico"
                class="btn btn-outline-secondary my-2 my-sm-1 float-right"
                style="border-radius: 20px"
                >Volver</router-link
              >
            </li>
          </ul>
        </div>
        <div class="card-body">
          <h4 style="color: black">{{ $route.params.id }}</h4>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import router from "@/router";
import firebase from "firebase/compat/app";
import "firebase/compat/auth";
import "firebase/compat/firestore";

export default {
  methods: {
    crearTratamiento(id) {
      router.push({ name: "crearTratamiento", params: { id } });
    },
    getUsuario(id) {
        firebase
          .firestore()
          .collection("usuarios")
          .doc(id)
          .get()
          .then((doc) => {
            console.log(doc.data());
          });
      },
  },
  created(){
    this.getUsuario(this.$route.params.id)
  }
};
</script>

<style>
</style>