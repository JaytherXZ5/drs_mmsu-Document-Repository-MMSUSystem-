import {createWebHistory, createRouter} from "vue-router";
import home from './Pages/Home.vue';
import login from './Auth/Login.vue';
import register2 from './Auth/Register.vue';
import register from './Admin/Register.vue';
import area from './Admin/Area.vue';
import psv_area from './Admin/PSV_Area.vue';
import authenticatedLayout from './Layouts/AuthenticatedLayout.vue'
import axios from "axios";
import archive from "../js/Components/Archive.vue";
import myfiles from "../js/Components/MyFiles.vue";
import accounts from "../js/Admin/Accounts.vue";
import fileList from "../js/Components/FileList.vue";
import survey_instrument from "../js/Components/SurveyInstrument.vue";
import compliance_report from "../js/Components/ComplianceReport.vue";
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
                
                path: '/folders/:id',
                name: 'FileList', 
                component: fileList,

            },
            {
                path: '/areas',
                name: 'Area',
                component: area,
              },

              {
                path: '/psv_areas',
                name: 'PSV_Area',
                component: psv_area,
              },

            {
                path: '/register',
                name: 'Register',
                component: register

            },
            
            {
              path: '/user/archive',
              name: 'Archive',
              component: archive,
            },
            {
                path: '/user/survey_instruments',
                name: 'SurveyInstrument',
                component: survey_instrument,
              },
              {
                path: '/user/compliance_reports',
                name: 'ComplianceReport',
                component: compliance_report,
              },

            {
                path: '/accounts',
                name: 'Accounts',
                component: accounts,
              },



        ]
    },

    {
        path: '/login',
        name: 'Login',
        component: login,
    },
    {
        path: '/register2',
        name: 'Register2',
        component: register2,
    },

    
    
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router; 