<template src='./articles.html'></template>
<style lang='scss' src='./articles.scss'></style>
<script>
import axios from 'axios'
import marked from 'marked'
const ARTICLES_ENDPOINT = process.env.ARTICLES_ENDPOINT

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
  },
  methods: {
    preview: function () {
      return marked(this.articles.attributes.title)
    }
  }
}
</script>
