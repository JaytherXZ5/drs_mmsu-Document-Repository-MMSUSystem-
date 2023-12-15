<template>
   
    <slot name="complianceReport">
        
       <div class=" border h-full w-full rounded-md p-1 ">
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
                           
                            <tr class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer  transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[200px]">jdlwdjmlm</h1>
                                </td>
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[50px]">1</h1>
                                </td>
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[200px]">jdlwdjmlm</h1>
                                </td>
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[200px]">jdlwdjmlm</h1>
                                </td>
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[200px]">jdlwdjmldwdwdwdm</h1>
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
import { faStar as regularStar, faTrashCan } from '@fortawesome/free-regular-svg-icons';
import { faStar as solidStar, faDownload, faEllipsisVertical,faChevronRight, faFolder} from '@fortawesome/free-solid-svg-icons' ;
import AuthenticatedLayout from '../Layouts/AuthenticatedLayout.vue';
import FileList from './FileList.vue';
import { format } from 'date-fns';

export default {
    
    components:{
        
    },
    data(){
        return {
            selectedName: "",
            compliance_reports:[],
            user_office: ''
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
    }
}
</script>
<style >
    
</style>