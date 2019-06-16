import Vue from 'vue'
import Router from 'vue-router'

// Componentes de página
import Home from './components/Home.vue'
import Contato from './components/Contato.vue'

import Menu from './components/Menu.vue'
import PaginaNavegacao from './components/PaginaNavegacao.vue'

// Componentes navegáveis na página de navegação
import Perfil from './components/Perfil.vue'
import Aulas from './components/Aulas.vue'
import Alunos from './components/Alunos.vue'
import Publicacoes from './components/Publicacoes.vue'
import ProjetosPesquisa from './components/ProjetosPesquisa.vue'

// Componentes de edição alcançáveis a partir de seu respectivo componente
import EditarPerfil from './components/EditarPerfil.vue'
import EditarAulas from './components/EditarAulas.vue'
import EditarAlunos from './components/EditarAlunos.vue'
import EditarPublicacoes from './components/EditarPublicacoes.vue'
import EditarProjetosPesquisa from './components/EditarProjetosPesquisa.vue'


Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path:'/contato',
      name: 'contato',
      component: Contato
    },
    {
      path:'/paginanavegacao',
      name: 'paginanavegacao',
      component: PaginaNavegacao
    },
    {
      path:'/editaralunos',
      name: 'editaralunos',
      component: EditarAlunos
    },
    {
      path:'/editarperfil',
      name: 'editarperfil',
      component: EditarPerfil
    },
    {
      path:'/editarpublicacoes',
      name: 'editarpublicacoes',
      component: EditarPublicacoes
    },
    {
      path:'/editaraulas',
      name: 'editaraulas',
      component: EditarAulas
    },
    {
      path:'/editarprojetospesquisa',
      name: 'editarprojetospesquisa',
      component: EditarProjetosPesquisa
    },
    {
      path:'/alunos',
      name: 'alunos',
      component: Alunos
    },
    {
      path:'/aulas',
      name: 'aulas',
      component: Aulas
    },
    {
      path:'/publicacoes',
      name: 'publicacoes',
      component: Publicacoes
    },
    {
      path:'/projetospesquisa',
      name: 'projetospesquisa',
      component: ProjetosPesquisa
    },
    {
      path:'/perfil',
      name: 'perfil',
      component: Perfil
    },
    {
      path:'/menu',
      name: 'menu',
      component: Menu
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    }
  ]
})
