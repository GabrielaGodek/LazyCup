
import { defineStore } from 'pinia'
// import { useProductsStore } from './products'
import { Order } from '@/utils/types'
import { localCartStorage } from '../utils/types'


export const useCartStore = defineStore('cart', {
  state: () => {
    return {
    //   products: [] as ProductData[],
      orders: JSON.parse(localStorage.getItem(localCartStorage) as string) ?? {},
    }
  },
  actions: {

    addItem(product: Order){
      console.log(product)

    }
  },
//   persist: true,
})