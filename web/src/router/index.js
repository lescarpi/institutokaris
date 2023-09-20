import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import CadastroVoluntarioView from "../views/CadastroVoluntario.vue";
import DetalheVoluntarioView from "../views/DetalheVoluntario.vue"

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
  }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
