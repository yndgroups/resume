<template>
  <div>
    <h1 class="text-3xl font-bold underline text-red-700">前台首页</h1>
    <p>
      {{ $hello("世界") }}
    </p>
    <div>
      {{ foo }}
    </div>

    <!-- https://nuxt.com.cn/docs/guide/directory-structure/utils -->
    <p>{{ formatNumber(1234) }}</p>


    <pre>{{ data }}</pre>

  </div>
</template>
<script setup lang="ts">
// 这里调用的是插件注入的值
// https://nuxt.com.cn/docs/guide/directory-structure/plugins
const { $hello } = useNuxtApp();

// https://nuxt.com/docs/guide/directory-structure/composables#use-composable
// 这里使用的是 composables/useFoo.ts
const foo = useFoo();

// https://nuxt.com.cn/docs/guide/directory-structure/server
const { data } = await useFetch('/api/hello')
console.log(data, '/api/hello')
async function submit() {
  const { body } : any = await $fetch('/api/submit', {
    method: 'post',
    body: { test: 123 }
  })
  console.log(body)
}

submit()
</script>
