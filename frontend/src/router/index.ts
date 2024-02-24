import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'homeView',
        component: () => import('../views/Hello.vue')
    },
    {
        path: '/products',
        name: 'listingView',
        component: () => import('../views/Listing.vue')
    },
    {
        path: '/products/:id',
        name: 'productView',
        props: true,
        component: () => import('../views/Product.vue')
    },

];

const router = createRouter({
    history: createWebHistory((import.meta as any).env.BASE_URL),
    routes
});

export default router;
