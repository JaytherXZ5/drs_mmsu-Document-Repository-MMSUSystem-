<template>
    <div :class="{'hidden': !upload_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-20': upload_modalActive}">
        <div class="bg-white w-[50%] h-[75%] rounded-lg z-50">
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
                            <form @submit="uploadFile">
                            <div class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-montserrat text- text-gray-800 ">UPLOAD FILES</h1>
                                <div class="mt-2">
                                    <!--<input type="text" :value="getFilesName()" readonly placeholder="Choose Files">-->
                                    <input class="hidden" type="file" @change="handleFileChange" ref="uploadFile" multiple>
                                    <button @click.prevent="openDialog" class="border-2 shadow-r hover:border-green-600 w-[50%] h-10 p-2 rounded-md flex flex-row items-center gap-4 ">
                                        <font-awesome-icon :icon="faPaperClip" class=" w-8 border-2  border-yellow-600 rounded-full py-1 my-1 h-full text-green-800 hover:rotate-90 transition-transform duration-300"/>
                                        <h1 class="font-montserrat text-gray-600 opacity-80 ">CHOOSE FILES</h1>
                                    </button>

                                </div>
                                <h1 class="font-montserrat p-2 mt-2 text-gray-600 opacity-70">pdf, docx, txt, png, jpg</h1>
                                <h1 class="font-montserrat p-2 text-gray-600 opacity-70">SELECTED:</h1>
                                <div  class="rounded-md border overflow-y-auto flex flex-col h-[150px]">
                                    <div class="border " v-for="file in selectedFiles">
                                        <h1 class="px-2 py-1 font-montserrat text-gray-600 opacity-80">{{ file.name }}</h1>
                                    </div>
                                </div>
                                
                                <!--<div @click="openDialog" class="border h-10">
                                    
                                </div>-->
                            </div>
                            
                            <div class="px-4 flex w-full justify-end mt-3">
                                
                                <button  type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Upload</button>
                                <button  @click.prevent="close" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>

                            </div>
                            </form>
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
            files: [],
            selectedFiles: [],
            uploadedFiles: [],
        };
    },
    methods: {
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
            try {
                const response = await axios.post(`/api/uploadFiles/${this.$route.params.id}`, formData);
                this.uploadedFiles = response.data.files;
            }
            catch (error) {
                Swal.fire(error?.response?.data?.message);
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
        }
    },
    props: ["upload_modalActive"],
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
        
    }
    


}
</script>
