import {createWebHistory, createRouter} from "vue-router";
import home from './Pages/Home.vue';


import login from './Auth/Login.vue';
import register from './Auth/Register.vue';

import authenticatedLayout from './Layouts/AuthenticatedLayout.vue'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: home,
    },
    {
        path: '/user',
        name: 'AuthenticatedLayout',
        component: authenticatedLayout
    },
 
    {
        path: '/login',
        name: 'Login',
        component: login,
    },
    {
        path: '/register',
        name: 'Register',
        component: register,
    },

    
    
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router; 