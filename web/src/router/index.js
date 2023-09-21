import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import CadastroVoluntarioView from "../views/voluntario/CadastroVoluntario.vue";
import DetalheVoluntarioView from "../views/voluntario/DetalheVoluntario.vue";
import ListaVoluntarioView from "../views/voluntario/ListaVoluntario.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/voluntarios/cadastro",
    name: "CadastroVoluntario",
    component: CadastroVoluntarioView
  },
  {
    path: "/voluntarios/detalhe",
    name: "DetalheVoluntario",
    component: DetalheVoluntarioView
  },
  {
    path: "/voluntarios/lista",
    name: "ListaVoluntario",
    component: ListaVoluntarioView
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
