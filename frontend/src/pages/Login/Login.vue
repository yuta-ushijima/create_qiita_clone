<template src="./login.html"></template>
<style src="./login.scss"></style>
<script>
import axios from 'axios'

const DOMAIN_BASE = process.env.DOMAIN_BASE

const token = localStorage.getItem('access-token')

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
          console.log(response.data)
          console.log(response.status)
          console.log(response.headers)
          console.log(response.config)
        }).catch(error => {
          console.log(error.config)
        })
    },
    login: function () {
      const { email, password } = this
      this.$store.dispatch(AUTH_REQUEST, { email, password }).then(() => {
        this.$router.push('/articles')
      })
    }
  }
}
</script>
