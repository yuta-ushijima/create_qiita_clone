<template src="./article.html"></template>
<style src="./article.scss"></style>
<script>
import axios from 'axios'
import Article from '@/models/article'
import Vue from 'vue'
import VuejsDialog from 'vuejs-dialog'
// VuejsDialogのデフォルトCSSをimport(モーダル用)
import 'vuejs-dialog/dist/vuejs-dialog.min.css'

// VuejsDialogを使用することをvueに通知
Vue.use(VuejsDialog)

const DOMAIN_BASE = process.env.DOMAIN_BASE
const message = '本当に削除しますか？'
const options = {
  type: 'basic',
  okText: 'はい',
  cancelText: 'いいえ'
}

export default {
  props: ['id'],
  data () {
    return {
      article: Article
    }
  },
  mounted () {
    axios.get(`${DOMAIN_BASE}/articles/${this.id}`)
      .then(response => {
        this.article = response.data
        console.log(response.data)
      })
  },
  methods: {
    // 削除前に実行確認のダイアログを表示する
    dialog: function () {
      this.$dialog.confirm(message, options)
        .then(() => {
          axios.delete(`${DOMAIN_BASE}articles/${this.id}`)
            .then(response => {
              // 削除が完了したら、一覧ページへリダイレクト
              this.$router.push('/articles')
            })
        })
        .catch(function () {
          // キャンセルした時の処理
          console.log('キャンセルされました')
        })
    }
  }
}
</script>
