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
          <h4 style="color: black">{{ $route.params.id }}</h4>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import router from "@/router";
export default {
  
  methods:{
    volver(id) {
      router.push({ name: "tratamiento", params: { id } });
    },
  }
};
</script>

<style>
</style>