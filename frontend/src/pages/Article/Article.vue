<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'

const DOMAIN_BASE = process.env.DOMAIN_BASE

export default {
  props: ['id'],
  data () {
    return {
      article: null
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}/articles/${this.id}`)
      .then(response => {
        this.article = response.data
        console.log(response.data)
      })
  }
}
</script>
