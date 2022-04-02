<template>
  <div class="admin">
    <div
      class="container"
      style="
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 90vh;
      "
    >
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
          <div
            class="card text-center"
            style="width: 20rem; border-radius: 20px"
          >
            <br />
            <img
              src="../../../public/usuario.svg"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <a
                href="/admin/pacientes"
                class="stretched-link"
                style="
                  color: black;
                  text-decoration: none;
                  font-size: 40px;
                  font-weight: 500;
                "
                >Pacientes</a
              >
            </div>
          </div>
        </div>
        <div class="col">
          <div
            class="card text-center"
            style="width: 20rem; border-radius: 20px"
          >
            <br />
            <img
              src="../../../public/medico.svg"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <a
                href="/admin/medicos"
                class="stretched-link"
                style="
                  color: black;
                  text-decoration: none;
                  font-size: 40px;
                  font-weight: 500;
                "
                >Doctores</a
              >
            </div>
          </div>
        </div>
        <div class="col">
          <div
            class="card text-center"
            style="width: 20rem; border-radius: 20px"
          >
            <br />
            <img
              src="../../../public/medicina.svg"
              class="card-img-top"
              alt="..."
            />
            <div class="card-body">
              <a
                href="/admin/medicamentos"
                class="stretched-link"
                style="
                  color: black;
                  text-decoration: none;
                  font-size: 40px;
                  font-weight: 500;
                "
                >Medicamentos</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
</style>