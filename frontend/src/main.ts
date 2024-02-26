import { createApp } from 'vue'
import './style.css'
import router from './router'
import {createPinia} from 'pinia'
import App from './App.vue'
// import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

import 'vuetify/styles'
import {createVuetify} from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

const vuetify = createVuetify({
  components,
  directives,
})
const pinia = createPinia()
// pinia.use(piniaPluginPersistedstate)
createApp(App).use(router).use(vuetify).use(pinia).mount('#app')
