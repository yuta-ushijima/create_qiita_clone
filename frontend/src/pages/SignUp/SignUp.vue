<template src='./signUp.html'></template>
<style lang='scss' src='./signUp.scss'></style>
<script>
  import axios from 'axios'
  const SIGNUP_Endpoint = process.env.SIGNUP_ENDPOINT

  export default {
  mounted: () => {
      axios.post("http://localhost:8080/api/v1/users")
        .then( response => {
        console.log(response.data)
          console.log(response.status)
      })
    }
  }
</script>
