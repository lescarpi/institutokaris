<template>
  <div class="main-container">
    <p>Componente de Mensagem</p>
    <div>
      <form id="paciente-form" @submit.prevent="cadastrar">
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
          <label for="logradouro">Endereço: </label>
          <input
            type="text"
            id="logradouro"
            v-model="info.logradouro"
            placeholder="Digite seu endereço"
          />
        </div>
        <div class="input-container">
          <label for="bairro">Bairro: </label>
          <input
            type="text"
            id="bairro"
            v-model="info.bairro"
            placeholder="Digite seu bairro"
          />
        </div>
        <div class="input-container">
          <label for="telefone">Telefone: </label>
          <input
            type="text"
            id="telefone"
            v-model="info.telefone"
            placeholder="Digite seu telefone"
          />
        </div>
        <div class="input-container">
          <label for="dataDeNascimento">Data de Nascimento: </label>
          <input
            type="date"
            id="dataDeNascimento"
            v-model="info.dataDeNascimento"
          />
        </div>
        <div class="input-container">
          <label for="pessoasResidencia"
            >Quantas pessoas moram em sua residência:
          </label>
          <input
            type="number"
            id="pessoasResidencia"
            v-model="info.pessoasResidencia"
          />
        </div>
        <div class="input-container">
          <label for="pessoasResidenciaQueTrabalham"
            >Quantas pessoas trabalham em sua residência:
          </label>
          <input
            type="number"
            id="pessoasResidenciaQueTrabalham"
            v-model="info.pessoasResidenciaQueTrabalham"
          />
        </div>
        <div class="input-container">
          <label for="rendaFamilia">Renda familiar: </label>
          <select id="rendaFamilia" v-model="info.rendaFamilia">
            <option value="R$ 1,000.00 a R$ 2,000.00">R$ 1,000.00 a R$ 2,000.00</option>
            <option value="$ 2,001.00 a R$ 5,000.00">R$ 2,001.00 a R$ 5,000.00</option>
            <option value="Mais de R$ 5,000.00">Mais de R$ 5,000.00</option>
          </select>
        </div>
        <div class="input-container">
          <label for="comoConheceu">Como conheceu o instituto? </label>
          <select id="comoConheceu" v-model="info.comoConheceu">
            <option value="Instagram">Instagram</option>
            <option value="Facebook">Facebook</option>
            <option value="Google">Google</option>
          </select>
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
import moment from "moment";

const info = {
  nome: "",
  cpf: "",
  logradouro: "",
  bairro: "",
  telefone: "",
  dataDeNascimento: "",
  pessoasResidencia: "",
  pessoasResidenciaQueTrabalham: "",
  rendaFamilia: "",
  comoConheceu: "",
};

function cadastrar() {
  info.dataDeNascimento = moment(info.dataDeNascimento, "YYYY-MM-DD").format("DD/MM/YYYY");
  api
    .post("/pacientes/cadastro", {
      nome: info.nome,
      cpf: info.cpf,
      logradouro: info.logradouro,
      bairro: info.bairro,
      telefone: info.telefone,
      dataDeNascimento: info.dataDeNascimento,
      pessoasResidencia: info.pessoasResidencia,
      pessoasResidenciaQueTrabalham: info.pessoasResidenciaQueTrabalham,
      rendaFamilia: info.rendaFamilia,
      comoConheceu: info.comoConheceu,
    })
    .then((response) => {
      limparForm();
      console.log(response);
    })
    .catch((error) => {
      console.log(error.response);
    });
}

function limparForm() {
  for (const campo in info) {
    if (Object.prototype.hasOwnProperty.call(info, campo)) {
      document.getElementById(campo).value = "";
    }
  }
}
</script>

<style>
#paciente-form {
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

input,
select {
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
