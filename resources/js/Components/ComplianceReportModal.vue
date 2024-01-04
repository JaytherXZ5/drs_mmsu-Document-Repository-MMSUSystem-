<template>
    <div :class="{'hidden': !complianceReport_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 overflow-auto z-50 bg-opacity-30 flex justify-center items-start p-5': complianceReport_modalActive}">
        <div   :class="{
                        'bg-gray-100 w-[60%] h-[35%] rounded-lg z-50': isDefault ,
                        'bg-gray-100 w-[60%] h-[82%] rounded-lg z-50 ': !isDefault,
                        }">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="complianceReport_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="complianceReport_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
            
                                <div class=" h-[80%] p-6">
                                    <div 
                                    :class="{
                                            'h-[140px] p-5  border  first-letter': isDefault ,
                                            'h-[525px] p-5 overflow-y-auto border-2 shadow-inner shadow-r rounded-xl first-letter ': !isDefault,
                                            }" >
                                        
                                        <div class=" flex flex-col items-start">
                                            <h1 class="font-montserrat text-lg animate-pulse text-gray-600">COMPLIANCE REPORT</h1>
                                            <h1 class="font-montserrat text-green-700 mt-2">COMPLIANCE TYPE: </h1>
                                            <div class="flex w-[100%] items-center">
                                                <select v-model="selectedSurveyType" @change="handleSurveyType(selectedSurveyType)" class="w-full bg-gray-200 border-b-4 shadow-inner border-gray-300 h-8 hover:border-b-lime-500 hover:border-lime-500  focus:outline-none">
                                                    <option v-for="survey_type in survey_types" :key="survey_type.id" :value="survey_type">{{ survey_type.type}}</option>
                                                </select>    
                                            </div>
                                        </div>
                                        
                                        <div v-if="isDefault" class="">
                                            
                                        </div>

                                        <div v-if="isPsv" class="">

                                            <!--COMPLIANCE REPORT-->
                                            <div class="mt-2">
                                                <form @submit="submitComplianceReport">
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
                                                            <input v-model="compliance_form.compliance_order" @change="updateOrder()" class="w-full bg-gray-200 border-b-4 rounded-md shadow-inner  hover:border-b-lime-500 border border-gray-300   focus:outline-none text-base px-4 py-[1px]" placeholder="Order" type="number">
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
                                                    <button  @click.prevent="close" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                                </div>
                                            </form>
                                            </div>
                                            

                                        </div>
                                    </div>

                                    <div v-if="isDefault" class="w-full flex flex-row justify-end mt-4">
                                        <button  @click.prevent="close" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
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

            compliance_form:{
                psv_area_id: '',
                compliance_order:null,
                aaccup_recommendations: '',
                action_taken: '',
                percent_compliance: null,

            },

            survey_types: [],
            psv_areas: [],


            selected_survey_area: '',

            isPsv:false,
            isPhase1: false,
            isDefault: true,

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
    props: ["complianceReport_modalActive"],
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
