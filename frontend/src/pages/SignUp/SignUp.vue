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
        let params = new URLSearchParams();
        params.append('first_name', "YUTA");
        params.append('last_name', "USHIJIMA");
        params.append('email', "register@yuta-u.com");
        params.append('password', "test");
        axios.post("http://localhost:8080/api/v1/users", params)
          .then( response => {
            console.log(response.data)
            console.log(response.status)
          })
      }
    }
  }
</script>
