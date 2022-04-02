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
      <div class="card text-center" style="width: 27rem; border-radius: 20px">
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
            <li class="nav-item text-center">
              <h1 style="color: black">Agregar Medicamento</h1>
            </li>
            <li class="nav-item me-1 ms-auto">
              <router-link
                to="/admin/medicamentos"
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
                placeholder="Ingresa el nombre del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="nombre"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="laboratorio" style="color: black">Laboratorio</label>
              <input
                type="text"
                class="form-control"
                id="laboratorio"
                placeholder="Ingresa el nombre del laboratorio"
                style="text-align: center; border-radius: 20px"
                v-model="laboratorio"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="cantidad" style="color: black">Cantidad</label>
              <input
                type="number"
                class="form-control"
                id="cantidad"
                placeholder="Ingresa la cantidad del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="cantidad"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="concentracion" style="color: black"
                >Concentracion del Medicamento</label
              >
              <input
                type="text"
                class="form-control"
                id="concentracion"
                placeholder="Ingresa la concentracion del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="concentracion"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="formaFarmaceutica" style="color: black"
                >Forma farmaceutica</label
              >
              <input
                type="text"
                class="form-control"
                id="formaFarmaceutica"
                placeholder="Ingresa la forma farmaceutica del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="formaFarmaceutica"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="unidadMedida" style="color: black"
                >Unidad de Medida</label
              >
              <input
                type="text"
                class="form-control"
                id="unidadMedida"
                placeholder="Ingresa la unidad de medida del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="unidadMedida"
                required
              />
            </div>
            <li></li>
            <div class="form-group">
              <label for="viaAdministracion" style="color: black"
                >Via de Administracion</label
              >
              <input
                type="text"
                class="form-control"
                id="viaAdministracion"
                placeholder="Ingresa la via de administracion del medicamento"
                style="text-align: center; border-radius: 20px"
                v-model="viaAdministracion"
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
      await firebase
        .firestore()
        .collection("medicamentos")
        .doc(user.user.uid)
        .set({
          nombre: this.nombre,
          laboratorio: this.laboratorio,
          cantidad: this.cantidad,
          concentracion: this.concentracion,
          formafarmaceutica: this.formafarmaceutica,
          unidadmedida: this.unidadmedida,
          viaadministracion: this.viaadministracion,
        });
    },
  },
};
</script>

<style>
</style>