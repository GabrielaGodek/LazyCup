<script lang="ts">
import { defineComponent, computed } from 'vue';
import TileItem from '@/components/TileItem.vue';

import { useProductsStore } from '@/stores/products';
// import { ProductData } from '@/utils/types'

export default defineComponent({
  name: 'ListingView',
  components: {
    TileItem
  },
  setup() {
    const store = useProductsStore();
    const productsData = computed(() => store.products);
    return {
      productsData
    };
  }
});
</script>

<template>
  <div class="bg-white py-6 sm:py-8 lg:py-12">
    <div class="mx-auto max-w-screen-2xl px-4 md:px-8">
      <div class="mb-6 flex items-end justify-between gap-4">
        <h2 class="text-2xl font-bold text-gray-800 lg:text-3xl">Drinks</h2>
      </div>
      <div class="grid gap-x-4 gap-y-8 sm:grid-cols-2 md:gap-x-6 lg:grid-cols-3 xl:grid-cols-4">
        <template v-for="prod in productsData" :key="prod.id">
          <TileItem :data="prod" />
        </template>
      </div>
    </div>
  </div>
</template>
