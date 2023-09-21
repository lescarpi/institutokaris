<template>
  <div class="main-container">
    <div class="list-container">
      <h2>Lista de Pacientes</h2>
      <div>
        <ol>
          <li v-for="paciente in pacientes" :key="paciente.id">
            Nome: {{ paciente.nome }} <br />
            CPF: {{ paciente.cpf }}
            <router-link :to="'/pacientes/detalhe/' + paciente.cpf" custom v-slot="{ navigate }">
              <button @click="navigate" role="link" id="detalhe">></button>
            </router-link>
          </li>
        </ol>
      </div>
    </div>
  </div>
</template>

<script setup>
import api from "@/config/api";
import { ref } from "vue";

const pacientes = ref([]);

api
  .get("pacientes/lista")
  .then((response) => {
    pacientes.value = response.data.content;
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

#detalhe {
  border-radius: 50%;
  float: inline-end;
  background-color: #222;
  color: aliceblue;
  cursor: pointer;
  padding: 5px;
}
</style>
