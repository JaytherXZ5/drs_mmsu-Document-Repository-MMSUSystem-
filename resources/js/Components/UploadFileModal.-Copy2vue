<template>
    <div :class="{'hidden': !upload_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 overflow-auto z-50 bg-opacity-30 flex justify-center items-start p-5': upload_modalActive}">
        <div class="bg-gray-100 w-[80%] h-[95%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="upload_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="upload_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
            
                                <div>

                                    <div class="h-[650px] p-6 overflow-y-auto">
                                        
                                        <div class=" flex flex-row items-center">
                                            <!--SURVEY TYPES-->
                                            <h1 class=" w-[140px] font-montserrat text-green-700">SURVEY TYPE: </h1>
                                            <div class="flex w-[370px] items-center">
                                                <select v-model="selectedSurveyType" @change="handleSurveyType(selectedSurveyType)" class="w-full bg-gray-200 shadow-inner border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none">
                                                    <option v-for="survey_type in survey_types" :key="survey_type.id" :value="survey_type">{{ survey_type.type}}</option>
                                                </select>    
                                            </div>
                                            <div class="w-[60%] flex justify-end">
                                                <button  @click.prevent="close" class=" border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>
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
                                                    <select class="w-full bg-gray-200 border-b-4 shadow-inner border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option>Select Area</option>
                                                    </select>
                                                    
                                                    
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Parameter<span class="text-red-500">*</span></h1>
                                                    <select class="w-full bg-gray-200 border-b-4 shadow-inner border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option>Select Parameters</option>
                                                    </select>                                                
                                                </div>
                                                <div class=" w-full">
                                                    <h1 class="font-montserrat text-green-700">Type<span class="text-red-500">*</span></h1>
                                                    <select  class="w-full bg-gray-200 shadow-inner border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option > Select Indicator Type</option>
                                                    </select>                                                
                                                </div>  
                                            </div>

                                            <div class="flex flex-row gap-2 mt-2">
                                            <!--
                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Parent<span class="text-red-500">*</span></h1>
                                                    <select  class="w-full bg-gray-100 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                        <option value=""></option>
                                                    </select> 
                                                </div>

                                                <div class="w-full flex flex-col">
                                                    <h1 class="font-montserrat text-green-700">Order<span class="text-red-500">*</span></h1>
                                                    <input class="w-full bg-gray-200 rounded-md shadow-inner hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="Indicator" type="number">

                                                </div>
                                            -->
                                            </div>

                                            <div class="mt-4 flex-col">
                                                <h1 class="font-montserrat text-green-700">Indicator<span class="text-red-500">*</span></h1>
                                                <input class="w-full bg-gray-100 rounded-md hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="Indicator" type="text">
                                            </div>
                                                                   
                                            <div class="flex flex-row justify-end mt-4">
                                                <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Submit</button>
                                                <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Clear All</button>
                                            </div>

                                            
                                        </div>

                                        <div v-if="isPsv" class="">
                                            <!--SURVEY INSTRUMENT-->
                                            <div>
                                                <form @submit.prevent="this.submitSurveyInstrument()">
                                                <h1 class="font-montserrat text-gray-600 mt-2">
                                                    Survey Instruments
                                                </h1>
                                                <div class="border border-lime-500 w-full"></div>
                                                <div class=" flex flex-row gap-2 mt-2">
                                                    <div class=" w-full flex flex-col">
                                                        <h1 class="font-montserrat text-green-700">Area <span class="text-red-500">*</span></h1>
                                                        <select v-model="selected_survey_area" @change="handleSurveyArea(selected_survey_area)" class="w-full shadow-inner bg-gray-200 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none"   name="" id="">
                                                            <option :class="{'hidden':psv_area.id === 0, '': psv_area.id !==0}"  v-for="psv_area in psv_areas" :key="psv_area.id" :value="psv_area.area_name">{{ psv_area.area_name+' - '+psv_area.area_description }}</option>
                                                        </select>
                                                        
                                                        
                                                    </div>
                                                    <div class=" w-full">
                                                        <h1 class="font-montserrat text-green-700">Parameter<span class="text-red-500">*</span></h1>
                                                        <select v-model="selected_parameter"  @change="handleSurveyParameter(selected_parameter)" class="w-full shadow-inner bg-gray-200 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                            <option v-for="parameter in psv_parameters" :key="parameter.id" :value="parameter.parameter_letter + ' - ' + parameter.parameter_description "> {{ parameter.parameter_letter + " - " + parameter.parameter_description }}</option>
                                                        </select>                                                
                                                    </div>
                                                    <div class=" w-full">
                                                        <h1 class="font-montserrat text-green-700">Type<span class="text-red-500">*</span></h1>
                                                        <select v-model="survey_form.type" class="w-full shadow-inner bg-gray-200 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                            <option v-for="indicatorType in indicatorTypes" :key="indicatorType.id" :value="indicatorType.id">{{ indicatorType.type_name }}</option>
                                                        </select>                                                
                                                    </div>  
                                                </div>
                                                
                                                <div class="flex flex-row gap-2 mt-2">
                                                    
                                                    <div class="w-full flex flex-col">
                                                        <h1 class="font-montserrat text-green-700">Parent<span class="text-red-500">*<i class="text-gray-400 text-sm">(Leave blank if indicator is first Level)</i></span></h1>
                                                        <select  class="w-full bg-gray-200 border-b-4 shadow-inner border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                            <option value=""></option>
                                                        </select> 
                                                    </div>
                                                
                                                    <div class="w-full flex flex-col">
                                                        <h1 class="font-montserrat text-green-700">Order<span class="text-red-500">*</span></h1>
                                                        <input v-model="survey_form.survey_order" class="w-full bg-gray-200 border-b-4 rounded-md shadow-inner  hover:border-b-lime-500 border border-gray-300   focus:outline-none text-base px-4 py-[1px]" placeholder="Order" type="number">

                                                    </div>
                                                </div>
                                                
                                                <div class=" mt-4 flex-col">
                                                    <h1 class="font-montserrat text-green-700">Indicator<span class="text-red-500">*</span></h1>
                                                    <input v-model="survey_form.survey_indicator" class="w-full bg-gray-200 rounded-md shadow-inner hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="Indicator" type="text">
                                                </div>
                                                
                                                
                                                <div class="flex flex-row justify-end mt-4">
                                                    <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Submit</button>
                                                    <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Clear All</button>
                                                </div>

                                                
                                                


                                                </form>
                                            </div>
                                            <!--COMPLIANCE REPORT-->
                                            <div class="mt-2">
                                                <form @submit.prevent="submitComplianceReport">
                                                    <h1 class="font-montserrat text-gray-500">COMPLIANCE REPORT</h1>
                                                    <div class="border border-lime-600"></div>

                                                    <div class="flex flex-row mt-4 gap-4">
                                                        <div class="w-full flex flex-col">
                                                            <h1 class="font-montserrat text-green-700">Area <span class="text-red-500">*</span></h1>
                                                            <select v-model="compliance_form.psv_area_id" class="w-full shadow-inner bg-gray-200 border-b-4 border-gray-300 rounded h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                                <option v-for="psv_area in psv_areas" :key="psv_area.id" :value="psv_area.id">{{ psv_area.area_name+'-'+psv_area.area_description }}</option>
                                                            </select>
                                                        </div>
                                                      
                                                        <div class="w-full flex flex-col">
                                                            <h1 class="font-montserrat text-green-700">Order<span class="text-red-500">*</span></h1>
                                                            <input v-model="compliance_form.compliance_order"  class="w-full bg-gray-200 border-b-4 rounded-md shadow-inner  hover:border-b-lime-500 border border-gray-300   focus:outline-none text-base px-4 py-[1px]" placeholder="Order" type="number">
                                                        </div>
                                                    
                                                    </div>
                                                    <div class="w-full flex flex-row mt-4 gap-4">
                                                        <div class="w-full flex flex-col">
                                                            <h1 class="font-montserrat text-green-700">AACCUP Reccomendations<span class="text-red-500">*</span></h1>
                                                            <textarea v-model="compliance_form.aaccup_recommendations"  cols="20" rows="5" class="p-2 mt-4 rounded-md outline-none border bg-gray-200 shadow-inner font-montserrat text-sm text-gray-500" ></textarea>
                                                        </div>
                                                        <div class="w-full flex flex-col">
                                                            <h1 class="font-montserrat text-green-700">Action Taken<span class="text-red-500">*</span></h1>
                                                            <textarea v-model="compliance_form.action_taken" cols="20" rows="5" class="p-2 mt-4 rounded-md outline-none border bg-gray-200 shadow-inner font-montserrat text-sm text-gray-500"  ></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="w-full flex flex-row mt-4 gap-4">
                                                        <div class="w-full flex flex-col border">
                                                            <h1 class="font-montserrat text-green-700">% COMPLIANCE<span class="text-red-500">*</span></h1>
                                                            <input v-model="compliance_form.percent_compliance" class="w-full bg-gray-200 rounded-md shadow-inner hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-1" placeholder="%COMPLIANCE" type="number">
                                                        </div>
                                                        
                                                    </div>
                                                <div class="flex flex-row justify-end mt-4">
                                                    <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Submit</button>
                                                    <button  @click.prevent="" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Clear All</button>
                                                </div>
                                            </form>
                                            </div>
                                            
                                            <div class="">
                                                <form @submit="uploadFile">
                                                    
                                                    <div class="modal-content flex flex-col px-4">
                                                        <h1 class="px-2 pt-6 font-montserrat text- text-gray-800 ">UPLOAD FILES</h1>
                                                        <div class="border border-lime-600"></div>
                                                        <div class="mt-2">
                                                            <!--<input type="text" :value="getFilesName()" readonly placeholder="Choose Files">-->
                                                            <input class="hidden" type="file" @change="handleFileChange" ref="uploadFile" multiple>
                                                            <div class="flex-row flex items-center gap-4">
                                                                <h1 class="w-[5%] font-montserrat text text-green-700">Area <span class="text-red-500">*</span></h1>
                                                                <select v-model="ppp_psv_area_id" @change="handlePppPsvArea(ppp_psv_area_id)" class="w-[40%] shadow-inner bg-gray-200 border-b-4 border-gray-300 rounded h-10  hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
                                                                    <option v-for="psv_area in psv_areas" :key="psv_area.id" :value="psv_area.id">{{ psv_area.area_name+'-'+psv_area.area_description }}</option>
                                                                </select>
                                                                <button @click.prevent="openDialog" class="border-2 shadow-r hover:border-green-600 w-[50%] h-10 p-2 rounded-md flex flex-row items-center gap-4 ">
                                                                    <lord-icon
                                                                        src="https://cdn.lordicon.com/smwmetfi.json"
                                                                        trigger="loop"
                                                                        delay="1400"
                                                                        state="in-upload"
                                                                        colors="primary:#109121"
                                                                        style="width:40px;height:40px;">
                                                                    </lord-icon>
                                                                    <h1 class="font-montserrat text-gray-600 opacity-80 ">CHOOSE FILES</h1>
                                                                </button>

                                                            </div>
                                                            <div class="mt-2 flex flex-col">
                                                                <h1 class="w-[10%] font-montserrat text text-green-700">Description <span class="text-red-500">*</span></h1>

                                                                <input v-model="description" class="w-full bg-gray-200 border-b-4 rounded-md shadow-inner  hover:border-b-lime-500 border border-gray-300   focus:outline-none text-base px-4 py-[5px]" placeholder="Description" type="text">
                                                            </div>
                                                             
                                                            

                                                        </div>
                                                        <h1 class="font-montserrat p-2 mt-2 text-gray-600 opacity-70">pdf, docx, txt, png, jpg (MAX: 10mb)</h1>
                                                        <h1 class="font-montserrat p-2 text-gray-600 opacity-70">SELECTED:</h1>
                                                        <div  class="rounded-md border overflow-y-auto flex flex-col shadow-inner h-[150px]">
                                                            <div class="border " v-for="file in selectedFiles">
                                                                <h1 class="px-2 py-1 font-montserrat text-gray-600 opacity-80">{{ file.name }}</h1>
                                                            </div>
                                                        </div>
                                                        
                                                        <!--<div @click="openDialog" class="border h-10">
                                                            
                                                        </div>-->
                                                    </div>
                                                    
                                                    <div class="px-4 flex w-full justify-end mt-3">
                                                        
                                                        <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Upload</button>

                                                    </div>
                                                </form>
                                            </div>
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
                survey_indicator:'',
                parameter_id: null,
            },
            compliance_form:{
                psv_area_id: '',
                compliance_order:null,
                aaccup_recommendations: '',
                action_taken: '',
                percent_compliance: null,

            },
            ppp_psv_area_id: null,

            files: [],
            survey_types: [],
            psv_parameters: [],
            survey_indicator_types: [],
            selectedFiles: [],
            uploadedFiles: [],
            psv_areas: [],
            psv_parameters:[],
            indicatorTypes:[],

            selected_survey_area: '',
            indicator:'',
            aaccup:'',
            selected_parameter: null,
            selected_indicator_type: null,

            isPsv:false,
            isPhase1: false,
            isDefault: true,
            compliance_report_id:null,
            survey_instrument_id: null,
            description:'',

        
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

        handleSurveyArea(area_name){
            this.selected_survey_area = area_name;
            console.log(this.selected_survey_area);
        },
        handlePppPsvArea(area){
            this.ppp_psv_area_id = area;
            console.log(this.ppp_psv_area_id);
        },

        handleSurveyParameter(parameter){
           // this.selected_parameter = parameter.parameter_letter + ' : ' + parameter.parameter_description;
            this.selected_parameter = parameter;
            console.log(this.selected_parameter);
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


        async submitSurveyInstrument(){
            try{
                
                this.survey_form.survey_name =  this.selected_survey_area + ' - ' + this.selected_parameter
                const response = await axios.post('/submit-survey-instrument', this.survey_form);
                this.survey_instrument_id = response.data.survey_instrument.id;
                Swal.fire(response.data.message);

            }catch(error){
                console.log(error);
            }
        },

        async submitComplianceReport(){
            try{
                
                const response = await axios.post('/submit-compliance-report', this.compliance_form);
                this.compliance_report_id = response.data.compliance_report.id;
                if(response.status !== 400){
                    Swal.fire(response.data.message);
                }else{
                    Swal.fire(response.data.error);
                }
            }catch(error){
                console.log(error);
            }
        },



        handleFileChange(event) {
            this.selectedFiles = Array.from(event.target.files);
        },
        openDialog() {
            const elem = this.$refs.uploadFile;
            elem.click();
        },
        async uploadFile() {
            const formData = new FormData();
            this.selectedFiles.forEach((file) => {
                formData.append('files[]', file);
            });
            formData.append('psv_area_id', this.ppp_psv_area_id);
            formData.append('survey_instrument_id', this.survey_instrument_id);
            formData.append('compliance_report_id', this.compliance_report_id);
            formData.append('description', this.description);

            try {
                const response = await axios.post(`/api/uploadFiles/${this.$route.params.id}`, formData);
                this.uploadedFiles = response.data.files;
            }
            catch (error) {
                Swal.fire(response.data.error);
            }

        },


        getFilesName(){
            let filesName = []

            if(this.selectedFiles.length > 0){
                for(let file of this.selectedFiles){
                    filesName.push(file.name)
                }
            }
            return filesName.join("")
        },

    },
    props: ["upload_modalActive"],
    setup(props, { emit }) {
        const close = () => {
            emit('close');
            this.selectedSurveyType = null;

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
