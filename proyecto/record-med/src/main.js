import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { firestorePlugin } from 'vuefire'

Vue.use(firestorePlugin)

createApp(App).use(store).use(router).mount('#app')
