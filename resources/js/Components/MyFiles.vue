<template>
   
    <slot name="my_files">
        
       <div class=" h-full w-full rounded-md p-1 ">
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
                                <th class=" w-[300px]"><div class="border-t-2 my-1 w-full pl-[73px]" style="text-align: start;">Name</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Type</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Size</div></th>
                                <th class="w-32"><div class="border-t-2 my-1  w-full">Last Modified</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Action</div></th>
                            </tr>
                            
                        </thead>
                        
                        <tbody >
                           
                              <tr :key="folder.id" v-for="folder in this.folders" class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer  transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                
                                
                             <router-link :key="folder.id" :to="{name: 'FileList', params: {id:folder.id, folder:folder}}">
                                <td class=" flex items-end ml-4  ">
                                    
                                    <lord-icon
                                        src="https://cdn.lordicon.com/fkaukecx.json"
                                        trigger="hover"
                                        class="w-8"
                                        colors="primary:#e88c30"
                                        style=""
                                        >
                                        
                                    </lord-icon>
                                    
                                    <h1 class=" ml-10  w-[380px] truncate mt-1 font-montserrat">{{ folder.name }}</h1>

                                </td>
                            </router-link>
                                <td class="text-center font-montserrat">DIR</td>
                                <td class="text-center font-montserrat">10mb</td>
                                <td class="text-center font-montserrat">11/1/23</td>
                                <td class="w-16 text-center"> 
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
                                                @click="showDelete(folder)"
                                                :class="[
                                                active ? 'bg-red-200 text-gray-700' : 'text-gray-600',
                                                'group flex w-full items-center rounded-md px-2 py-1 text-sm  border ',
                                                ]"
                                            >
                                                <!-- Adjust the content based on your institution model structure -->
                                                Move to Archive
                                            </button>
                                            </MenuItem>
                                            
                                            <MenuItem v-slot="{ active }">
                                            <button
                                                @click="showDetails(folder)"
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
                                                @click="showRename(folder)"
                                                :class="[
                                                active ? 'bg-blue-200 text-gray-700 ' : 'text-gray-600 ',
                                                'group flex w-full items-center rounded-md px-2 py-1 text-sm  border',
                                                ]"
                                            >
                                                <!-- Adjust the content based on your institution model structure -->
                                                Rename
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
                    <div v-if="isDelete">
                            <FolderActionsModal
                                :showModal = isModalOpen
                                :isDelete = isDelete
                                :folder = selectedFolder
                                @close-modal = closeModal
                            >

                            </FolderActionsModal>
                            </div>
                        <div v-if="isDetails">
                            <FolderActionsModal
                                :detailsShowModal = isModalOpen
                                :isDetails = isDetails
                                :folder = selectedFolder
                                @close-modal = closeModal
                            >
                            </FolderActionsModal>
                        </div>
                        <div v-if="isRename">
                            <FolderActionsModal
                                :renameShowModal = isModalOpen
                                :isRename = isRename
                                :folder = selectedFolder
                                @close-modal = closeModal
                                @rename-folder = renameFolder
                            >
                            </FolderActionsModal>
                        </div>
                </div>
            </div>
       </div>


        
    </slot>
</template>
<script>

import axios from 'axios';
import { faStar as regularStar, faTrashCan } from '@fortawesome/free-regular-svg-icons';
import { faStar as solidStar, faDownload, faEllipsisVertical,faChevronRight, faFolder, faEllipsis} from '@fortawesome/free-solid-svg-icons' ;
import AuthenticatedLayout from '../Layouts/AuthenticatedLayout.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';
import FolderActionsModal from './FolderActionsModal.vue';
import FileList from './FileList.vue';

export default {
    name: 'MyFiles',
    components:{
        FileList,Menu, MenuButton, MenuItems, MenuItem, FolderActionsModal

    },
    data(){
        return {selectedName: "",
            isFileList: false,
            isMyFiles:false,
            isDefaultView: true,
            
            folders:[],
            files:[],
            isFolderOpen:false,
            user_office: '',

            isDelete: false,
            isDetails: false,
            isRename: false,
            selectedFolder: null,
            isModalOpen: false,
        }
    },
    methods:{

        async renameFile(folder){
                const response = await axios.put(`/rename-file/${folder.id}`,{
                name: folder.name,
            });
            this.closeModal();
        },

        async fetchFolders() {
        try {
            const response = await axios.get('/api/get-folders');
            this.folders = response.data.folders;
        } catch (error) {
            console.error('Error fetching folders:', error);
        }
      },

      async getCurrentUserOffice(){
        const response = await axios.get('/api/get-user-office');
            this.user_office = response.data.office;
      },


      
      showDelete(folder){
      this.isDelete = true;
      this.isDetails=false;
      this.isRename = false;

      this.openModal(folder);
      console.log(folder)
    },

    showDetails(folder){
      this.isDetails = true;
      this.isDelete = false;
      this.isRename = false;

      this.openModal(folder)
      console.log(folder)
    },

    showRename(folder){
        this.isRename = true;
        this.isDetails = false;
        this.isDelete = false;

        this.openModal(folder);
        console.log(folder);
    },



    openModal(folder){
      this.isModalOpen = true;
      this.selectedFolder = folder;
    },

    closeModal(){
      this.isModalOpen = false;
      this.fetchFolders();
      
    },
     
    },
    created(){
        this.fetchFolders
    },
    mounted(){
        this.fetchFolders();
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