import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Inventory from '../views/Inventory.vue'
import Recognition from '../views/Recognition.vue'
import Settings from '../views/Settings.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/inventory',
    name: 'Inventory',
    component: Inventory
  },
  {
    path: '/recognition',
    name: 'Recognition',
    component: Recognition
  },
  {
    path: '/settings',
    name: 'Settings',
    component: Settings
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
