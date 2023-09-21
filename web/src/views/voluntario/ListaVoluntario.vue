<template>
  <div class="main-container">
    <div class="list-container">
      <h2>Lista de Voluntários</h2>
      <div>
        <ol>
          <li v-for="voluntario in voluntarios" :key="voluntario.id">
            Nome: {{ voluntario.nome }} <br />
            CPF: {{ voluntario.cpf }} <br />
            Instituição de Ensino: {{ voluntario.instituicao }}
          </li>
        </ol>
      </div>
    </div>
  </div>
</template>

<script setup>
import api from "@/config/api";
import { ref } from "vue";

const voluntarios = ref([]);

api
  .get("voluntarios/lista")
  .then((response) => {
    voluntarios.value = response.data.content;
    console.log(response.data);
  })
  .catch((error) => {
    alert(error.response.data);
  });
</script>

<style scoped>
h2 {
  text-align: center;
  font-weight: bold;
  margin-bottom: 15px;
  color: #222;
  padding: 5px 10px;
}

ol li {
  list-style-type: none;
  border: 2px solid #222;
  margin: 15px;
  margin-left: 25%;
  width: 50%;
  padding: 15px;
}
</style>
