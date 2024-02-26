<script lang="ts">
import { defineComponent } from 'vue';
import NavigationItem from '@/components/NavigationItem.vue'
import { usePersistState } from '@/composables/usePersistState'
import { useProductsStore } from './stores/products';
// import { useCartStore } from './stores/cart';

export default defineComponent({
  name: 'App',
  components: {
    NavigationItem
  },
  setup() {
    const store = useProductsStore()
    store.useFetch('http://localhost:3030/api/products');
    usePersistState()
  }
})
</script>
<template>
  <main>
    <router-view></router-view>
  </main>
  <footer class="fixed bottom-0 left-0 right-0">
    <navigation-item></navigation-item>
  </footer>
</template>


