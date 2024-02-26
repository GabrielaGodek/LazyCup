import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'HomeView',
        component: () => import('../views/Hello.vue')
    },
    {
        path: '/products',
        name: 'ListingView',
        component: () => import('../views/Listing.vue')
    },
    {
        path: '/products/:id',
        name: 'ProductView',
        props: true,
        component: () => import('../views/Product.vue')
    },
    {
        path: '/cart',
        name: 'CartView',
        component: () => import('../views/Cart.vue')
    },

];

const router = createRouter({
    history: createWebHistory((import.meta as any).env.BASE_URL),
    routes
});

export default router;
