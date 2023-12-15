<template>
   
    <slot name="surveyInstrument">
        
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
                                <th class="text-center border w-[350px]">Name</th>
                                <th class="text-center">Indicator</th>
                                <td class="text-center">Actions</td>
                            </tr>
                            
                        </thead>
                        
                        <tbody >
                           
                            <tr :key="survey_instrument.id" v-for="survey_instrument in survey_instruments" class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer  transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                <td class="text-start pl-4 border">
                                    <h1 class="truncate w-[380px]">{{ survey_instrument.survey_name }}</h1>
                                </td>
                                <td class="text-center pl-6 border">
                                    <h1 class="truncate w-[380px]">{{ survey_instrument.survey_indicator }}</h1>
                                </td>
                                <td>
                                    <button class="w-full text-center">button</button>
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
    name: 'MyFiles',
    components:{
        FileList
    },
    data(){
        return {selectedName: "",
            user_office: '',
            survey_instruments: [],

        }
    },
    methods:{

      async getCurrentUserOffice(){
        const response = await axios.get('/api/get-user-office');
            this.user_office = response.data.office;
            
      },
      async getSurveyInstruments() {
        try {
            const response = await axios.get('/api/survey-instruments');
            this.survey_instruments = response.data;
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
        this.getSurveyInstruments();
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