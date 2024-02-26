<template>
  <div class="bg-white py-6 sm:py-8 lg:py-12">
    <div class="mx-auto max-w-screen-xl px-4 md:px-8">
      <div v-if="getProduct?.id" class="grid gap-8 md:grid-cols-2">
        <div class="grid gap-4 lg:grid-cols-5">

          <div class="relative overflow-hidden rounded-lg bg-gray-100 lg:col-span-4">
            <img :src="getProduct.image" loading="lazy" :alt="getProduct.title"
              class="h-full w-full object-cover object-center" />

            <span v-if="getProduct?.salePrice !== 0"
              class="absolute left-0 top-0 rounded-br-lg bg-error px-3 py-1.5 text-lg uppercase tracking-wider text-base">{{
                getDiff(getProduct?.salePrice, getProduct?.price) }}%</span>

            <!-- <a href="#"
              class="absolute right-4 top-4 inline-block rounded-lg border bg-white px-3.5 py-3 text-center text-sm font-semibold text-gray-500 outline-none ring-indigo-300 transition duration-100 hover:bg-gray-100 focus-visible:ring active:text-gray-700 md:text-base">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
            </a> -->
          </div>
        </div>

        <div class="md:py-8">

          <div class="mb-2 md:mb-3">
            <span class="mb-0.5 inline-block text-success font-semibold">{{ getProduct.ingredients }}</span>
            <h2 class="text-2xl font-bold text-gray-800 lg:text-3xl tracking-wide">{{ getProduct?.title }}</h2>
          </div>

          <div class="mb-6  gap-2 text-gray-500" v-if="getProduct?.proportions !== 'N/A'">
            <div class="text-sm font-semibold uppercase md:text-secondary tracking-wide">Proportions:</div>
            <div class="mb-3 text-sm font-semibold  md:text-secondary">{{ getProduct?.proportions
            }}</div>

          </div>
          <div class="mb-8 md:mb-10">
            <v-card-text>
              <span class="subheading">Select size</span>

              <v-chip-group v-model="selectedSize" selected-class="text-green-darken-3" mandatory>
                <v-chip v-for="size in sizes" :key="size" :value="size" size="large" density="comfortable" variant="outlined">
                  {{ size }}
                </v-chip>
              </v-chip-group>
            </v-card-text>


          </div>
          <div class="mb-4 md:mb-6">
            <p class="justify">{{ getProduct?.description }}</p>
          </div>

          <div class="mb-4 flex gap-4 align-bottom">
            <template v-if="getProduct?.salePrice !== 0">
              <span class="font-bold text-error lg:text-lg">{{ getProduct?.salePrice }} PLN</span>
              <span class="line-through">{{ getProduct?.price }} PLN</span>
            </template>
            <span class="font-bold self-end lg:text-lg" v-else>{{ getProduct?.price }} PLN</span>
          </div>



          <div class="flex gap-2.5">
            <div @click="addToCart(getProduct)"
              class="inline-block flex-1 rounded-lg text-secondary px-8 py-3 text-center text-sm font-semibold text-base outline-none ring-detail transition duration-100 hover:bg-success focus-visible:ring active:bg-secondary sm:flex-none ">
              Add
              to cart</div>

            <div @click="formatOrder(getProduct)"
              class="inline-block rounded-lg bg-secondary  px-8 py-3 text-center text-sm font-semibold text-base outline-none ring-detail transition duration-100 hover:bg-success focus-visible:ring active:text-secondary ">
              Buy
              now</div>
          </div>

        </div>

      </div>
      <div class="error" v-else>
        <not-found-item></not-found-item>
      </div>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent, onMounted, ref } from 'vue';
import { useRouter } from 'vue-router'
import { useProductsStore } from '@/stores/products';
import { useCartStore } from '@/stores/cart';
import NotFoundItem from '@/components/NotFoundItem.vue';
import { ProductData, Order, AvailableSizes } from '@/utils/types'

export default defineComponent({
  name: 'ProductView',
  components: {
    NotFoundItem
  },
  setup() {
    const getProduct = ref<ProductData | null>(null);
    const router = useRouter()
    const coffeeId = Number(router.currentRoute.value.params.id)
    const cart = useCartStore();

    const selectedSize = ref()
    const sizes: AvailableSizes[] = [
      'S',
      'M',
      'L',
    ]
    const getDiff = (salePrice: number, price: number): number => {
      return 100 - ((salePrice * 100) / price)
    }
    const formatOrder = (product: ProductData) => {
      const productToOrder: Order = {
        ...product,
        date: new Date().toLocaleString(),
        amount: 1,
        size: selectedSize.value
      }

      cart.addItem(productToOrder)

      // router.push()
    }

    const addToCart = (product: ProductData) => {
      const productToOrder: Order = {
        ...product,
        date: new Date().toLocaleString(),
        amount: 1,
        size: selectedSize.value
      }

      cart.addItem(productToOrder)
    }


    onMounted(() => {
      const store = useProductsStore();
      getProduct.value = store.products.find(el => el.id === coffeeId) || null
      // console.log(getProduct.value)
    });

    return {
      getProduct,
      getDiff,
      cart,
      formatOrder,
      selectedSize,
      addToCart,
      sizes
    };
  }
})
</script>
<style>

</style>