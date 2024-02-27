<script lang="ts">
import { defineComponent, computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useCartStore } from '@/stores/cart'
import { useOrdersStore } from '@/stores/orders'
import { Order, OrderData } from '@/utils/types'

import CartItem from '@/components/CartItem.vue'

export default defineComponent({
    name: 'ListingView',
    components: {
        CartItem
    },
    setup() {
        const cart = useCartStore()
        const orders = useOrdersStore()
        const draftOrders = ref<Order[]>([]);

        const router = useRouter()

        const totalPriceSum = computed(() => {
            return draftOrders.value.reduce((acc: number, order: Order) => {
                const price = order.salePrice > 0 ? order.salePrice : order.price;
                return acc + (price * order.amount!);
            }, 0)
        });

        const totalDiscountSum = computed(() => {
            return draftOrders.value.reduce((acc: number, order: Order) => {
                const price = order.price;
                return acc + (price * order.amount!);
            }, 0) - totalPriceSum.value;
        })

        const madeOrder = () => {
            const formattedOrders: OrderData[] = []
            draftOrders.value.forEach(order => {
                let formatted: OrderData = {
                    title: order.title,
                    amount: order.amount || 1,
                    date: new Date().toLocaleString(),
                    size: order.size || '',
                    price: order.salePrice > 0 ? order.salePrice : order.price,

                }
                formattedOrders.push(formatted)
            })

            orders.makeOrder(formattedOrders)
            // console.log(draftOrders.value)
            router.push({ name: 'SummaryView' })
            cart.cart = []
        }
        onMounted(() => {
            draftOrders.value = cart.cart
        })
        return {
            draftOrders,
            totalPriceSum,
            totalDiscountSum,
            madeOrder
        }
    }

})

</script>

<template>
    <div class="bg-white py-6 sm:py-8 lg:py-12">
        <div class="mx-auto max-w-screen-lg px-4 md:px-8">
            <div class="mb-6 sm:mb-10 lg:mb-16">
                <h2 class="mb-4 text-center text-2xl font-bold text-gray-800 md:mb-6 lg:text-3xl">Your Cart</h2>
            </div>

            <div class="mb-5 flex flex-col sm:mb-8 sm:divide-y sm:border-t sm:border-b">
                <cart-item v-for="order in draftOrders" :key="order.id" :data="order" />
            </div>

            <!-- totals - start -->
            <div class="flex flex-col items-end gap-4">
                <div class="w-full rounded-lg bg-gray-100 p-4 sm:max-w-xs">
                    <div class="space-y-1">
                        <div class="flex justify-between gap-4 text-gray-500" v-show="totalDiscountSum">
                            <span>Discount</span>
                            <span>{{ totalDiscountSum }} PLN</span>
                        </div>


                    </div>

                    <div class="mt-4 border-t pt-4">
                        <div class="flex items-start justify-between gap-4 text-gray-800">
                            <span class="text-lg font-bold">Total</span>

                            <span class="flex flex-col items-end">
                                <span class="text-lg font-bold">{{ totalPriceSum }} PLN</span>
                                <span class="text-sm text-gray-500">including VAT</span>
                            </span>
                        </div>
                    </div>
                </div>

                <button @click="madeOrder()"
                    class="inline-block rounded-lg bg-success px-8 py-3 text-center text-sm font-semibold text-white outline-none  transition duration-100 hover:bg-secondary focus-visible:ring active:bg-secondary md:text-black">Check
                    out</button>
            </div>
            <!-- totals - end -->
        </div>
    </div>
</template>