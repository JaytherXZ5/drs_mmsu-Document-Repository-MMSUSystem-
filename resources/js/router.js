import {createWebHistory, createRouter} from "vue-router";
import home from './Pages/Home.vue';
import about from './Components/About.vue';
import dashboard from '../js/Components/Dashboard.vue';
import notFound from './Components/NotFound.vue';
import login from './Auth/Login.vue';
import register from './Auth/Register.vue';
import axios from 'axios'
import admin from './Admin/Admin.vue';
import authenticatedLayout from './Layouts/AuthenticatedLayout.vue';
import fileList from '../js/Components/FileList.vue';
const routes = [
    {
        path: '/',
        name: 'Home',
        component: home,
    },
    {
        path: '/my-files',
        name: 'AuthenticatedLayout',
        component: authenticatedLayout
    },
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: dashboard,
        
    },
    {
        path: '/folders/:id',
        name: 'FileList',
        component: fileList,
        meta: {title: 'File List'}
        
    },
    {
        path: '/about',
        name: 'About',
        component: about,
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

    {
        path: '/admin',
        name: 'Admin',
        component: admin,
    },
    
    
    
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router; 