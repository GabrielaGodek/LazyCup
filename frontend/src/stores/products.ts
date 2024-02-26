
import { defineStore } from 'pinia'
import { ProductData } from '@/utils/types'

export const useProductsStore = defineStore('products', {
  state: () => {
    return {
      products: [] as ProductData[],
      // orders: [] as Order[]
    }
  },
  getters: {
      getProducts(state){
          return state.products
        }
    },
  actions: {
    async useFetch(url:string) {
      try {
       const response = await fetch(url);
        this.products = (await response.json()).data
        return this.products;
      } catch (error) {
        
        
        return error
      }
    },
    // addToCart(product: Order){
    //   console.log(product)

    // }
  },
  // persist: true,
})