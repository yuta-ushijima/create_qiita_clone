<template src="./login.html"></template>
<style src="./login.scss"></style>
<script>
import axios from 'axios'

const DOMAIN_BASE = process.env.DOMAIN_BASE

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
        users: {
          email: this.email,
          password: this.password
        }
      }
      axios.post(`${DOMAIN_BASE}users/sign_in`, params)
        .then(response => {
          // ログインしたら、一覧ページへリダイレクト
          this.$router.push('/articles')
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
