<template>
  <div class="px-4 w-dvw">
    <div class="mx-auto max-w-7xl">
      <StaticHeader/>
      <div class="space-y-48 py-6 lg:pt-16 lg:pb-48">
        <StaticHero/>
        <StaticReasons/>
        <StaticFeatures/>
        <StaticTeam/>
      </div>
      <StaticFooter/>
    </div>
  </div>
</template>

<script lang="ts" setup>
definePageMeta({
  layout: "static",
  middleware: 'auth',
  auth: {
    unauthenticatedOnly: true,
    navigateAuthenticatedTo: '/journal',
  },
})
</script>
