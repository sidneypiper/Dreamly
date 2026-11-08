<template>
  <div aria-live="polite" class="flex flex-col gap-3 grow h-full min-h-0 overflow-hidden px-4 lg:px-0 pb-4">
    <div class="flex flex-col items-center justify-center text-center gap-1.5 px-8 py-12 min-h-fit rounded-3xl bg-white dark:bg-stone-950"
         style="flex: 1 1 0">
      <h3 class="text-3xl font-semibold">{{ props.title }}</h3>
      <p class="max-w-xs opacity-80">
        <slot/>
      </p>
    </div>
    <div v-for="n in 3" :key="n" aria-hidden="true" class="rounded-3xl bg-white dark:bg-stone-950"
         :style="{flex: `${RATIO ** n} 1 ${PADDING * RATIO ** n}px`, opacity: DIMMING ** n}"/>
  </div>
</template>

<script lang="ts" setup>
const RATIO = 0.85
const DIMMING = 0.65
// matches the first tile's py-12, so every tile stays RATIO times the previous one
const PADDING = 96

const props = defineProps<{
  title: string,
}>()
</script>
