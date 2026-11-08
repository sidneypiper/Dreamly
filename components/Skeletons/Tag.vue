<template>
  <span :class="{'animate-pulse': !still}" class="w-16 h-[26px] rounded-full bg-white dark:bg-stone-800"></span>
</template>

<script lang="ts" setup>
defineProps<{
  still?: boolean
}>()
</script>
