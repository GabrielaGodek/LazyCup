import { defineStore } from 'pinia';
import { Order, CartState, localCartStorage } from '@/utils/types';

export const useCartStore = defineStore('cart', {
  state: (): CartState => {
    return{
    cart: JSON.parse(localStorage.getItem(localCartStorage) as string) ?? [],
  }
},
  getters: {
      getCart(state: { cart: any; }){
          return state.cart
        }
    },
  actions: {
    addItem(product: Order): void {
      this.cart.push(product);
    }
  },
})
