<template>
  <div class="flex flex-col h-full gap-3 pt-4 overflow-y-hidden">
    <div v-if="hasDreams" class="flex flex-col items-stretch rounded-3xl mx-4 px-4 lg:mx-0 bg-white dark:bg-stone-950">
      <div class="flex items-stretch w-full">
        <MagnifyingGlassIcon class="w-6 h-6 shrink-0 my-auto"/>
        <input v-model="searchStore.term"
               class="bg-transparent border-none focus:ring-0 text-xl grow shrink min-w-0"
               placeholder="Search..."
               @input="search"
               ref="searchInput"
               v-click-outside="() => $refs.searchInput.blur()">
        <IconButton class="flex items-center justify-center shrink-0 pl-3" @click="tagDropdown?.toggle">
          <FunnelIcon class="w-6 h-6 stroke-[1.5px] stroke-stone-950 dark:stroke-white"/>
        </IconButton>
      </div>
      <TagDropdown ref="tagDropdown" v-model="searchStore.tags" v-model:open="searchStore.filterOpen" @update="search"/>
    </div>

    <EmptyState v-if="loaded && !hasDreams" title="No dreams yet">
      Write down your first dream while you still remember it.
    </EmptyState>

    <Fader v-else class="grow text-cloud dark:text-stone-900" vertical>
      <div class="h-full overflow-y-auto text-stone-950 dark:text-white" data-scrollable="journal">
        <template v-if="isFiltering">
          <EmptyState v-if="searched && searchStore.results.length === 0" title="No dreams found">
            Try a different search term or remove some filters.
          </EmptyState>
          <Dream v-for="dream in searchStore.results" :key="dream.id!" :dream="dream"
                 class="last:border-none border-b-4 border-b-white dark:border-b-stone-950 lg:border-b-2"/>
        </template>
        <InfiniteScroller v-else :bottom="0" @bottom="fetchNewPage">
          <Dream v-for="dream in dreamsStore.dreams" :key="dream.id!" :dream="dream"
                 class="last-of-type:border-none border-b-4 border-white dark:border-stone-950 lg:border-b-2"/>
        </InfiniteScroller>
      </div>
    </Fader>
  </div>
</template>

<script lang="ts" setup>
import {FunnelIcon, MagnifyingGlassIcon} from '@heroicons/vue/24/outline';
import type {TagDropdown} from "#components";
import {useSearchStore} from "stores/search";
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

const dreamsStore = useDreamsStore()
const searchStore = useSearchStore()

const tagDropdown = ref<typeof TagDropdown>()

const loaded = ref(false)
const searched = ref(false)

const hasDreams = computed(() => dreamsStore.dreams.length > 0)
const isFiltering = computed(() => searchStore.term.trim() !== '' || searchStore.tags.length > 0)

onBeforeMount(async () => {
  await fetchNewPage()
  loaded.value = true
  if (isFiltering.value) await search()
})

let page = 1
const fetchNewPage = async () => {
  if (await dreamsStore.fetch(page)) page++
}

const search = async () => {
  if (!isFiltering.value) {
    searched.value = false
    return
  }
  await searchStore.search()
  searched.value = true
}
</script>
