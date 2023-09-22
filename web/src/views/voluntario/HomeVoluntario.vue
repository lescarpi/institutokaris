<template>
      <div class="main-container">
        <div>
          <div class="input-container">
            <router-link to="/voluntarios/cadastro" custom v-slot="{ navigate }">
              <input
                @click="navigate"
                type="submit"
                class="submit-btn"
                value="Cadastro de Voluntarios"
              />
            </router-link>
          </div>
        </div>
        <div>
          <div class="input-container">
                <router-link to="/voluntarios/detalhe" custom v-slot="{ navigate }">
              <input
                @click="navigate"
                type="submit"
                class="submit-btn"
                value="Buscar por Voluntario"
              />
            </router-link>
          </div>
        </div>
        <div>
          <div class="input-container">
                <router-link to="/voluntarios/lista" custom v-slot="{ navigate }">
              <input
                @click="navigate"
                type="submit"
                class="submit-btn"
                value="Lista de Voluntarios"
              />
            </router-link>
          </div>
        </div>
      </div>
    </template>
    
    <script setup></script>
    
    <style scoped></style>
    