import { onUnmounted } from 'vue'
import { useCartStore } from '../stores/cart'
import { useProductsStore } from '../stores/products'
import { localCartStorage, localProductsStorage } from '../utils/types'


export function usePersistState() {
  const cartStore = useCartStore()
  const productsStore = useProductsStore()

  const localStore_Cart = cartStore.$subscribe(() => {
    localStorage.setItem(localCartStorage, JSON.stringify(cartStore.orders))
  })
  const localStore_Products = cartStore.$subscribe(() => {
    localStorage.setItem(localProductsStorage, JSON.stringify(productsStore.products))
  })

// onMounted(async () => {
//     const localCartData = localStorage.getItem(localCartStorage)
//     const localProductsData = localStorage.getItem(localProductsStorage)

//     if (!localCartData || !localProductsData) {
//       await productsStore.useFetch('http://localhost:3030/api/products')
//     } else {
//       // cartStore.setOrders(JSON.parse(localCartData))
//       // productsStore.setProducts(JSON.parse(localProductsData))
//     }
//   })
  onUnmounted(() => {
    localStore_Cart()
    localStore_Products()
  })
}