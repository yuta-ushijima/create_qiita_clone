<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'
const DOMAIN_BASE = process.env.DOMAIN_BASE
export default {
  props: ['id', 'title', 'body'],
  data () {
    return {
      article: null
    }
  },
  mounted () {
    console.log(this.props.id)
    axios.get(`${DOMAIN_BASE}/articles/${this.props.id}`)
      .then(response => {
        this.article = response.data
        console.log(response.data)
      })
  }
}
</script>
