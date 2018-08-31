<template src='./createArticle.html'></template>
<style lang='scss' src='./createArticle.scss' scoped></style>
<script>
import axios from 'axios'
import marked from 'marked'

const DOMAIN_BASE = process.env.DOMAIN_BASE

/* devise-auth-tokenで設定したヘッダー情報 */
const config = {
  headers: {
    'Authorization': 'Bearer',
    'Access-Control-Allow-Origin': '*',
    'access-token': localStorage.getItem('access-token'),
    'client': localStorage.getItem('client'),
    'uid': localStorage.getItem('uid')
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
          /* 記事投稿が完了したら、記事一覧へジャンプ */
          this.$router.push('/articles')
        }).catch(error => {
          console.log(error.config)
        })
    }
  }
}
</script>
