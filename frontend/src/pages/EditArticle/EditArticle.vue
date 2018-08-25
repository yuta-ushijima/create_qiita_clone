<template src="./editArticle.html"></template>
<style src="@/pages/CreateArticle/createArticle.scss"></style>
<script>
import axios from 'axios'
import Article from '@/pages/Article/Article'
import marked from 'marked'
const DOMAIN_BASE = process.env.DOMAIN_BASE

export default {
  props: ['id'],
  data () {
    return {
      article_data: Article
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}articles/${this.id}`)
      .then(response => {
        this.article_data = response.data
        console.log(response.data)
      })
  },
  methods: {
    preview: function () {
      /* sanitizeでタグをそのままescapeさせる */
      return marked(this.markdown, {sanitize: true})
    },
    putArticle: function () {
      const params = {
        title: this.title,
        body: this.body
      }
      axios.put(`${DOMAIN_BASE}articles/${this.id}`, params)
        .then(response => {
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
