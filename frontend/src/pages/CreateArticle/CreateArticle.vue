<template src='./createArticle.html'></template>
<style lang='scss' src='./createArticle.scss' scoped></style>
<script>
import axios from 'axios'
import marked from 'marked'

const DOMAIN_BASE = process.env.DOMAIN_BASE

export default {
  data () {
    return {
      markdown: '',
      title: '',
      body: '',
      user_id: ''
    }
  },
  computed: {
    preview: function () {
      /* sanitizeでタグをそのままescapeさせる */
      return marked(this.markdown, {sanitize: true})
    }
  },
  methods: {
    postArticle: function () {
      const params = {
        article: {
          title: this.title,
          body: this.body,
          user_id: this.user_id
        }
      }
      axios.post(`${DOMAIN_BASE}/articles`, params)
        .then(response => {
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
