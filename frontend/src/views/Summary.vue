<template>
    <div class="bg-white py-6 sm:py-8 lg:py-12">
        <div class="mx-auto max-w-screen-2xl px-4 md:px-8">
            <div class="mb-10 md:mb-16">
                <h2 class="mb-4 text-center text-2xl font-bold text-gray-800 md:mb-6 lg:text-3xl">Summary
                </h2>
                <p class="mx-auto max-w-screen-md text-center text-gray-500 md:text-lg">This is a section of some simple
                    filler text, also known as placeholder text. It shares some characteristics of a real written text but
                    is random or otherwise generated.</p>
            </div>

            <div class="mx-auto max-w-screen-sm flex-col border-t">
                <v-expansion-panels variant="popout" focusable class="my-4">
                    <v-expansion-panel v-for="(item, key) in groupedOrders" :key="key" ripple>
                        <v-expansion-panel-title>
                            {{ key }}
                        </v-expansion-panel-title>
                        <v-expansion-panel-text>
                            <template v-for="(data) in item" :key="data.title">
                                <div class="font-semibold transition duration-100 md:text-lg"> {{ data.title }}</div>
                                <div class="d-flex justify-space-between align-center">
                                    <div>
                                        <span class="mr-2">Size: {{ data.size }}</span>
                                        <span class="mr-2">Quantity: {{ data.amount }}</span>
                                    </div>
                                    <div>{{ data.price }} PLN</div>
                                </div>
                            </template>
                            <div class="text-right">Total price: {{ getTotalPrice(item) }} PLN</div>
                        </v-expansion-panel-text>
                    </v-expansion-panel>
                </v-expansion-panels>

            </div>
        </div>
    </div>
</template>
<script lang="ts">
import { defineComponent, onMounted, ref } from 'vue';
import SummaryItem from "@/components/SummaryItem.vue"
import { useOrdersStore } from '@/stores/orders'
import { Order } from '@/utils/types'
export default defineComponent({
    name: 'Summary',
    components: {
        SummaryItem
    },
    setup() {
        const orders = useOrdersStore()
        const listOfOrders = ref()
        const search = ref<string>('');
        const groupedOrders = ref()
        const getTotalPrice = (items) => {
            return items.reduce((total, item) => total + (item.amount * item.price), 0);

        }
        const groupOrdersByDate = (orders: Order[]) => {
            const groupOrders = {};
            orders.forEach((obj: Order) => {
                const date = obj.date!;
                if (!groupOrders[date]) {
                    groupOrders[date] = [];
                }
                groupOrders[date].push(obj);
            });
            return groupOrders;
        };
        onMounted(() => {
            listOfOrders.value = orders.orders
            groupedOrders.value = groupOrdersByDate(listOfOrders.value);

        })
        return {
            listOfOrders,
            search,
            groupedOrders,
            getTotalPrice
        }
    }
})
</script>
<style lang="">
    
</style>