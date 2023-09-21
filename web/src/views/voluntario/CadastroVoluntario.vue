<template>
  <div class="main-container">
    <p>Componente de Mensagem</p>
    <div>
      <form id="voluntario-form" @submit.prevent="cadastrar">
        <div class="input-container">
          <label for="nome">Nome Completo: </label>
          <input
            type="text"
            id="nome"
            v-model="info.nome"
            placeholder="Digite seu nome completo"
          />
        </div>
        <div class="input-container">
          <label for="cpf">CPF: </label>
          <input
            type="text"
            id="cpf"
            v-model="info.cpf"
            placeholder="Digite seu CPF"
          />
        </div>
        <div class="input-container">
          <label for="instituicao">Instituição de Ensino: </label>
          <input
            type="text"
            id="instituicao"
            v-model="info.instituicao"
            placeholder="Digite o nome de sua instituição de ensino"
          />
        </div>
        <div class="input-container">
          <input type="submit" class="submit-btn" value="Cadastrar" />
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import api from "@/config/api";

const info = {
  nome: '',
  cpf: '',
  instituicao: ''
}

function cadastrar() {
  api
    .post("/voluntarios/cadastro", {
      nome: info.nome,
      cpf: info.cpf,
      instituicao: info.instituicao,
    })
    .then((response) => {
      console.log(response);
      limparForm();
    })
    .catch((error) => {
      console.log(error.response);
    });
}

function limparForm() {
  for (const campo in info) {
    if (Object.prototype.hasOwnProperty.call(info, campo)) {
      document.getElementById(campo).value = '';
    }
  }
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
  box-shadow: 7px 6px 28px 1px rgba(0, 0, 0, 0.24);
  transition: 0.2s all;
}
.submit-btn:active {
            transform: scale(0.98);
            box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
        }
</style>
