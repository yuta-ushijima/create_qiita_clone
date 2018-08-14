<template src='./signUp.html'></template>
<style lang='scss' src='./signUp.scss'></style>
<script>
  import axios from 'axios'
  const SIGNUP_Endpoint = process.env.SIGNUP_ENDPOINT

  export default {
    data() {
      return {
        msg: "test"
      }
    },
    methods: {
      signUp: function () {

        const params = {
            user: {
              first_name: 'test',
              last_name: 'test1',
              email: 'test@email.com',
              password: 'hogefuga'
            }
        };
        axios.post(SIGNUP_Endpoint, params)
          .then( response => {
            console.log(response.data)
            console.log(response.status)
          })
      }
    }
  }
</script>
