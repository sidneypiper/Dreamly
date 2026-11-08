<template>
  <div class="flex flex-col items-center text-center gap-1.5 px-8 pt-16 pb-8">
    <h3 class="text-3xl font-semibold">{{ props.title }}</h3>
    <p class="max-w-xs opacity-80">
      <slot/>
    </p>
    <NuxtLink v-if="props.action"
              class="flex items-center gap-2 mt-6 px-6 py-2 rounded-full bg-stone-950 dark:bg-white text-white dark:text-stone-950 text-lg font-semibold"
              to="/dream">
      <PlusIcon class="w-5 h-5 stroke-2"/>
      Log dream
    </NuxtLink>
  </div>
</template>

<script lang="ts" setup>
import {PlusIcon} from "@heroicons/vue/24/outline";

const props = withDefaults(defineProps<{
  title: string,
  action?: boolean,
}>(), {
  action: true
})
</script>
