<template>
  <div id="home">
    <h1>{{ msg }}</h1>
    <p>このサイトは、エンジニアリングに関する知識の記録・共有サービスであるQiitaのクローンアプリです。
    </p>
  </div>
</template>

<script>
export default {
  name: "home",
  data() {
    return {
      msg: "Hello Hackers!"
    };
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
