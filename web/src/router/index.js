import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import CadastroVoluntarioView from "../views/voluntario/CadastroVoluntario.vue";
import DetalheVoluntarioView from "../views/voluntario/DetalheVoluntario.vue";
import ListaVoluntarioView from "../views/voluntario/ListaVoluntario.vue";
import CadastroPacienteView from "../views/paciente/CadastroPaciente.vue";
import DetalhePacienteView from "../views/paciente/DetalhePaciente.vue";
import ListaPacienteView from "../views/paciente/ListaPaciente.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/voluntarios/cadastro",
    name: "CadastroVoluntario",
    component: CadastroVoluntarioView,
  },
  {
    path: "/voluntarios/detalhe",
    name: "DetalheVoluntario",
    component: DetalheVoluntarioView,
  },
  {
    path: "/voluntarios/lista",
    name: "ListaVoluntario",
    component: ListaVoluntarioView,
  },
  {
    path: "/pacientes/cadastro",
    name: "CadastroPaciente",
    component: CadastroPacienteView,
  },
  {
    path: "/pacientes/detalhe",
    name: "DetalhePaciente",
    component: DetalhePacienteView,
  },
  {
    path: "/pacientes/lista",
    name: "ListaPaciente",
    component: ListaPacienteView
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
