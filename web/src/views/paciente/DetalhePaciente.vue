<template>
  <div class="main-container">
    <div>
      <form id="paciente-form" @submit.prevent="buscar">
        <div class="input-container">
          <label for="cpf">CPF do Paciente</label>
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
      <p>Endereço: {{ info.logradouro }}</p>
      <p>Bairro: {{ info.bairro }}</p>
      <p>Telefone: {{ info.telefone }}</p>
      <p>Data de Nascimento: {{ info.dataDeNascimento }}</p>
      <p>Quantas pessoas moram na residência: {{ info.pessoasResidencia }}</p>
      <p>
        Quantas pessoas que moram na residência trabalham:
        {{ info.pessoasResidenciaQueTrabalham }}
      </p>
      <p>Renda familiar: {{ info.rendaFamilia }}</p>
      <p>Como conheceu o instituto: {{ info.comoConheceu }}</p>
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
    .get(`pacientes/detalhe/${cpf.value}`)
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
