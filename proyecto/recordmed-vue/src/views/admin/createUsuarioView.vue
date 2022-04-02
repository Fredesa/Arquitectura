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
              <h1 style="color: black">Crear Paciente</h1>
            </li>
            <li class="nav-item me-1 ms-auto">
              <router-link
                to="/admin/pacientes"
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
              <label for="edad" style="color: black">Edad</label>
              <input
                type="number"
                class="form-control"
                id="edad"
                placeholder="Ingresa la edad del usuario"
                style="text-align: center; border-radius: 20px"
                v-model="edad"
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
              <label for="idMedico" style="color: black"
                >Identificacion del Medico</label
              >
              <input
                type="number"
                class="form-control"
                id="idMedico"
                placeholder="Ingresa el id del medico asociado"
                style="text-align: center; border-radius: 20px"
                v-model="idMedico"
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
export default {
  methods: {
    async registrar() {
      const user = await firebase
        .auth()
        .createUserWithEmailAndPassword(this.correo, this.identificacion);
      console.log(user.user.uid);
      await firebase.firestore().collection("usuarios").doc(user.user.uid).set({
        nombre: this.nombre,
        edad: this.edad,
        identificacion: this.identificacion,
        rol: "Paciente",
        idMedico: this.idMedico,
        correo: this.correo,
      });
    },
  },
};
</script>

<style>
</style>