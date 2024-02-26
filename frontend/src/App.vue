<script lang="ts">
import { defineComponent } from 'vue';
import NavigationItem from '@/components/NavigationItem.vue'

export default defineComponent({
  name: 'App',
  components: {
    NavigationItem
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


