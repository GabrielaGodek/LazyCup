<script lang="ts">
import HeroIcon from '../components/HeroIcon.vue'
export default {
  name: "homeView",
  components: {
    HeroIcon
  }

};
</script>

<template>
  <div class="h-full pb-6 sm:pb-8 lg:pb-12">
    <div class="flex h-full justify-center mx-auto max-w-screen-2xl px-4 md:px-8">
      <section class="flex flex-col justify-center lg:justify-between gap-6 sm:gap-10 md:gap-16 lg:flex-row">
        <div class="flex flex-col justify-between xl:w-5/12">
          <div></div>
          <div class="sm:text-center lg:py-12 lg:text-left xl:py-24">
            <p class="mb-4 font-semibold text-detail md:mb-6 md:text-lg xl:text-xl">LazyCup</p>
            <h1 class="mb-8 text-4xl font-bold text-black sm:text-5xl md:mb-12 md:text-6xl">Revolutionary way to order coffee</h1>
          </div>

        </div>
        <div class="h-48 overflow-hidden lg:h-auto xl:w-5/12">
         <hero-icon></hero-icon>
        </div>
      </section>
    </div>
  </div>
</template>
