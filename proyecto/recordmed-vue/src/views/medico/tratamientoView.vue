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
              <h1 style="color: black">Registro de Tratamientos</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <button
                @click.stop="crearTratamiento($route.params.id)"
                class="btn btn-outline-secondary my-2 my-sm-0"
                style="border-radius: 20px"
              >
                Crear Tratamiento
              </button>
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
          

          <div v-if="this.tratamientos.length == 0">
            <div>
            <p style="color: black">El paciente no posee tratamientos.</p>
          </div>
          </div>
          <div v-else>
            <div
              class="
                table-responsive table-wrapper-scroll-y
                my-custom-scrollbar
              "
            >
              <div
                v-for="tratamiento in this.tratamientos"
                :key="tratamiento.id"
              >
                <table class="table">
                  <tbody>
                    <td>
                      <p style="color: black">{{ tratamiento.id }}</p>
                    </td>
                    <td>
                      <button
                        @click.stop="tratamientoDetail($route.params.id,tratamiento.id)"
                        class="btn btn-outline-secondary my-2 my-sm-0"
                      >
                        Detalles
                      </button>
                    </td>
                  </tbody>
                </table>
              </div>
            </div>
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
import router from "@/router";
export default {
  name: "ListUsuarios",
  data() {
    return {
      tratamientos: [],
      tratamiento: {
        id: "",
        medicamentos: [],
      },
    };
  },
  created() {
    this.getTratamientos();
  },
  methods: {
    async getTratamientos() {
      firebase
        .firestore()
        .collection("usuarios")
        .doc(this.$route.params.id)
        .collection("tratamientos")
        .onSnapshot((snap) => {
          this.tratamientos = [];
          snap.forEach((doc) => {
            var tratamiento = doc.data();
            tratamiento.id = doc.id;
            this.tratamientos.push(tratamiento);
          });
        });
    },
    tratamientoDetail(id, tratamiento) {
      router.push({ name: "tratamientoDetail", params: { id: id, tratamiento: tratamiento } });
    },
    crearTratamiento(id) {
      router.push({ name: "crearTratamiento", params: {id} });
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