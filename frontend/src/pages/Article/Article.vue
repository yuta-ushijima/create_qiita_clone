<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'
const DOMAIN_BASE = process.env.DOMAIN_BASE
export default {
  data () {
    return {
      articles: null
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}/articles/${articles.id}`)
      .then(response => {
        this.articles = response.data
        console.log(response.data)
      })
  }
}
</script>
