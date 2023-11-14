import {createWebHistory, createRouter} from "vue-router";
import home from './Pages/Home.vue';

import admin from './Admin/Admin.vue';
import login from './Auth/Login.vue';
import register from './Auth/Register.vue';
import area from './Admin/Area.vue';
import authenticatedLayout from './Layouts/AuthenticatedLayout.vue'
import axios from "axios";
import archive from "../js/Components/Archive.vue";
import myfiles from "../js/Components/MyFiles.vue";
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
            {
              path: '/user/archive',
              name: 'Archive',
              component: archive,
            },


        ]
    },

    {
        path: '/admin',
        name: 'Admin',
        component: admin,
        children: [
           


        ]
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