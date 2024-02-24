<script lang="ts">
import { defineComponent } from 'vue';
import HeroIcon from '../components/HeroIcon.vue'
export default defineComponent({
  name: "HomeView",
  components: {
    HeroIcon
  }

});
</script>

<template>
  <div class="h-full pb-6 sm:pb-8 lg:pb-12">
    <div class="flex h-full justify-center mx-auto max-w-screen-2xl px-4 md:px-8">
      <section class="flex flex-col justify-center lg:justify-between gap-6 sm:gap-10 md:gap-16 lg:flex-row">
        <div class="mb-12 flex flex-col justify-between lg:justify-end xl:w-5/12">
          <div class="sm:text-center lg:pt-12 lg:pb-6 lg:text-left xl:pt-24 xl:pb-12">
            <p class="mb-4 font-semibold text-detail md:mb-6 md:text-lg xl:text-xl">LazyCup</p>
            <h1 class="mb-8 text-4xl font-bold text-black sm:text-5xl md:mb-12 md:text-6xl">Revolutionary way to order coffee</h1>
          </div>
           <div class=" flex flex-col gap-2.5 sm:flex-row sm:justify-center lg:justify-start">
            <a href="#" class="inline-block text-base rounded-lg bg-detail px-8 py-3 text-center text-sm font-semibold text-white outline-none ring-detail transition duration-100 hover:detail focus-visible:ring active:bg-detail md:text-base">Order your coffee</a>
          </div>

        </div>
        <div class="order-2 md:order-2 h-48 overflow-hidden lg:h-auto xl:w-5/12">
         <hero-icon></hero-icon>
        </div>
      </section>
    </div>
  </div>
</template>
