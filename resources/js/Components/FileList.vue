<template>
    <slot name="file_list">
        <div class=" border h-[calc(100%-40px)] w-full rounded-md p-1 ">
            <div class="transition-transform duration-500 flex flex-row items-center justify-start">
                <button @click="this.$router.go(-1);" class=" mr-4 transition-transform duration-500 px-2 hover:scale-110"><img src="../../images/back.png" class="h-10" alt="BACK" srcset=""></button>
                
                <font-awesome-icon :icon="faFolder" class="ml-2 mr-2 text-3xl text-green-800 transition-transform duration-300"/>
                <button @click="this.$router.go(-1);"  class="mr-2 transition-transform duration-500 hover:translate-x-2 flex flex-row items-center">
                    <font-awesome-icon :icon="faChevronRight" class="text-xl text-gray-700 "/>
                    <h1 class=" py-1  font-montserrat text-xl hover:text-green-700  ml-1"> {{ this.user_office }}</h1>
                </button>
                <button class="transition-transform duration-500 hover:translate-x-2 flex flex-row items-center">
                    <font-awesome-icon :icon="faChevronRight" class="text-xl text-gray-700 "/>
                    <h1 class="py-1 font-montserrat text-xl hover:text-green-700 ml-1">{{ this.folder_name }}</h1>
                </button>
            </div>
            <div class="h-10 w-full">
                <select class=" w-[calc(20%-20px)] bg-gray-100 ml-2 rounded-lg h-10 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option>TYPE</option>
                </select>
            </div>
            
            
            <div class="w-full h-full   flex flex-col items-start mt-1 ">
                <div class=" shadow-b w-full px-2 h-[calc(100%-50px)] bg-gray-100 overflow-y-auto scrollbar-container rounded-md">
                    <table class=" w-full">
                        <thead class=" z-10 rounded-md font-mono sticky top-0 shadow-b bg-gray-100">
                            
                            
                            <tr class=" text-gray-700  border-gray-200 rounded-sm font-montserrat ">
                                <th class=" w-[300px]"><div class="border-t-2 my-1 w-full pl-[73px]" style="text-align: start;">Name</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Type</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Size</div></th>
                                <th class="w-32"><div class="border-t-2 my-1  w-full">Created</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Action</div></th>
                            </tr>
                            
                        </thead>
                        
                        <tbody >
                           
                              <tr :key="file.id" v-for="file in this.files" class="border-l-4 hover:border-l-yellow-600 h-9 hover:z-0 text-gray-700 border-gray-200 border-b-2 cursor-pointer transition-transform hover:bg-gray-200 duration-300 hover:text-green-700" >
                                
                                
                             
                                <td class=" flex  items-end  ">
                                    <img src="../../images/pdf.png" class="h-6 mt-2 ml-2" v-if="file.type == 'pdf'" alt="" srcset="">
                                    <img src="../../images/png.png" class="h-6 mt-2 ml-2" v-if="file.type == 'png'" alt="" srcset="">
                                    <img src="../../images/jpg.png" class="h-6 mt-2 ml-2" v-if="file.type == 'jpg'" alt="" srcset="">
                                    <img src="../../images/txt.png" class="h-6 mt-2 ml-2" v-if="file.type == 'txt'" alt="" srcset="">
                                    <img src="../../images/docx.png" class="h-6 mt-2 ml-2" v-if="file.type == 'docx'" alt="" srcset="">

                                    <h1 class=" ml-6  w-[380px] truncate font-montserrat">{{ file.name }}</h1>

                                </td>
                            
                                <td class="text-center font-montserrat">{{ file.type }}</td>
                                <td class="text-center font-montserrat ">{{ formatFileSize(file.size) }} KB</td>
                                <td class="text-center font-montserrat ">{{ formatTimestamp(file.timestamp) }}</td>
                                <td class="text-center font-montserrat">
                                    <Menu as="div" class="relative inline-block text-left w-[60%]">
                                    <div class="flex flex-row items-center justify-center">
                                        <MenuButton 
                                        type="button"
                                        class="outline-none items-center justify-center flex flex-row h-10 w-full rounded-md "
                                        >
                                        
                                        
                                            <font-awesome-icon :icon="faEllipsis" class=" w-full p-2 text-lg text-green-700 hover:rotate-90 transition-transform duration-300 hover:scale-110"/>
                                        
                            
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
                                                @click.prevent="showDelete(file)"
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
                                                @click="showDetails(file)"
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
                                                @click="showRename(file)"
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
          <FileActionsModal
            :showModal = isModalOpen
            :isDelete = isDelete
            :file = selectedFile
            @close-modal = closeModal
          >

          </FileActionsModal>
        </div>
       <div v-if="isDetails">
        <FileActionsModal
            :detailsShowModal = isModalOpen
            :isDetails = isDetails
            :file = selectedFile
            @close-modal = closeModal
          >
          </FileActionsModal>
       </div>
       <div v-if="isRename">
        <FileActionsModal
            :renameShowModal = isModalOpen
            :isRename = isRename
            :file = selectedFile
            @close-modal = closeModal
            @rename-file = renameFile
          >
          </FileActionsModal>
       </div>
                </div>
               
            </div>
        </div>
    </slot>
</template>
<script>
import { format } from 'date-fns';
import axios from 'axios';
import { faFolder, faChevronRight, faEllipsis} from '@fortawesome/free-solid-svg-icons';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';
import FileActionsModal from './FileActionsModal.vue';
export default {
   
    data(){
        return{
              folder_name:null,
              folder_id:null,
              files:[],
              error:[],
              file_mod_date:null,
              file:null,
              user_office: '',

              isDelete: false,
              isDetails: false,
              isRename: false,

              isModalOpen: false,
              selectedFile: null,
              office_id:null,
              
        }
    },
    created: function(){
        this.fetchFiles();
    },
    components:{
        Menu, MenuButton, MenuItems, MenuItem,FileActionsModal
    },
    methods:{

        async renameFile(file){
                const response = await axios.put(`/rename-file/${file.id}`,{
                name: file.name,
            });
            this.closeModal();
        },
        
        formatTimestamp(timestamp) {
            return format(new Date(timestamp), 'MM/dd/yyyy');
        },
        async fetchFolder(folderId){
            axios.get(`/api/folder/${folderId}`)
                .then((res) => {
                    console.log(res.data.folder.id);  // Log the response data
                    this.folder_name = res.data.folder.name;
                    this.folder_id = res.data.folder.id;
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        },
        async fetchFiles(folderId) {
        try {
            const response = await axios.get(`/api/folder/${folderId}/files`);
            this.files = response.data.files;
            
        } catch (error) {
            console.error('Error fetching folders:', error);
        }
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
    async getCurrentUserOffice(){
        const response = await axios.get('/api/get-user-office');
            this.user_office = response.data.office;
            
      },
      showDelete(file){
      this.isDelete = true;
      this.isDetails=false;
      this.openModal(file);
      console.log(file)
    },

    showDetails(file){
      this.isDetails = true;
      this.isDelete = false;
      this.openModal(file)
      console.log(file)
    },

    showRename(file){
        this.isRename = true;
        this.isDetails = false;
        this.isDelete = false;
        this.openModal(file);
        console.log(file);
    },


    openModal(file){
      this.isModalOpen = true;
      this.selectedFile = file;

    },

    closeModal(){
      this.isModalOpen = false;
      this.selectedFile = null;
      this.fetchFiles(this.folder_id);
    },

    },
    computed:{
        faChevronRight(){return faChevronRight;},
        faFolder(){return faFolder;},
        faEllipsis(){return faEllipsis;},
    },
    mounted(){

        const folderId = this.$route.params.id;
        this.fetchFolder(folderId);
        this.fetchFiles(folderId);
        console.log(this.files)
        this.getCurrentUserOffice();
        
    }
}
</script>
<style lang="">
    
</style>