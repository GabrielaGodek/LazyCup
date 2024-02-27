<template>
    <div class="py-5 sm:py-8">
        <div class="flex flex-wrap gap-4 sm:py-2.5 lg:gap-6">
            <div class="sm:-my-2.5">
                <a href="#" class="group relative block h-40 w-24 overflow-hidden rounded-lg bg-gray-100 sm:h-56 sm:w-40">
                    <img :src="data?.image" loading="lazy" :alt="data?.title"
                        class="h-full w-full object-cover object-center transition duration-200 group-hover:scale-110" />
                </a>
            </div>

            <div class="flex flex-1 flex-col justify-between">
                <div>
                    <a href="#"
                        class="mb-1 inline-block text-lg font-bold text-gray-800 transition duration-100 hover:text-gray-500 lg:text-xl">{{
                            data?.title }}</a>

                    <span class="block text-gray-500">Size: {{ data?.size }}</span>

                </div>

                <div class="flex items-end gap-2">
                    <template v-if="data?.salePrice !== 0">
                        <span class="font-bold text-error lg:text-lg">{{ data?.salePrice }} PLN</span>
                        <span class="mb-0.5 text-red-500 line-through">{{ data?.price }} PLN</span>
                    </template>
                    <span class="font-bold text-gray-800 lg:text-lg" v-else>{{ data?.price }} PLN</span>
                </div>
            </div>

            <div class="flex w-full justify-between border-t pt-4 sm:w-auto sm:border-none sm:pt-0">
                <div class="flex flex-col items-start gap-2">
                    <div class="flex h-12 w-20 overflow-hidden rounded border">
                        <input type="number" :value="quantity"
                            class="w-full px-4 py-2 outline-none ring-inset ring-indigo-300 transition duration-100 focus:ring" />

                        <div class="flex flex-col divide-y border-l">
                            <button
                                class="flex w-6 flex-1 select-none items-center justify-center bg-white leading-none transition duration-100 hover:bg-gray-100 active:bg-gray-200"
                                @click="quantity!++">+</button>
                            <button
                                class="flex w-6 flex-1 select-none items-center justify-center bg-white leading-none transition duration-100 hover:bg-gray-100 active:bg-gray-200"
                                @click="quantity!--">-</button>
                        </div>
                    </div>

                    <button
                        class="select-none text-sm font-semibold text-indigo-500 transition duration-100 hover:text-indigo-600 active:text-indigo-700">Delete</button>
                </div>

                <div class="ml-4 pt-3 sm:pt-2 md:ml-8 lg:ml-16">
                    <span class="block font-bold text-gray-800 md:text-lg">{{ totalPrice }} PLN</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script lang="ts">
import { defineComponent, ref, computed } from 'vue';
import type { PropType } from 'vue'
import { Order } from '@/utils/types'
import { useCartStore } from '@/stores/cart';


export default defineComponent({
    name: 'CartItem',
    props: {
        data: Object as PropType<Order>
    },
    setup(props, { emit }) {
        const data = props.data
        const cart = useCartStore()
        const cartOrders = cart.cart
        const quantity = ref(data ? data.amount : 1)
        const totalPrice = computed(() => {
            if (data && quantity.value !== undefined && typeof quantity.value === 'number') {
                const targetIndex = cartOrders.findIndex((el: Order) => el.id === data.id);
                if (targetIndex !== -1) {
                    cartOrders[targetIndex].amount = quantity.value
                }
                return quantity.value * (data.salePrice > 0 ? data.salePrice : data.price);
            }

            return 0;
        })
        emit('itemTotalPrice', totalPrice)
        return {
            data,
            quantity,
            totalPrice
        }
    }
})
</script>
