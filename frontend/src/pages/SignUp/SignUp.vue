<template src='./signUp.html'></template>
<style lang='scss' src='./signUp.scss'></style>
<script>
import axios from 'axios'
const DOMAIN_BASE = process.env.DOMAIN_BASE

export default {
  data () {
    return {
      msg: 'test',
      first_name: '',
      last_name: '',
      email: '',
      password: '',
      passwordConfirmation: ''
    }
  },
  methods: {
    signUp: function () {
      const params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        passwordConfirmation: this.passwordConfirmation
      }
      axios.post(`${DOMAIN_BASE}auth`, params)
        .then(response => {
          // ユーザー登録が完了したら、記事一覧へジャンプ
          this.$router.push('/articles')
          // ローカルストレージにヘッダー情報を保存
          localStorage.setItem('access-token', response.headers['access-token'])
          localStorage.setItem('client', response.headers['client'])
          localStorage.setItem('uid', response.headers['uid'])
        }).catch(error => {
          console.log(error.config)
        })
    }
  }
}
</script>
