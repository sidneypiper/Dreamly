<template>
  <div class="flex flex-col items-center justify-center text-center gap-1.5 px-8 py-16 grow">
    <component :is="props.icon" class="w-12 h-12 stroke-[1.5px] opacity-60 mb-3"/>
    <p class="text-xs opacity-60 uppercase font-bold">{{ props.label }}</p>
    <h3 class="text-3xl font-semibold">{{ props.title }}</h3>
    <p class="max-w-xs opacity-80">
      <slot/>
    </p>
    <NuxtLink
        class="flex items-center gap-2 mt-6 px-6 py-2 rounded-full bg-stone-950 dark:bg-white text-white dark:text-stone-950 text-lg font-semibold"
        to="/dream">
      <PlusIcon class="w-5 h-5 stroke-2"/>
      Log dream
    </NuxtLink>
  </div>
</template>

<script lang="ts" setup>
import type {Component} from "vue";
import {PlusIcon} from "@heroicons/vue/24/outline";

const props = defineProps<{
  icon: Component,
  label: string,
  title: string,
}>()
</script>
