import { onUnmounted } from 'vue'
import { useCartStore } from '../stores/cart'
import { useProductsStore } from '../stores/products'
import { localCartStorage, localProductsStorage } from '../utils/types'


export function usePersistCart() {
  const cartStore = useCartStore()
  const productsStore = useProductsStore()

  const localStore_Cart = cartStore.$subscribe(() => {
    localStorage.setItem(localCartStorage, JSON.stringify(cartStore.orders))
  })
  const localStore_Products = cartStore.$subscribe(() => {
    localStorage.setItem(localProductsStorage, JSON.stringify(productsStore.products))
  })

  onUnmounted(() => {
    localStore_Cart()
    localStore_Products()
  })
}