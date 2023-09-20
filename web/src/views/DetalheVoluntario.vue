<template>
  <div class="main-container">
    <div>
      <form id="voluntario-form" @submit.prevent="buscar">
        <div class="input-container">
            <label for="cpf">CPF do Voluntário</label>
            <input type="text" id="cpf" v-model="cpf">
        </div>
        <div class="input-container">
            <input type="submit" class="submit-btn" value="Buscar">
        </div>
      </form>
    </div>
    <div>
      <p>{{ info.nome }}</p>
      <p>{{ info.cpf }}</p>
      <p>{{ info.instituicao }}</p>
    </div>
  </div>
</template>

<script setup>
import api from '@/config/api';
import { ref } from 'vue';

const cpf = ref('');
const info = ref('');

function buscar() {
      api.get(`voluntarios/detalhe/${cpf.value}`).then((response) => {
            info.value = response.data;
      }).catch((error) => {
            console.log(error);
      })
}
</script>

<style scoped></style>
