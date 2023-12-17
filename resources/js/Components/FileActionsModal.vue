<template>
    <div :class="{'hidden': !showModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': showModal }">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="showModal" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="showModal" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div v-if="showModal" class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-montserrat text-xl text-violet-800 ">Move to Archive?</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-md text-green-800 border-b"><span class="text-gray-600 text-xl font-bold">  </span> {{ this.file.name}}</h1>
                            </div>
                            <div v-if="showModal" class="px-4 flex w-full justify-end mt-3">
                                <button @click="deleteUser(this.file.id)" type="button" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Archive</button>
                                <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                            </div>
                            
                        </div>
                    </transition>
                </div>
            </transition>
        </div>
    </div>

    <div :class="{'hidden': !detailsShowModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': detailsShowModal }">
        <div class="bg-white w-[50%] h-[65%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="detailsShowModal" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="detailsShowModal" class="modal-inner ">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div v-if="detailsShowModal" class="modal-content flex flex-col px-4 overflow-y-auto h-[200px]">
                                <h1 class="px-2 pt-6 font-montserrat text-xl text-violet-800 ">Details</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b"><span class="text-gray-600 font-bold">Title:</span> {{ this.file.name}}</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">type:</span> {{ this.file.type}}</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">size:</span> {{ this.formatFileSize(this.file.size)}} KB</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Description:</span> {{ this.file.description}}</h1>

                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span> {{ this.file.timestamp}}</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span> {{ this.file.timestamp}}</h1>

                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span> {{ this.file.timestamp}}</h1>

                                

                            </div>
                            <div v-if="detailsShowModal" class="px-4 flex w-full justify-end mt-3">
                                
                                <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>
                            </div>
                            
                        </div>
                    </transition>
                </div>
            </transition>
        </div>
    </div>
   
    <div :class="{'hidden': !renameShowModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': renameShowModal }">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="renameShowModal" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="renameShowModal" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <form @submit.prevent="renameFile">
                                <div class="modal-content flex flex-col pt-2 px-10">
                                    <h1 class="px-2 pt-6 font-montserrat text- text-green-800 ">Edit File Name</h1>
                                    
                                        <input v-model="renamedFile" type="text" placeholder="File Name" class="pl-4 mt-4 bg-gray-100  h-10 rounded-xl border shadow-inset outline-none" required>
                                    
                                </div>
                                
                                <div class="px-10 flex w-full justify-end mt-3 ">
                                    <button type="submit" class="border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Rename</button>
                                    <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                    
                                </div>
                            </form>
                            
                        </div>
                    </transition>
                </div>
            </transition>
        </div>
    </div>

    <div :class="{'hidden': !downloadShowModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': downloadShowModal }">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="downloadShowModal" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="downloadShowModal" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-montserrat text-xl text-violet-800 ">Download</h1>
                                <div class="border"></div>
                                <h1 class="px-2 pt-1 font-montserrat text-md text-green-800 mt-4"><span class="text-gray-600 text-xl font-bold">  </span> {{this.file.name}}</h1>
                            </div>
                            <div class="px-4 flex w-full justify-end mt-3">
                                <button @click="$event =>download(file.id, file.name)" type="button" class="border-2 px-2  w-28 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Download</button>
                                <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Close</button>
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
import { format } from 'date-fns';

export default{
    props:{
        file: Object,
        showModal: Boolean,
        detailsShowModal:Boolean,
        renameShowModal:Boolean,
        downloadShowModal: Boolean,

        isDelete: Boolean,
        isDetails: Boolean,
        isRename: Boolean,
        isDownload: Boolean

    },
    data(){
        return{
           userFile: null,
           renamedFile: '',
        }
    },
    watch:{
        renameShowModal(value){
            if(value){
                this.renamedFile = this.file.name;
            }
        }
    },

    
    methods:{
        renameFile(){
            this.$emit('rename-file', {
                id: this.file.id,
                name: this.renamedFile,

            })
        },

        download(id, name){
            axios.get(`/api/file/download/${id}`, {responseType: 'blob'})
            .then(response =>{
                const url = window.URL.createObjectURL(new Blob([response.data]));
                const link = document.createElement('a');
                link.href = url;
                link.setAttribute('download', name);
                document.body.appendChild(link);
                link.click();
            }).catch(error=>{
                console.log(error)
            })
        },

        async deleteUser(fileId){
            const response = await axios.delete(`/api/delete-file/${fileId}`);
            this.closeModal();
            
        },

        async getfileUser(fileUserId){
            await axios.get(`api/getFileUser/${fileUserId}`).then((data)=>{
                console.log(data.user);
            })
        },

        formatTimestamp(timestamp) {
            return format(new Date(timestamp), 'MM/dd/yyyy');
        },
        formatFileSize(size) {
      
            if (typeof size === 'number') {
                const sizeString = size.toString();
                if(sizeString.length === 2){
                    const fullSize = size * 100;
                    return (fullSize / 1000).toFixed(2);
                }
            return (size / 1000).toFixed(2);
            } else {
                return 'N/A'; // or handle this case appropriately
            }
    },
        
     closeModal(){
        this.$emit('close-modal');
       
       },
    

        
    },
    

    components:{
        
        
    },
    computed:{
        faCircleXmark(){return faCircleXmark;},
    },
    mounted(){
       
    }
}
</script>
<style>

</style>
