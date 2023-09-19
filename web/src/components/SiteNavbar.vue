<template>
  <nav id="navbar">
    <router-link to="/">Home</router-link>
    <router-link to="/about">About</router-link>
  </nav>
</template>

<script>
export default {
  name: "SiteNavbar",
};
</script>

<style scoped>
#navbar {
  background-color: #222;
  border-bottom: 4px solid #111;
  padding: 15px 50px;
  display: flex;
  justify-content: flex-end;
  align-items:center;
}

#navbar a {
  color: aliceblue;
  text-decoration: none;
  margin: 12px;
}

</style>
