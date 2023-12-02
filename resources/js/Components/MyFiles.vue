<template>
   
    <slot name="my_files">
        
       <div class=" border h-full w-full rounded-md p-1 ">
            <h1 class=" font-montserrat text-2xl pl-4">MY DRS</h1>
           
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
                                <td class="w-16"></td>
                            
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
import { faStar as solidStar, faDownload, faEllipsisVertical,faChevronRight} from '@fortawesome/free-solid-svg-icons' ;
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

     
    },
    created(){
        this.fetchFolders
    },
    mounted(){
        this.fetchFolders();
    },
    computed:{
        faRegularStar(){return regularStar;},
        faSolidStar(){return solidStar;},
        faChevronRight(){return faChevronRight;},
    }
}
</script>
<style >
    
</style>