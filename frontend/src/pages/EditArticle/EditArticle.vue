<template src="./editArticle.html"></template>
<style src="@/pages/CreateArticle/createArticle.scss"></style>
<script>
import axios from 'axios'
import Article from '@/pages/Article/Article'
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
  props: ['id'],
  data () {
    return {
      article: Article
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}articles/${this.id}`)
      .then(response => {
        this.article = response.data
      })
  },
  methods: {
    preview: function () {
      /* sanitizeでタグをそのままescapeさせる */
      if (this.article.body) {
        return marked(this.article.body, {sanitize: true})
      }
    },
    putArticle: function () {
      const params = {
        id: this.id,
        title: this.article.title,
        body: this.article.body
      }
      axios.put(`${DOMAIN_BASE}articles/${this.id}`, params, config)
        .then(response => {
          // 記事の編集が完了したら、一覧ページへリダイレクト
          this.$router.push('/articles')
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
