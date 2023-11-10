import {createWebHistory, createRouter} from "vue-router";
import home from './Pages/Home.vue';

import admin from './Admin/Admin.vue';
import login from './Auth/Login.vue';
import register from './Auth/Register.vue';
import area from './Admin/Area.vue';
import authenticatedLayout from './Layouts/AuthenticatedLayout.vue'
import axios from "axios";
const routes = [
    {
        path: '/',
        name: 'Home',
        component: home,
    },
    {
        path: '/user',
        name: 'AuthenticatedLayout',
        component: authenticatedLayout,
        children: [
            {
              path: '/areas',
              name: 'Area',
              component: area,
            },


        ]
    },

    {
        path: '/admin',
        name: 'Admin',
        component: admin
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