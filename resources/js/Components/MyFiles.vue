<template>
   
    <slot name="my_files">
        
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
                                <td class="w-16"> </td>
                            
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

export default {
    name: 'MyFiles',
    components:{
        FileList
    },
    data(){
        return {selectedName: "",
            isFileList: false,
            isMyFiles:false,
            isDefaultView: true,
            
            folders:[],
            files:[],
            isFolderOpen:false,
            user_office: ''
        }
    },
    methods:{
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
            
      }
     
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
    }
}
</script>
<style >
    
</style>