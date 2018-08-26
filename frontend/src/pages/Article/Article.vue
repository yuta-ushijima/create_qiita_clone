<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'
import Article from '@/models/article'

const DOMAIN_BASE = process.env.DOMAIN_BASE

export default {
  props: ['id'],
  data () {
    return {
      article: Article
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}/articles/${this.id}`)
      .then(response => {
        this.article = response.data
        console.log(response.data)
      })
  },
  methods: {
    deleteArticle: function () {
      axios.delete(`${DOMAIN_BASE}articles/${this.id}`)
        .then(response => {
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
