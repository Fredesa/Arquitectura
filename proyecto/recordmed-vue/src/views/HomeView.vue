<template>
  <div class="home">
    <br>
    <div class="container" style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">
      <div class="card text-center" style="border-radius:20px">
        <div class="card-body">
          <h1 style="color:black">Consulta de Pacientes</h1>
          <table class="table">
            <thead>
              <tr>
                <th >Identificacion</th>
                <th >Nombre</th>
                <th >Edad</th>
                <th >Tratamiento</th>
                <th>Registro de Salud</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="paciente in this.pacientes" :key="paciente.id">
                <td>{{paciente.identificacion}}</td>
                <td>{{paciente.nombre}}</td>
                <td>{{paciente.edad}}</td>
                <td><button @click.stop="tratamiento(paciente.id)" class="btn btn-outline-secondary my-2 my-sm-0">Tratamiento</button></td>
                 <td><button @click.stop="tratamiento(paciente.id)" class="btn btn-outline-secondary my-2 my-sm-0">Registro</button></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';
import router from '@/router';
export default {
  name: 'ListUsuarios',
  data(){
    return {
      pacientes: [],
      paciente: {
        nombre:"",
        id:"",
        identificacion:"",
        edad:""
      }
    }
  },
  created(){
    this.getPacientes()
  },
  methods:{
    async getPacientes(){
      const user = firebase.auth().currentUser;
      let id = "";
      if (user) {
        firebase  
            .firestore()
            .collection('usuarios')
            .doc(user.uid)
            .onSnapshot(snap => {
              id = snap.data()['identificacion']
              firebase
                  .firestore()
                  .collection('usuarios', ref => ref.where('idMedico',"==", id ))
                  .onSnapshot(snap =>{
                    this.pacientes = [];
                    snap.forEach(doc => {
                      var paciente = doc.data()
                      paciente.id = doc.id
                      this.pacientes.push(paciente);
                    }) 
                  } )
            })
      }
    },

    tratamiento(id){
      router.push({name: 'tratamiento', params:{ id}})
    }
    
  },

  }
</script>

<style>

</style>

