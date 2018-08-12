<template src='./articleIndex.html'></template>
<style lang='scss' src='./articleIndex.scss'></style>
<script>
  import axios from 'axios'

  export default  {
    data: {
      results: []
    },
    mounted() {
      this.articleTitle();
      axios.get("http://localhost:8080/api/v1/articles")
      .then( response => {
        console.log(response.data)
        console.log(response.data['title'])
      })
    },
    methods: {
      articleTitle: function () {
        axios.get("http://localhost:8080/api/v1/articles")
          .then( response => {
            this.results = response.data.message;
          }).catch( error => { console.log(error);
          });
      }
    }
  }
</script>
