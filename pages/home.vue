<template>
  <div class="flex flex-col h-full">
    <EmptyState v-if="loaded && dreamsStore.dreams.length === 0" :icon="MoonIcon" label="Dream journal"
                title="No dreams yet">
      Write down your first dream while you still remember it.
    </EmptyState>
    <div v-else class="flex flex-col items-stretch">
      <InfiniteScroller :bottom="0" @bottom="fetchNewPage">
        <Dream v-for="dream in dreamsStore.dreams" :key="dream.id!" :dream="dream"
               class="last-of-type:border-none border-b-4 border-white dark:border-stone-950 lg:border-b-2"
               @selected-tag="handleTagClick"/>
      </InfiniteScroller>
    </div>
  </div>
</template>

<script lang="ts" setup>
import type {TagWithColor} from "~/prisma/types"
import {MoonIcon} from "@heroicons/vue/24/outline";
import {onBeforeUnmount} from "vue";
import {setPageScrollPositions} from "stores/scroll";

definePageMeta({
  middleware: 'auth',
  preserveScroll: true
})

onBeforeRouteLeave((to, from, next) => {
  if (from.meta.preserveScroll) {
    const windowScroll = window.scrollY
    const containerScroll: { [key: string]: number } = {}

    document.querySelectorAll('[data-scrollable]').forEach((c) => {
      if (c.hasAttribute('data-scrollable'))
        containerScroll[c.getAttribute('data-scrollable')!] = c.scrollTop;
    })

    setPageScrollPositions(from.fullPath, {
      window: windowScroll,
      containers: containerScroll,
    })
  }
  next()
})

const selectedTags = ref<TagWithColor[]>([])

const dreamsStore = useDreamsStore()
const route = useRoute()

const loaded = ref(false)

onBeforeMount(async () => {
  await fetchNewPage()
  loaded.value = true
})

const handleTagClick = (tag: TagWithColor) => {
  if (selectedTags.value.includes(tag)) {
    selectedTags.value = selectedTags.value.filter(x => x != tag)
  } else {
    selectedTags.value.push(tag)
  }
}

let page = 1
const fetchNewPage = async () => {
  if (await dreamsStore.fetch(page)) page++
}
</script>