<template>
  <div id="app">
    <div class="form">
      <div class="form-group">
        <input v-model="title" placeholder="title" class="form-control">
      </div>
      <div class="form-group">
        <input v-model="desc" placeholder="desc" class="form-control">
      </div>
      <button @click="addMemo">メモを追加</button>
    </div>
    <div class="flex">
      <div v-for="memo in memos" :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
            {{ memo.title }}
          </div>
            {{ memo.desc }}
        </div>
      </div>
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
    },
    addMemo: function() {
      axios.post('/api/memos',{
        title: this.title,
        desc: this.desc
      })
      .then(response => ( // 通信に成功した時
        this.setMemo()
      ));
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
