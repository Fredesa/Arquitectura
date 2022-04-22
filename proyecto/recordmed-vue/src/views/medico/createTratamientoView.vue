<template>
  <div class="create-tratamiento">
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
              <h1 style="color: black">Tratamiento</h1>
            </li>
            <li class="nav-item me-3 ms-auto">
              <button
                @click.stop="volver($route.params.id)"
                class="btn btn-outline-secondary my-2 my-sm-0"
                style="border-radius: 20px"
              >
                Volver
              </button>
              >
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="form-group">
            <label for="medicamento" style="color: black">Medicamento</label>
            <select
              v-model="idMedicamento"
              id="medicamento"
              class="form-control"
              style="text-align: center; border-radius: 20px"
            >
              <option
                class="form-control"
                style="text-align: center; border-radius: 20px"
                v-for="medicamento in Medicamentos"
                :key="medicamento.id"
              >
                {{ medicamento.nombre }}
              </option>
            </select>
          </div>
          <div class="form-group">
            <label for="medicamento1">Medicamento</label>
            <Multiselect v-model="idMedicamento" :options="options"/>
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
import Multiselect from "@vueform/multiselect";
export default {
  components: {
    Multiselect,
  },
  data() {
    return {
      value: null,
      options: ["Batman", "Robin", "Joker"],
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
    volver(id) {
      router.push({ name: "tratamiento", params: { id } });
    },
    async getMedicamentos() {
      firebase
        .firestore()
        .collection("medicamentos")
        .onSnapshot((snap) => {
          this.Medicamentos = [];
          snap.forEach((doc) => {
            var value = doc.id;
            var label = doc.data().nombre;
            this.options.value.push(value);
            this.options.label.push(label);
          },
          console.log(this.options));
        })
    },
  },
};
</script>
<style src="@vueform/multiselect/themes/default.css"></style>
<style>
</style>