<template>
  <div class="main-container">
    <div>
      <form id="voluntario-form" @submit.prevent="buscar">
        <div class="input-container">
          <label for="cpf">CPF do Voluntário</label>
          <input type="text" id="cpf" v-model="cpf" />
        </div>
        <div class="input-container">
          <input type="submit" class="submit-btn" value="Buscar" />
        </div>
      </form>
    </div>
    <div class="detalhe-container" v-if="mostrar">
      <p>Nome: {{ info.nome }}</p>
      <p>CPF: {{ info.cpf }}</p>
      <p>Instituição de Ensino: {{ info.instituicao }}</p>
    </div>
  </div>
</template>

<script setup>
import api from "@/config/api";
import { ref } from "vue";
import { useRoute } from "vue-router";

const cpf = ref("");
const info = ref("");
const mostrar = ref(false);
const route = useRoute();

if (route.query.cpf) {
  cpf.value = route.query.cpf;
  buscar();
}

function buscar() {
  api
    .get(`voluntarios/detalhe/${cpf.value}`)
    .then((response) => {
      limparForm();
      info.value = response.data;
      mostrar.value = true;
    })
    .catch((error) => {
      if (!error === undefined) {
        console.log(error.response);
        alert(error.response.data);
      }
    });
}

function limparForm() {
  cpf.value = "";
}
</script>

<style scoped>
.detalhe-container {
  border: 2px solid #222;
  margin: 15px;
  margin-left: 25%;
  width: 50%;
  padding: 15px;
}
</style>
