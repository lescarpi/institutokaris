<template>
  <div class="main-container">
    <p>Componente de Mensagem</p>
    <div>
      <form id="voluntario-form" @submit.prevent="cadastrar">
        <div class="input-container">
          <label for="nome">Nome Completo: </label>
          <input type="text" id="nome" v-model="nome" placeholder="Digite seu nome completo">
        </div>
        <div class="input-container">
          <label for="cpf">CPF: </label>
          <input type="text" id="cpf" v-model="cpf" placeholder="Digite seu CPF">
        </div>
        <div class="input-container">
          <label for="instituicao">Instituição de Ensino: </label>
          <input type="text" id="instituicao" v-model="instituicao" placeholder="Digite o nome de sua instituição de ensino">
        </div>
        <div class="input-container">
          <input type="submit" class="submit-btn" value="Cadastrar">
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import api from '@/config/api';
import { ref } from 'vue';

const nome = ref('');
const cpf = ref('');
const instituicao = ref('');

function cadastrar() {
  api.post('/voluntarios/cadastro', {
    nome: nome.value,
    cpf: cpf.value,
    instituicao: instituicao.value
  }).then((response) => {
    limparForm();
    console.log(response);
  }).catch((error) => {
    console.log(error.response)
  })
}

function limparForm() {
  nome.value = '';
  cpf.value = '';
  instituicao.value = '';
}
</script>

<style>
  #voluntario-form {
    max-width: 30%;
    margin: 0 auto;
  }

  .input-container {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
  }

  label {
    font-weight: bold;
    margin-bottom: 15px;
    color: #222;
    padding: 5px 10px;
    border-left: 4px solid #222;
  }

  input {
    padding: 5px 10px;
    width: 100%;
  }

  .submit-btn {
    background-color: #222;
    color: aliceblue;
    font-weight: bold;
    border: 2px solid #222;
    padding: 10px;
    font-size: 16px;
    margin: 0 auto;
    cursor: pointer;
  }
</style>

