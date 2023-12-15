<template>
    <div :class="{'hidden': !surveyInstrument_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 overflow-auto z-50 bg-opacity-30 flex justify-center items-start p-5': surveyInstrument_modalActive}">
        <div class="bg-white w-[60%] h-[55%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="surveyInstrument_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="surveyInstrument_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
            
                                <div>
                                    <div class="h-[500px] p-6 overflow-y-auto">
                                        
                                        <div class=" flex flex-row items-center">
                                            <!--SURVEY TYPES-->
                                            <h1 class="font-montserrat text-green-700">SURVEY TYPE: </h1>
                                            <div class="flex w-[30%] items-center">
                                                <select v-model="selectedSurveyType" @change="handleSurveyType(selectedSurveyType)" class="w-full ml-4 bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none">
                                                    <option v-for="survey_type in survey_types" :key="survey_type.id" :value="survey_type">{{ survey_type.type}}</option>
                                                </select>    
                                            </div>
                                        </div>
                                        
                                        <div v-if="isDefault" class="">
                                            
                                            <h1 class="font-montserrat text-gray-600 mt-2">
                                                Survey Instruments
                                            </h1>
                                            <div class="border w-full"></div>
                                            <div class=" flex flex-row gap-2 mt-2">
                                                <div class=" w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Area <span class="text-red-500">*</span></h1>
                                                    <select class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option>Select Area</option>
                                                    </select>
                                                    
                                                    
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Parameter<span class="text-red-500">*</span></h1>
                                                    <select class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option>Select Parameters</option>
                                                    </select>                                                
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Type<span class="text-red-500">*</span></h1>
                                                    <select  class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option > Select Indicator Type</option>
                                                    </select>                                                
                                                </div>  
                                            </div>

                                            <div class="flex flex-row gap-2 mt-2">
                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Parent<span class="text-red-500">*</span></h1>
                                                    <select  class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option value=""></option>
                                                    </select> 
                                                </div>

                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Order<span class="text-red-500">*</span></h1>
                                                    <select class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option value=""></option>
                                                    </select> 
                                                </div>
                                            </div>

                                            <div class="mt-4 flex-col">
                                                <h1 class="font-montserrat text-green-700">Indicator<span class="text-red-500">*</span></h1>
                                                <input class="w-full bg-gray-100 rounded-md hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="Indicator" type="text">
                                            </div>
                                                                   
                                            <div class="flex flex-row justify-end mt-4">
                                                <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Submit</button>
                                                <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Clear All</button>
                                                <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>
                                            </div>

                                            
                                        </div>

                                        <div v-if="isPsv" class="">
                                            <form action="">
                                            <h1 class="font-montserrat text-gray-600 mt-2">
                                                Survey Instruments
                                            </h1>
                                            <div class="border w-full"></div>
                                            <div class=" flex flex-row gap-2 mt-2">
                                                <div class=" w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Area <span class="text-red-500">*</span></h1>
                                                    <select v-model="selectedArea" @change="handleArea(selectedArea)" class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option v-for="psv_area in psv_areas" :key="psv_area.id" :value="psv_area">{{ psv_area.area_name+'-'+psv_area.area_description }}</option>
                                                    </select>
                                                    
                                                    
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Parameter<span class="text-red-500">*</span></h1>
                                                    <select v-model="selectedParameter" @change="handleParameter(selectedParameter)" class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option v-for="parameter in psv_parameters" :key="parameter.id" :value="parameter">{{ parameter.parameter_letter + " - " + parameter.parameter_description }}</option>
                                                    </select>                                                
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Type<span class="text-red-500">*</span></h1>
                                                    <select v-model="selectedIndicatorType" @change="handleIndicatorType(selectedIndicatorType)" class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option v-for="indicatorType in indicatorTypes" :key="indicatorType.id" :value="indicatorType">{{ indicatorType.type_name }}</option>
                                                    </select>                                                
                                                </div>  
                                            </div>

                                            <div class="flex flex-row gap-2 mt-2">
                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Parent<span class="text-red-500">*</span></h1>
                                                    <select  class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option value=""></option>
                                                    </select> 
                                                </div>

                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Order<span class="text-red-500">*</span></h1>
                                                    <select class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option value=""></option>
                                                    </select> 
                                                </div>
                                            </div>

                                            <div class=" mt-4 flex-col">
                                                <h1 class="font-montserrat text-green-700">Indicator<span class="text-red-500">*</span></h1>
                                                <input class="w-full bg-gray-100 rounded-md hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="Indicator" type="text">
                                            </div>
                                            
                                            
                                            <div class="flex flex-row justify-end mt-4">
                                                <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Submit</button>
                                                <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Clear All</button>
                                                <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>
                                            </div>

                                            </form>
                                        </div>
                                        

                                    </div>
                                    
                                    
                                </div>
                        </div>
                    </transition>
                </div>
            </transition>
        </div>
    </div>
   
</template>

<script>

import {faCircleXmark} from '@fortawesome/free-regular-svg-icons'
import axios from 'axios';
import Swal from 'sweetalert2';
import { faPaperclip } from '@fortawesome/free-solid-svg-icons';

export default{
    data() {
        return {
            survey_form:{
                survey_name:'',
                type:'',
                survey_order:'',
                survey_level:'',
                survey_indicator:'',
            },
            survey_types: [],
            psv_parameters: [],
            survey_indicator_types: [],
            psv_areas: [],
            psv_parameters:[],
            indicatorTypes:[],
            selectedSurveyType:null,
            selectedArea: null,
            selectedParameter:null,
            selectedIndicatorType: null,
            isPsv:false,
            isPhase1: false,
            isDefault: true,
        };
    },
    methods: {

        //Survey Instrument
        async getPSV_Areas(){
           await axios.get('api/psv_areas').then(({data})=>{
            this.psv_areas = data;
           }).catch((error)=>{
            console.log(error);
           })
        },
        async fetchPsvAreas() {
            try {
                const response = await axios.get('/api/psv_areas');
                this.psv_areas = response.data;
                
            } catch (error) {
                console.error(error);
            }
        },

        async getSurveyTypes() {
            try {
                const response = await axios.get(`/api/survey-types`);
                this.survey_types = response.data;
                
            } catch (error) {
                console.error(error);
            }
        },
        async fetchPsvParameters(){
            try{
                const response = await axios.get('/api/psv-parameters');
                this.psv_parameters = response.data;
            }catch(error){
                console.log(error)
            }
        },

        async fetchSurveyIndicatorTypes(){
            try{
                const response = await axios.get('/api/survey-indicator-types');
                this.indicatorTypes = response.data;
            }catch(error){
                console.log(error);
            }
        },

        handleSurveyType(surveyType){
            if(surveyType.type === "---"|| surveyType.type === null){
                this.isDefault = true;
                this.isPhase1 = false;
                this.isPsv = false;
            }else if(surveyType.type==='Psv'){
                this.fetchPsvParameters();
                this.fetchSurveyIndicatorTypes();
                this.fetchPsvAreas();
                this.isPsv = true;
                this.isDefault = false;
                this.isPhase1 = false;
            }else if(surveyType.type=='Phase 1'){
                this.getPhase1();
                this.isPhase1=true;
                this.isDefault = false;
                this.isPsv = false;
            }
        },
        handleArea(selectedArea){
            
        },
        handleParameter(selectedParameter){

        },
        handleIndicatorType(selectedIndicatorType){

        },



       

    },
    props: ["surveyInstrument_modalActive"],
    setup(props, { emit }) {
        const close = () => {
            emit('close');
        };
        return { close };
    },

    computed:{
        faPaperClip(){return faPaperclip;},
    },
    mounted(){
        this.getSurveyTypes();
        
    }
    


}
</script>
