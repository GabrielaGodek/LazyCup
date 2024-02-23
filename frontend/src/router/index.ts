import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'homeView',
        component: () => import('../views/Hello.vue')
    },
    {
        path: '/products',
        name: 'products',
        component: () => import('../views/Products.vue')
    },

];

const router = createRouter({
    history: createWebHistory((import.meta as any).env.BASE_URL),
    routes
});

export default router;
