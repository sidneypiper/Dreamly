<template>
  <div class="flex flex-col">
    <div class="flex flex-col items-center text-center gap-1.5 px-8 pt-12 pb-10">
      <h3 class="text-3xl font-semibold">{{ props.title }}</h3>
      <p class="max-w-xs opacity-80">
        <slot/>
      </p>
    </div>
    <div aria-hidden="true" class="flex flex-col pointer-events-none select-none">
      <SkeletonsDream still class="lg:px-0 opacity-60"/>
      <SkeletonsDream still class="lg:px-0 opacity-40"/>
      <SkeletonsDream still class="lg:px-0 opacity-20"/>
    </div>
  </div>
</template>

<script lang="ts" setup>
const props = defineProps<{
  title: string,
}>()
</script>
