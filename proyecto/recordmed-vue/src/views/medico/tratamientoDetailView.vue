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
            <li class="nav-item">
              <h1 style="color: black">{{ $route.params.tratamiento }}</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <button
                @click.stop="volver()"
                class="btn btn-outline-secondary my-2 my-sm-0"
                style="border-radius: 20px"
              >
                Volver
              </button>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div
              class="
                table-responsive table-wrapper-scroll-y
                my-custom-scrollbar
              "
            >
              <table class="table" style="height: 10rem">
                <thead>
                  <tr>
                    <th>Nombre del Medicamento</th>
                    <th>Cantidad</th>
                    <th>Tiempo entre medicamento</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(medicamento, index) in this.Medicamentos1"
                    :key="medicamento.id"
                  >
                    <td>
                      {{ medicamento.nombre }}
                    </td>
                    <td>
                      {{ tratamiento.medicamentos[index].cantidad }}
                    </td>
                    <td>
                      {{ tratamiento.medicamentos[index].tiempo }}
                    </td>
                    <td>
                      {{ medicamento.concentracion }}
                    </td>
                    <td>
                      {{ medicamento.viaadministracion }}
                    </td>

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
import router from "@/router";
export default {
  name: "ListUsuarios",
  data() {
    return {
      ids: [],
      tratamientoid: "",
      tratamientos: [],
      Medicamentos1: [],
      tratamiento: {
        id: "",
        medicamentos: [],
      },
      medicamento: {
        nombre: "",
        laboratorio: "",
        cantidad: "",
        concentracion: "",
        formafarmaceutica: "",
        unidadmedida: "",
        viaadministracion: "",
      },
    };
  },
  created() {
    this.getTratamientos();
  },
  methods: {
    volver() {
      router.push({ name: "tratamiento", params: this.$route.params.id });
    },
    async getTratamientos() {
      firebase
        .firestore()
        .collection("usuarios")
        .doc(this.$route.params.id)
        .collection("tratamientos")
        .doc(this.$route.params.tratamiento)
        .get()
        .then((doc) => {
          this.tratamiento = doc.data();
          for (var med of this.tratamiento.medicamentos){
            this.getMedicamento(med.id)
          }
        });
    },
    async getMedicamento(id) {

        firebase
          .firestore()
          .collection("medicamentos")
          .doc(id)
          .get()
          .then((doc) => {
            var medicamento = doc.data();
            medicamento.id = doc.id;
            console.log(medicamento)
            this.Medicamentos1.push(medicamento);
          });
        
    },
    tratamientoDetail(id, tratamiento) {
      router.push({
        name: "tratamientoDetail",
        params: { id: id, tratamiento: tratamiento },
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