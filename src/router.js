import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Contato from './views/Contato.vue'
import Menu from './views/Menu.vue'
import Perfil from './views/Perfil.vue'
import EditarInformacoes from './views/EditarInformacoes.vue'
import Alunos from './views/Alunos.vue'

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
      path:'/editar',
      name: 'editar',
      component: EditarInformacoes
    },
    {
      path:'/alunos',
      name: 'alunos',
      component: Alunos
    },
    {
      path:'/contato',
      name: 'contato',
      component: Contato
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
