<template src='./signUp.html'></template>
<style lang='scss' src='./signUp.scss'></style>
<script>
  import axios from 'axios'
  const welcomeEndpoint = process.env.WELCOME_ENDPOINT

  export default {
    created: () => {
      axios.get(welcomeEndpoint).then( response => {
        console.log(response)
      })
    }
  }
</script>
