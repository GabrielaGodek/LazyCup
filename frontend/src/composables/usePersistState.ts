import { onUnmounted } from 'vue'
import { useCartStore } from '../stores/cart'
import { useProductsStore } from '../stores/products'
import { useOrdersStore } from '../stores/orders'
import { localCartStorage, localProductsStorage, localOrdersStorage } from '../utils/types'


export function usePersistState() {
  const cartStore = useCartStore()
  const ordersStore = useOrdersStore()
  const productsStore = useProductsStore()

  const localStore_Orders = cartStore.$subscribe(() => {
    localStorage.setItem(localOrdersStorage, JSON.stringify(ordersStore.orders))
  })
  const localStore_Cart = cartStore.$subscribe(() => {
    localStorage.setItem(localCartStorage, JSON.stringify(cartStore.cart))
  })
  const localStore_Products = cartStore.$subscribe(() => {
    localStorage.setItem(localProductsStorage, JSON.stringify(productsStore.products))
  })

  onUnmounted(() => {
    localStore_Orders()
    localStore_Cart()
    localStore_Products()
  })
}