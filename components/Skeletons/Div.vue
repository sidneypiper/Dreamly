<template>
  <div :class="{'animate-pulse': !still}" class="max-w-full bg-white dark:bg-stone-800 rounded-full"></div>
</template>

<script lang="ts" setup>
defineProps<{
  still?: boolean
}>()
</script>
