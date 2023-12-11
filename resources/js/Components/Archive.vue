<template>
   
    <slot name="archive">
        
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
                           
                              <tr :key="archive_file.id" v-for="archive_file in this.archive_files" class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer  transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                
                                
                                <td class=" flex items-end ml-4  ">

                                    <img src="../../images/pdf.png" class="h-6 mt-2 ml-2" v-if="archive_file.type == 'pdf'" alt="" srcset="">
                                    <img src="../../images/png.png" class="h-6 mt-2 ml-2" v-if="archive_file.type == 'png'" alt="" srcset="">
                                    <img src="../../images/jpg.png" class="h-6 mt-2 ml-2" v-if="archive_file.type == 'jpg'" alt="" srcset="">
                                    <img src="../../images/txt.png" class="h-6 mt-2 ml-2" v-if="archive_file.type == 'txt'" alt="" srcset="">
                                    <img src="../../images/docx.png" class="h-6 mt-2 ml-2" v-if="archive_file.type == 'docx'" alt="" srcset="">

                                    <h1 class=" ml-10  w-[380px] truncate mt-1 font-montserrat">{{ archive_file.name }}</h1>

                                </td>
                                <td class="text-center font-montserrat">{{archive_file.type}}</td>
                                <td class="text-center font-montserrat">{{ formatFileSize(archive_file.size) }}KB</td>
                                <td class="text-center font-montserrat">{{ formatTimestamp(archive_file.timestamp) }}</td>
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
import { format } from 'date-fns';

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
            archive_files:[],
            isFolderOpen:false,
            user_office: ''
        }
    },
    methods:{
      async getArchiveFiles(){
        const response = await axios.get('/api/archive-files');
        this.archive_files = response.data.archives;
      },

      async getCurrentUserOffice(){
        const response = await axios.get('/api/get-user-office');
            this.user_office = response.data.office;
            
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

    formatTimestamp(timestamp) {
        return format(new Date(timestamp), 'MM/dd/yyyy');
    },
     
    },
    created(){
        this.getArchiveFiles();
    },
    mounted(){
        this.getArchiveFiles();
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