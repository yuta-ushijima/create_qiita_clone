<template src="./login.html"></template>
<style src="./login.scss"></style>
<script>
import axios from 'axios'

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
      email: '',
      password: ''
    }
  },
  methods: {
    signIn: function () {
      const params = {
        email: this.email,
        password: this.password
      }
      axios.post(`${DOMAIN_BASE}auth/sign_in`, params, config)
        .then(response => {
          // ログインしたら、一覧ページへリダイレクト
          this.$router.push('/articles')
        }).catch(error => {
          console.log(error.config)
        })
    }
  }
}
</script>
