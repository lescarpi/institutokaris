<template>
  <div class="main-container">
    <div>
      <div class="input-container">
        <router-link to="/pacientes/cadastro" custom v-slot="{ navigate }">
          <input
            @click="navigate"
            type="submit"
            class="submit-btn"
            value="Cadastro de Pacientes"
          />
        </router-link>
      </div>
    </div>
    <div>
      <div class="input-container">
            <router-link to="/pacientes/detalhe" custom v-slot="{ navigate }">
          <input
            @click="navigate"
            type="submit"
            class="submit-btn"
            value="Buscar por Paciente"
          />
        </router-link>
      </div>
    </div>
    <div>
      <div class="input-container">
            <router-link to="/pacientes/lista" custom v-slot="{ navigate }">
          <input
            @click="navigate"
            type="submit"
            class="submit-btn"
            value="Lista de Pacientes"
          />
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup></script>

<style scoped></style>
