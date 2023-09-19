<template>
  <SiteNavbar />
  <router-view />
  <SiteFooter />
</template>

<script>
  import SiteNavbar from './components/SiteNavbar.vue';
  import SiteFooter from './components/SiteFooter.vue';

  export default {
    components: {
      SiteNavbar,
      SiteFooter
    },
    data() {
      return {
      }
    }
  }
</script>

<style>
  * {
    font-family: Helvetica;
    padding: 0;
    margin: 0;
    box-sizing: border-box;
  }

  .main-container {
    margin: 50px;
    min-height: 250px;
  }

  h1 {
    text-align: center;
    font-size: 42px;
    margin-bottom: 30px;
    color: #222;
  }
</style>
