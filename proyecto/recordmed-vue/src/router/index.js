import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/medico/HomeView.vue'

const routes = [
  {
    path: '/medico',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('../views/AboutView.vue')
  },
  {
    path: '/',
    name: 'Login',
    component: () => import('../views/LoginView.vue')
  },
  {
    path: '/reset-password',
    name: 'resetEmail',
    component: () => import('../views/resetEmail.vue')
  },
  {
    path: '/admin',
    name: 'admin',
    component: () => import('../views/admin/adminView.vue')
  },
  {
    path: '/medico/tratamiento/:id',
    name: 'tratamiento',
    component: () => import('../views/medico/tratamientoView.vue')
  },
  {
    path: '/admin/medicamentos',
    name: 'medicamento',
    component: () => import('../views/admin/medicamentoView.vue')
  },
  {
    path: '/admin/medicos',
    name: 'medico',
    component: () => import('../views/admin/medicoView.vue')
  },
  {
    path: '/admin/pacientes',
    name: 'paciente',
    component: () => import('../views/admin/usuarioView.vue')
  },
  {
    path: '/admin/medicamentos/crear',
    name: 'crearMedicamento',
    component: () => import('../views/admin/createMedicamentoView.vue')
  },
  {
    path: '/admin/medicos/crear',
    name: 'crearMedico',
    component: () => import('../views/admin/createMedicoView.vue')
  },
  {
    path: '/admin/pacientes/crear',
    name: 'crearPaciente',
    component: () => import('../views/admin/createUsuarioView.vue')
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
