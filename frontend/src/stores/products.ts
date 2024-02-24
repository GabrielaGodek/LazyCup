
import { defineStore } from 'pinia'
import { ProductData, ProductsState } from '@/utils/types'

export const useProductsStore = defineStore('products', {
  state: (): ProductsState => ({
    products: [],
  }),
  // getters: {
  //     getProducts(state){
  //         return state.products
  //       }
  //   },
  actions: {
    async useFetch() {
      try {
       const response = await fetch('http://localhost:3030/api/products');
        this.products = await response.json()
        // const data = await response.json();
        return this.products as ProductData[];
      } catch (error) {
        
        
        return error
      }
    },
  },
})