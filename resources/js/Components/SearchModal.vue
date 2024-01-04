<template>
    <div :class="{'hidden': !upload_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 overflow-auto z-50 bg-opacity-30 flex justify-center items-start p-5': upload_modalActive}">
        <div   :class="{
                        'bg-white w-[65%] h-[35%] rounded-lg z-50': isDefault ,
                        'bg-white w-[65%] h-[82%] rounded-lg z-50 ': !isDefault,
                        }">
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
            
                                <div class=" h-[80%] p-6">
                                    <div 
                                    :class="{
                                            'h-[140px] p-5  border  first-letter': isDefault ,
                                            'h-[525px] p-5 overflow-y-auto border-2 shadow-inner shadow-r rounded-xl first-letter ': !isDefault,
                                            }" >
                                        
                                        <div class=" flex flex-col items-start">
                                            <h1 class="font-montserrat text-lg animate-pulse text-gray-600">UPLOAD FILES</h1>
                                            <h1 class="font-montserrat text-green-700 mt-2">UPLOAD AREA TYPE: </h1>
                                            <div class="flex w-[100%] items-center">
                                                <select v-model="selectedSurveyType" @change="handleSurveyType(selectedSurveyType)" class="w-full bg-gray-50 border-b-4 shadow-inner border-gray-300 h-10 rounded hover:border-b-lime-500 hover:border-lime-500  focus:outline-none">
                                                    <option v-for="survey_type in survey_types" :key="survey_type.id" :value="survey_type">{{ survey_type.type}}</option>
                                                </select>    
                                            </div>
                                        </div>
                                        
                                        <div v-if="isDefault" class="">
                                            
                                        </div>

                                        <div v-if="isPsv" class="">

                                            <div class="">
                                                <form @submit="uploadFile">
                                                    
                                                    <div class="modal-content flex flex-col px-4">
                                                        <h1 class="px-2 pt-6 font-montserrat text- text-gray-800 ">UPLOAD FILES</h1>
                                                        <div class="border border-lime-600"></div>
                                                        <div class="mt-2">
                                                            <!--<input type="text" :value="getFilesName()" readonly placeholder="Choose Files">-->
                                                            <input class="hidden" type="file" @change="handleFileChange" ref="uploadFile" multiple>
                                                            <div class="flex-row flex items-center gap-4">
                                                                <h1 class=" font-montserrat text text-green-700">Area <span class="text-red-500">*</span></h1>
                                                                <select v-model="ppp_psv_area_id" @change="handlePppPsvArea(ppp_psv_area_id)" class="w-[40%] py-[5px] shadow-inner bg-gray-50 border-b-4 border-gray-300 rounded h-10  hover:border-b-lime-500 hover:border-lime-500  focus:outline-none" name="" id="">
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
                                                                <h1 class=" font-montserrat text text-green-700">Description <span class="text-red-500">*</span></h1>

                                                                <input v-model="description" class="w-full bg-gray-50 border-b-4 rounded-md shadow-inner  hover:border-b-lime-500 border border-gray-300   focus:outline-none text-base px-4 py-[5px]" placeholder="Description" type="text">
                                                            </div>
                                                             
                                                            

                                                        </div>
                                                        <h1 class="font-montserrat p-2 mt-2 text-gray-600 opacity-70">pdf, docx, txt, png, jpg (MAX: 10mb)</h1>
                                                        
                                                        <div class="px-4 flex flex-row w-full justify-between">
                                                            <h1 class="font-montserrat text-gray-600 opacity-70 flex items-center">SELECTED:</h1>
                                                            <div class="flex flex-row gap-3 py-2">
                                                                <button  type="submit" class="shadow-xl flex text-white bg-green-800  border-2 py-1 px-4 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Upload</button>
                                                                <button  @click.prevent="clear" class="shadow-xl flex text-white bg-green-800  border-2 py-1 px-4 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Clear</button>
                                                                <button  @click.prevent="close" class="shadow-xl flex text-white bg-green-800  border-2 py-1 px-4 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Close</button>

                                                            </div>

                                                        </div>
                                                        <div  class="rounded-md border overflow-y-auto flex flex-col shadow-inner h-[150px]">
                                                            <div class="border " v-for="file in selectedFiles">
                                                                <h1 class="px-2 py-1 font-montserrat text-gray-600 opacity-80">{{ file.name }}</h1>
                                                            </div>
                                                        </div>
                                                        
                                                        <!--<div @click="openDialog" class="border h-10">
                                                            
                                                        </div>-->
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

            ppp_psv_area_id: null,

            files: [],
            survey_types: [],


            selectedFiles: [],
            uploadedFiles: [],
            psv_areas: [],


            selected_survey_area: '',



            isPsv:false,
            isPhase1: false,
            isDefault: true,
           // compliance_report_id:0,
            //survey_instrument_id: 0,
            description:'',

        
        };
    },
    methods: {



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





        handleSurveyType(surveyType){
            if(surveyType.type === "---"|| surveyType.type === null){
                this.isDefault = true;
                this.isPhase1 = false;
                this.isPsv = false;
            }else if(surveyType.type==='Psv'){
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




        clear(){
            this.selectedFiles = null;
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
            //formData.append('survey_instrument_id', this.survey_instrument_id);
            //formData.append('compliance_report_id', this.compliance_report_id);
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
