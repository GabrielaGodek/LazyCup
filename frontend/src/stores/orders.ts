import { defineStore } from 'pinia';
import { OrderData, OrderState, localOrdersStorage } from '@/utils/types';

export const useOrdersStore = defineStore('orders', {
  state: (): OrderState => {
    return{
    orders: JSON.parse(localStorage.getItem(localOrdersStorage) as string) ?? [],
  }
},
  actions: {
    makeOrder(productList: OrderData[]): void {
        if(productList.length > 0) {
            productList.forEach((product:OrderData) => {
                this.orders.push(product);
            })
        }
    }
  },
})
