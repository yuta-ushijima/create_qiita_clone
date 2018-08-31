<template>
  <div class="ui middle aligned center aligned grid">
    <div class="column">
      <form class="ui large form">
        <div class="ui stacked segment">
          <button class="ui button green fluid large teal" type="submit" @click="logout">Logout</button>
        </div>
      </form>
    </div>
  </div>
</template>
<style></style>
<script>

import axios from 'axios'
import Vue from 'vue'
import VuejsDialog from 'vuejs-dialog'
// VuejsDialogのデフォルトCSSをimport(モーダル用)
import 'vuejs-dialog/dist/vuejs-dialog.min.css'

// VuejsDialogを使用することをvueに通知
Vue.use(VuejsDialog)

const DOMAIN_BASE = process.env.DOMAIN_BASE

const message = '本当にログアウトしますか？'
const options = {
  type: 'basic',
  okText: 'はい',
  cancelText: 'いいえ'
}

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
  methods: {
    logout: function () {
      // ログアウト前に実行確認のダイアログを表示する
      this.$dialog.confirm(message, options)
        .then(() => {
          axios.delete(`${DOMAIN_BASE}auth/sign_out`, config)
            .then(response => {
              // ログアウトしたら、一覧ページへリダイレクト
              this.$router.push('/articles')
            }).catch(error => {
              console.log(error.config)
            })
        })
    }
  }
}
</script>
