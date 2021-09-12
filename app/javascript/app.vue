<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.desc }}
      </li>
    </ul>
    <div>
      <input v-model="title" placeholder="title">
      <input v-model="desc" placeholder="desc">
      <button v-on:click="addMemo">メモを追加</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos",
      title: '',
      desc: '',
    }
  },
  mounted() {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
      ))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
