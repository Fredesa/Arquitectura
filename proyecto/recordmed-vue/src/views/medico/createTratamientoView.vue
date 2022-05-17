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
      <div class="card text-center" style="width: 40rem; border-radius: 20px">
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
            <table>
              <thead>
                <th style="color: black">Medicamento</th>
                <th style="color: black">Cantidad</th>
                <th style="color: black">Tiempo</th>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="form-group">
                      <select
                        v-model="idMedicamento"
                        id="medicamento"
                        class="form-control"
                        style="
                          text-align: center;
                          border-radius: 20px;
                          width: 15rem;
                        "
                        required
                      >
                        <option
                          class="form-control"
                          style="text-align: center; border-radius: 20px"
                          v-for="medicamento in Medicamentos"
                          :key="medicamento.id"
                          v-bind:value="medicamento.id"
                        >
                          {{ medicamento.nombre }}
                        </option>
                      </select>
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        v-model="cantidad"
                        id="cantidad"
                        type="number"
                        min="1"
                        class="form-control"
                        style="
                          text-align: center;
                          border-radius: 20px;
                          width: 5rem;
                        "
                        required
                      />
                    </div>
                  </td>
                  <td>
                    <div class="form-group">
                      <input
                        v-model="tiempo"
                        id="tiempo"
                        style="
                          text-align: center;
                          border-radius: 20px;
                          width: 7rem;
                        "
                        type="time"
                        required
                      />
                    </div>
                  </td>
                  <td>
                    <button
                      @click="
                        getMedicamento(idMedicamento);
                        getMedicamento2(idMedicamento, cantidad, tiempo);
                      "
                      class="btn btn-outline-secondary my-2 my-sm-0"
                    >
                      Agregar
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>

        </div>
        <div
          class="table-responsive table-wrapper-scroll-y my-custom-scrollbar"
        >
          <table class="table">
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
                  {{ Medicamentos2[index].cantidad }}
                </td>
                <td>
                  {{ Medicamentos2[index].tiempo }}
                </td>
              </tr>

              <p>Tiempo {{ tiempo }}</p>
              <p>Cantidad {{ cantidad }}</p>
              <p>Array {{ Medicamentos2 }}</p>
            </tbody>
          </table>
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
  data() {
    return {
      nombre: "",
      tiempo: null,
      cantidad: "",
      value: null,
      valor: [],
      Medicamentos2: [],
      Medicamentos1: [],
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
    console.log(this.Medicamentos2);
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
            var medicamento = doc.data();
            medicamento.id = doc.id;
            this.Medicamentos.push(medicamento);
          });
        });
    },
    getMedicamento(id) {
      firebase
        .firestore()
        .collection("medicamentos")
        .doc(id)
        .get()
        .then((doc) => {
          var medicamento = doc.data();
          medicamento.id = doc.id;
          this.Medicamentos1.push(medicamento);
        });
    },
    getMedicamento2(id, cantidad, tiempo) {
      this.Medicamentos2.push({ id, cantidad, tiempo });
    },
  },
};
</script>
<style src="@vueform/multiselect/themes/default.css"></style>
<style>
</style>