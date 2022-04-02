<template>
  <div class="home">
    <br />
    <div
      class="container"
      style="
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 90vh;
      "
    >
      <div class="card text-center" style="border-radius: 20px">
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
            <li class="nav-item text-center">
              <h1 style="color: black">Registro de Pacientes</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <router-link
                to="/admin/pacientes/crear"
                class="btn btn-outline-secondary my-2 my-sm-1 float-right"
                style="border-radius: 20px"
                >Agregar paciente</router-link
              >
            </li>
            <li class="nav-item me-1">
              <router-link
                to="/admin"
                class="btn btn-outline-secondary my-2 my-sm-1 float-right"
                style="border-radius: 20px"
                >Volver</router-link
              >
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div
            class="table-responsive table-wrapper-scroll-y my-custom-scrollbar"
          >
            <table class="table">
              <thead>
                <tr>
                  <th>Identificacion</th>
                  <th>Nombre</th>
                  <th>Edad</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="paciente in this.pacientes" :key="paciente.id">
                  <td>{{ paciente.identificacion }}</td>
                  <td>{{ paciente.nombre }}</td>
                  <td>{{ paciente.edad }}</td>
                </tr>
              </tbody>
            </table>
          </div>
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
  name: "ListUsuarios",
  data() {
    return {
      pacientes: [],
      paciente: {
        nombre: "",
        id: "",
        identificacion: "",
        edad: "",
      },
    };
  },
  created() {
    this.getPacientes();
  },
  methods: {
    async getPacientes() {
      firebase
        .firestore()
        .collection("usuarios", (ref) => ref.where("rol", "==", "paciente"))
        .onSnapshot((snap) => {
          this.pacientes = [];
          snap.forEach((doc) => {
            var paciente = doc.data();
            paciente.id = doc.id;
            this.pacientes.push(paciente);
          });
        });
    },
  },
};
</script>

<style>
.my-custom-scrollbar {
  position: relative;
  height: 500px;
  overflow: auto;
}
.table-wrapper-scroll-y {
  display: block;
}
</style>