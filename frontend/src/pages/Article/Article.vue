<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'
const ARTICLES_ENDPOINT = process.env.ARTICLES_ENDPOINT + '/6'
export default {
  data () {
    return {
      articles: null
    }
  },
  mounted () {
    axios.get(ARTICLES_ENDPOINT)
      .then(response => {
        this.articles = response.data
        console.log(response.data)
      })
  }
}
</script>
