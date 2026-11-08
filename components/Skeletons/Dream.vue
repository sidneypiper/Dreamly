<template>
  <div class="overflow-hidden flex flex-col px-4 py-6 gap-2">
    <!-- Date -->
    <SkeletonsDiv :still="still" class="h-3 w-28"/>

    <!-- Title -->
    <SkeletonsDiv :still="still" class="h-8 w-96"/>

    <!-- Taglist -->
    <div class="flex items-center flex-wrap gap-2">
      <SkeletonsTag :still="still"/>
      <SkeletonsTag :still="still"/>
      <SkeletonsTag :still="still"/>
    </div>

    <!-- Content -->
    <div class="flex flex-col gap-1">
      <SkeletonsDiv :still="still" class="h-5 w-full"/>
      <SkeletonsDiv :still="still" class="h-5 w-5/6"/>
      <SkeletonsDiv :still="still" class="h-5 w-full"/>
      <SkeletonsDiv :still="still" class="h-5 w-2/3"/>
      <SkeletonsDiv :still="still" class="h-5 w-2/3"/>
    </div>
  </div>
</template>

<script lang="ts" setup>
defineProps<{
  still?: boolean
}>()
</script>
