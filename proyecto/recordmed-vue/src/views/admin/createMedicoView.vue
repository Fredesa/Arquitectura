<template>
  <div class="createUsuario">
    <div
      class="container"
      style="
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 90vh;
      "
    >
      <div class="card text-center" style="width: 25rem; border-radius: 20px">
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
            <li class="nav-item text-center">
              <h1 style="color: black">Crear Medico</h1>
            </li>
            <li class="nav-item me-1 ms-auto">
              <router-link
                to="/admin/medicos"
                class="btn btn-outline-secondary my-sm-1"
                style="border-radius: 20px"
                >Volver</router-link
              >
            </li>
          </ul>
        </div>
        <div class="card-body">
          <form @submit.prevent="registrar">
            <div class="form-group">
              <label for="nombre" style="color: black">Nombre</label>
              <input
                type="text"
                class="form-control"
                id="nombre"
                placeholder="Ingresa el nombre del usuario"
                style="text-align: center; border-radius: 20px"
                v-model="nombre"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="identificacion" style="color: black"
                >Identificacion</label
              >
              <input
                type="number"
                class="form-control"
                id="identificacion"
                placeholder="Ingresa el numero de Identificacion del usuario"
                style="text-align: center; border-radius: 20px"
                v-model="identificacion"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="correo" style="color: black">Correo</label>
              <input
                type="email"
                class="form-control"
                id="correo"
                placeholder="Ingresa el correo del usuario"
                style="text-align: center; border-radius: 20px"
                v-model="correo"
                required
              />
            </div>
            <li></li>
            <button
              type="submit"
              class="btn btn-outline-secondary"
              style="border-radius: 20px"
            >
              Registrar
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import firebase from "firebase/compat/app";
import "firebase/compat/auth";
import "firebase/compat/firestore";
import router from "@/router";
export default {
  methods: {
    async registrar() {
      const user = await firebase
        .auth()
        .createUserWithEmailAndPassword(this.correo, this.identificacion);
      console.log(user.user.uid);
      await firebase.firestore().collection("usuarios").doc(user.user.uid).set({
        nombre: this.nombre,
        identificacion: this.identificacion,
        rol: "Medico",
        correo: this.correo,
      });
      await firebase
        .auth()
        .signInWithEmailAndPassword("admin@admin.com", "admin123")
        .then(
          alert("El usuario se ha creado correctamente"),
          router.replace("/admin/pacientes")
        );
    },
  },
};
</script>

<style>
</style>