<template>
    <div class="border-b">
        <div class="flex cursor-pointer justify-between gap-2 py-4 text-black hover:text-indigo-500 active:text-indigo-600">
            <span class="font-semibold transition duration-100 md:text-lg">{{ data.date }}</span>

            <span class="text-indigo-500">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
            </span>
        </div>

        <div class="flex mb-4 text-gray-500">
            <!-- <v-card flat>
                <v-data-table :headers="headers" :items="values" :search="search"></v-data-table>
            </v-card> -->


        </div>
    </div>
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue';
import type { PropType } from 'vue'

import { ProductData } from '../utils/types'

export default defineComponent({
    name: 'SummaryItem',
    props: {
        data: {
            type: Object as PropType<ProductData>,
            required: true
        }
    },
    setup(props) {
        const data = ref()
        data.value = props.data

        const headers = [
            { text: 'Dessert (100g serving)' },
            { text: 'Calories', value: 'calories' },
            { text: 'Fat (g)', value: 'fat' },
            { text: 'Carbs (g)', value: 'carbs' },
            { text: 'Protein (g)', value: 'protein' },
            { text: 'Iron (%)', value: 'iron' },
        ];

        const values = [
            { name: 'Frozen Yogurt', calories: 159, fat: 6.0, carbs: 24, protein: 4.0, iron: 1 },
            { name: 'Ice cream sandwich', calories: 237, fat: 9.0, carbs: 37, protein: 4.3, iron: 1 },
            { name: 'Eclair', calories: 262, fat: 16.0, carbs: 23, protein: 6.0, iron: 7 },
            { name: 'Cupcake', calories: 305, fat: 3.7, carbs: 67, protein: 4.3, iron: 8 },
            { name: 'Gingerbread', calories: 356, fat: 16.0, carbs: 49, protein: 3.9, iron: 16 },
            { name: 'Jelly bean', calories: 375, fat: 0.0, carbs: 94, protein: 0.0, iron: 0 },
            { name: 'Lollipop', calories: 392, fat: 0.2, carbs: 98, protein: 0, iron: 2 },
            { name: 'Honeycomb', calories: 408, fat: 3.2, carbs: 87, protein: 6.5, iron: 45 },
            { name: 'Donut', calories: 452, fat: 25.0, carbs: 51, protein: 4.9, iron: 22 },
            { name: 'KitKat', calories: 518, fat: 26.0, carbs: 65, protein: 7, iron: 6 },
        ];


        return {
            data,
            headers,
            values
        }
    }
})
</script>
