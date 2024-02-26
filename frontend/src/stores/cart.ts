import { defineStore } from 'pinia';
import { Order, CartState, localCartStorage } from '@/utils/types';

export const useCartStore = defineStore('cart', {
  state: (): CartState => {
    return{
    orders: JSON.parse(localStorage.getItem(localCartStorage) as string) ?? [],
    // orders: [] as Order[]
  }
},
  getters: {
      getCart(state: { orders: any; }){
          return state.orders
        }
    },
  actions: {
    addItem(product: Order): void {
      this.orders.push(product);
    }
  },
})
