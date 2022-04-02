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
              <h1 style="color: black">Medicamentos</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <router-link
                to="/admin/medicamentos/crear"
                class="btn btn-outline-secondary my-sm-1"
                style="border-radius: 20px"
                >Agregar Medicamento</router-link
              >
            </li>
            <li class="nav-item me-1">
              <router-link
                to="/admin"
                class="btn btn-outline-secondary my-sm-1"
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
                  <th>Nombre</th>
                  <th>Laboratorio</th>
                  <th>Cantidad</th>
                  <th>Concentracion</th>
                  <th>Forma farmaceutica</th>
                  <th>Unidad de Medida</th>
                  <th>Via de Administracion</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="medicamento in this.Medicamentos"
                  :key="medicamento.id"
                >
                  <td>{{ medicamento.nombre }}</td>
                  <td>{{ medicamento.laboratorio }}</td>
                  <td>{{ medicamento.cantidad }}</td>
                  <td>{{ medicamento.concentracion }}</td>
                  <td>{{ medicamento.formafarmaceutica }}</td>
                  <td>{{ medicamento.unidadmedida }}</td>
                  <td>{{ medicamento.viaadministracion }}</td>
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
      Medicamentos: [],
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
    this.getMedicamentos();
  },
  methods: {
    async getMedicamentos() {
      firebase
        .firestore()
        .collection("medicamentos")
        .onSnapshot((snap) => {
          this.Medicamentos = [];
          snap.forEach((doc) => {
            var medicamento = doc.data();
            medicamento.id = doc.id;
            this.Medicamentos.push(medicamento);
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
