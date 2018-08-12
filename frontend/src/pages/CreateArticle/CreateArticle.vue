<template src='./createArticle.html'></template>
<style lang='scss' src='./createArticle.scss' scoped></style>
<script>
  import marked from 'marked';
  export default {
    data() {
      return {
        markdown: '',
      }
    },
    methods: {
      preview: function () {
        return marked(this.markdown);
      },
    }
  }
</script>
