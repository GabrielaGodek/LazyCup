<template>
    <div>
        <div @click="moveToPage(coffee.id)"
            class="group relative mb-2 block h-80 overflow-hidden rounded-lg bg-gray-100 lg:mb-3">
            <img :src="coffee.image" loading="lazy" :alt="coffee.title"
                class="h-full w-full object-cover object-center transition duration-200 group-hover:scale-110" />

            <span v-if="coffee.salePrice !== 0"
                class="absolute left-0 top-0 rounded-br-lg bg-error px-3 py-1.5 text-sm uppercase tracking-wider text-base">
                {{ getDiff(coffee.salePrice, coffee.price) }}%</span>
        </div>

        <div>
            <div @click="moveToPage(coffee.id)" class="hover:gray-800 mb-1 text-gray-500 transition duration-100 lg:text-lg">{{ coffee.title }}</div>

            <div class="flex items-end gap-2">
                <template v-if="coffee.salePrice !== 0">
                    <span class="font-bold text-error lg:text-lg">{{ coffee.salePrice }} PLN</span>
                    <span class="mb-0.5 text-red-500 line-through">{{ coffee.price }} PLN</span>
                </template>
                <span class="font-bold text-gray-800 lg:text-lg" v-else>{{ coffee.price }} PLN</span>
            </div>
        </div>
    </div>
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue'
import type { PropType } from 'vue'

import { ProductData } from '../utils/types'

import { useRouter } from 'vue-router'
export default defineComponent({
    name: 'TileItem',
    props: {
        data: Object as PropType<ProductData>
    },
    setup(props) {
        const coffee = ref()
        coffee.value = props.data
        const router = useRouter()
        
        const getDiff = (salePrice: number, price: number): number => {
            return 100 - ((salePrice * 100) / price)
        }
        const moveToPage = (id: number) => {
            router.push({
                name: 'ProductView',
                params: { id: id }
            })
        }
        return {
            coffee,
            getDiff,
            moveToPage
        }
    }
}) 
</script>
