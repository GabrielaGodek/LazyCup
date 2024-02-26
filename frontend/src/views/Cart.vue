<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useCartStore } from '@/stores/cart';
import { Order } from '@/utils/types'

import CartItem from '@/components/CartItem.vue'

export default defineComponent({
    name: 'ListingView',
    components: {
        CartItem
    },
    setup() {
        const cart = useCartStore()
        const orders = cart.orders
        // const totalPriceSum = ref(0)

        const totalPriceSum = computed(() => {
            return orders.reduce((acc: number, order: Order) => acc + ((order.salePrice > 0 ? order.salePrice : order.price) * order.amount!), 0);
        })

        const totalDiscountSum = computed(() => {
            return orders.reduce((acc: number, order: Order) => acc + ((order.salePrice > 0 ? order.salePrice : order.price) * order.amount!), 0);
        })

        return {
            orders,
            totalPriceSum,
            totalDiscountSum
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
                <cart-item v-for="order in orders" :key="order.id" :data="order" />
                <!-- <cart-item v-for="order in orders" :key="order.id" :data="order" @itemTotalPrice="handleItemTotalPrice" /> -->
            </div>

            <!-- totals - start -->
            <div class="flex flex-col items-end gap-4">
                <div class="w-full rounded-lg bg-gray-100 p-4 sm:max-w-xs">
                    <div class="space-y-1">
                        <div class="flex justify-between gap-4 text-gray-500">
                            <span>Discount</span>
                            <span>$129.99</span>
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

                <button
                    class="inline-block rounded-lg bg-indigo-500 px-8 py-3 text-center text-sm font-semibold text-white outline-none ring-indigo-300 transition duration-100 hover:bg-indigo-600 focus-visible:ring active:bg-indigo-700 md:text-base">Check
                    out</button>
            </div>
            <!-- totals - end -->
        </div>
    </div>
</template>