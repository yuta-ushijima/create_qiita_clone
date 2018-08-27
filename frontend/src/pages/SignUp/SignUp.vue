<template src='./signUp.html'></template>
<style lang='scss' src='./signUp.scss'></style>
<script>
import axios from 'axios'
const SIGNUP_ENDPOINT = process.env.SIGNUP_ENDPOINT

export default {
  data () {
    return {
      msg: 'test',
      first_name: '',
      last_name: '',
      email: '',
      password: ''
    }
  },
  methods: {
    signUp: function () {
      const params = {
        user: {
          first_name: this.first_name,
          last_name: this.last_name,
          email: this.email,
          password: this.password
        }
      }
      axios.post(SIGNUP_ENDPOINT, params)
        .then(response => {
          this.$router.push('/articles')
          console.log(response.data)
          console.log(response.status)
        })
    }
  }
}
</script>
