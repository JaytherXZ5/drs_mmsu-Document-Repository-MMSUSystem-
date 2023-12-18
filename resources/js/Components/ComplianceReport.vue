<template>
   
    <slot name="complianceReport">
        
       <div class="h-full w-full rounded-md p-1 ">
            <div class="transition-transform duration-500 flex flex-row items-center justify-start">
                
                <font-awesome-icon :icon="faFolder" class="ml-2 mr-2 text-3xl text-green-700 transition-transform duration-300"/>
                <button class="mr-2 transition-transform duration-500 hover:translate-x-2 flex flex-row items-center">
                    <font-awesome-icon :icon="faChevronRight" class="text-xl text-gray-700 "/>
                    <h1 class=" py-1 h-full font-montserrat text-xl hover:text-green-700  ml-1"> {{ this.user_office }}</h1>
                </button>
            </div>
            
           
            <div class="w-full h-full  flex flex-col items-start mt-1 ">
                <div class="border shadow-b w-full px-2 h-[calc(100%-50px)] bg-gray-100 overflow-y-auto scrollbar-container rounded-md">
                    
                    <table class=" w-full">
                        <thead class=" z-10 rounded-md font-mono sticky top-0 shadow-b bg-gray-100">
                            
                            
                            <tr class=" text-gray-700  border-gray-200 rounded-sm font-montserrat ">
                                <th class="text-center w-[200px] ">Area</th>
                                <th class="text-center w">Order</th>
                                <th class="text-center">AACCUP Recommendations</th>
                                <th class="text-center">Action Taken</th>
                                <th class="text-center">%COMPLIANCE</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            
                        </thead>
                        
                        <tbody >
                           
                            <tr :key="compliance_report.id" v-for="compliance_report in compliance_reports" class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer  transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                <td class="text-start pl-4 ">
                                    <h1 class="truncate text-center w-[200px]">{{ compliance_report.psv_area.area_name }}</h1>
                                </td>
                                <td class="text-start pl-4">
                                    <h1 class="truncate text-center w-[50px]">{{ compliance_report.compliance_order }}</h1>
                                </td>
                                <td class="text-start pl-4">
                                    <h1 class="truncate text-center w-[200px]">{{ compliance_report.aaccup_recommendations }}</h1>
                                </td>
                                <td class="text-start pl-4">
                                    <h1 class="truncate text-center w-[200px]">{{ compliance_report.action_taken }}</h1>
                                </td>
                                <td class="text-start pl-4">
                                    <h1 class="truncate text-center w-[200px]">{{ compliance_report.percent_compliance }}%</h1>
                                </td>
                                <td class="text-start pl-4">
                                    <Menu as="div" class="relative inline-block text-left w-[60%]">
                                    <div class="flex flex-row items-center justify-center">
                                        <MenuButton 
                                        type="button"
                                        class="outline-none items-center justify-center flex flex-row h-10 w-full rounded-md "
                                        >
                                        
                                        
                                        <font-awesome-icon :icon="faEllipsis" class="border hover:border-2 hover:border-lime-500 w-4 h-4 p-1 rounded-full bg-gray-200 text-green-700 transition-transform duration-300 hover:scale-110 "/>
                                        
                            
                                        </MenuButton>
                                    </div>

                                    <transition
                                        enter-active-class="transition duration-300 ease-out"
                                        enter-from-class="transform scale-95 opacity-0"
                                        enter-to-class="transform scale-100 opacity-100"
                                        leave-active-class="transition duration-75 ease-in"
                                        leave-from-class="transform scale-100 opacity-100"
                                        leave-to-class="transform scale-95 opacity-0"
                                    >
                                        <MenuItems
                                        class="border-2  shadow-r z-50 border-gray-400 absolute ml-10 -left-52 -top-1 mt-2 w-[200px] origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-slate-700 ring-opacity-5 focus:outline-none"
                                        >
                                        <div class="px-1 py-1 z-50">
                                            
                                            <MenuItem v-slot="{ active }">
                                            <button
                                                @click="showDetails(file.file)"
                                                :class="[
                                                active ? 'bg-blue-200 text-gray-700 ' : 'text-gray-600 ',
                                                'group flex w-full items-center rounded-md px-2 py-1 text-sm  border',
                                                ]"
                                            >
                                                <!-- Adjust the content based on your institution model structure -->
                                                Details
                                            </button>
                                            </MenuItem>
                                            <MenuItem v-slot="{ active }">
                                            <button
                                                @click="showRename(file.file)"
                                                :class="[
                                                active ? 'bg-blue-200 text-gray-700 ' : 'text-gray-600 ',
                                                'group flex w-full items-center rounded-md px-2 py-1 text-sm  border',
                                                ]"
                                            >
                                                <!-- Adjust the content based on your institution model structure -->
                                                Edit
                                            </button>
                                            </MenuItem>

                                        </div>
                                        </MenuItems>
                                    </transition>
                                    </Menu>

                                </td>
                            </tr>       
                        </tbody>
                        
                    </table>



                </div>
               
            </div>
       </div>


        
    </slot>
</template>
<script>

import axios from 'axios';
import { faStar as regularStar, faTrashCan,} from '@fortawesome/free-regular-svg-icons';
import { faStar as solidStar, faDownload, faEllipsis,faChevronRight, faFolder} from '@fortawesome/free-solid-svg-icons' ;
import AuthenticatedLayout from '../Layouts/AuthenticatedLayout.vue';
import FileList from './FileList.vue';
import { format } from 'date-fns';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';

export default {
    
    components:{
        Menu, MenuButton, MenuItems, MenuItem
    },
    data(){
        return {
            selectedName: "",
            compliance_reports:[],
            user_office: '',
    
        }
    },
    methods:{

      async getCurrentUserOffice(){
        const response = await axios.get('/api/get-user-office');
            this.user_office = response.data.office;
            
      },

      async getComplianceReports() {
        try {
            const response = await axios.get('/api/compliance-reports');
            this.compliance_reports = response.data;
        } catch (error) {
            console.error('Error fetching folders:', error);
        }
    },

    formatTimestamp(timestamp) {
        return format(new Date(timestamp), 'MM/dd/yyyy');
    },
     
    },
    created(){
        
    },
    mounted(){
        this.getComplianceReports();
        this.getCurrentUserOffice();
    },
    computed:{
        faRegularStar(){return regularStar;},
        faSolidStar(){return solidStar;},
        faChevronRight(){return faChevronRight;},
        faFolder(){return faFolder;},
        faEllipsis(){return faEllipsis;},
    }
}
</script>
<style >
    
</style>