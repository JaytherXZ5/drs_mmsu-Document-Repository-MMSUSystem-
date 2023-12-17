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
                                <h1 class="px-2 pt-1 font-montserrat text-md text-green-800 border-b"><span class="text-gray-600 text-xl font-bold">  </span> {{ this.folder.name}}</h1>
                            </div>
                            <div v-if="showModal" class="px-4 flex w-full justify-end mt-3">
                                <button @click="deleteUser(this.folder.id)" type="button" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Archive</button>
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
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b"><span class="text-gray-600 font-bold">Title:</span></h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">type:</span></h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">size:</span>  KB</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Description:</span></h1>

                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span> </h1>
                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span></h1>

                                <h1 class="px-2 pt-1 font-montserrat text-sm text-green-800 border-b "><span class="text-gray-600 font-bold">Date:</span></h1>

                                

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
                            <form @submit.prevent="renameFolder">
                                <div class="modal-content flex flex-col pt-2 px-10">
                                    <h1 class="px-2 pt-6 font-montserrat text- text-green-800 ">Edit Folder Name</h1>
                                    
                                    <input v-model="renamedFolder" type="text" placeholder="Folder Name" class="pl-4 mt-4 bg-gray-100  h-10 rounded-xl border shadow-inset outline-none" required>
                                    
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


    
</template>
<script>

import {faCircleXmark} from '@fortawesome/free-regular-svg-icons'
import axios from 'axios';
import Swal from 'sweetalert2';
import { format } from 'date-fns';

export default{
    props:{
        folder: Object,
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
           userFolder: null,
           renamedFolder: '',
        }
    },
    watch:{
        renameShowModal(value){
            if(value){
                this.renamedFolder = this.folder.name;
            }
        }
    },

    
    methods:{
        renameFolder(){
            this.$emit('rename-folder', {
                id: this.folder.id,
                name: this.renamedFolder,

            })
        },



        async deleteUser(folderId){
            const response = await axios.delete(`/delete-folder/${folderId}`);
            this.closeModal();
        },

        async getFolderUser(folderUserId){
            await axios.get(`api/getFolderUser/${folderUserId}`).then((data)=>{
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
