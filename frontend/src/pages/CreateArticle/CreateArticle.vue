<template src='./createArticle.html'></template>
<style lang='scss' src='./createArticle.scss' scoped></style>
<script>
import axios from 'axios'
import marked from 'marked'

const DOMAIN_BASE = process.env.DOMAIN_BASE

const config = {
  headers: {
    accessToken: localStorage.getItem('access-token'),
    client: localStorage.getItem('client'),
    uid: localStorage.getItem('uid')
  }
}

export default {
  data () {
    return {
      markdown: '',
      title: '',
      body: '',
      user_id: ''
    }
  },
  methods: {
    preview: function () {
      /* sanitizeでタグをそのままescapeさせる */
      return marked(this.body, {sanitize: true})
    },
    postArticle: function () {
      const params = {
        article: {
          title: this.title,
          body: this.body
        }
      }
      axios.post(`${DOMAIN_BASE}articles`, params, config)
        .then(response => {
          console.log(response.data)
          console.log(response.status)
          console.log(response.headers)
        }).catch(error => {
          console.log(error.config)
        })
    }
  }
}
</script>
