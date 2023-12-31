
import { createApp } from 'vue'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faHeart as faSolidHeart } from '@fortawesome/free-solid-svg-icons'
import { faHeart } from '@fortawesome/free-regular-svg-icons'
import { faMugSaucer } from '@fortawesome/free-solid-svg-icons'
import { faCartShopping } from '@fortawesome/free-solid-svg-icons'
import { faCircleCheck } from '@fortawesome/free-solid-svg-icons'
import { faList } from '@fortawesome/free-solid-svg-icons'

// import { registerSW } from "virtual:pwa-register";

import progressBar from './includes/progressBar'
import "nprogress/nprogress.css"

import '@/scss/style.css'

import App from './App.vue'
import router from './router'
import pinia from './store/pinia'

// if ('serviceWorker' in navigator) {
//     registerSW({
//         immediate: true
//     })
// }

const app = createApp(App)

library.add(faHeart, faSolidHeart, faList, faMugSaucer, faCartShopping, faCircleCheck)
app.component('font-awesome-icon', FontAwesomeIcon)

app.use(pinia)
app.use(router)
progressBar(router)

app.mount('#app')

