<template>
    <slot name="file_list">
        <div class=" border h-full w-full rounded-md p-1 ">
            <h1 class=" border h-12 pl-4 flex items-center font-bold" >/{{ this.folder_name }}</h1>
            <div class="h-10 w-full">
                <select class=" w-[calc(20%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option>TYPE</option>
                </select>
            </div>
            
            
            <div class="w-full h-full  flex flex-col items-start mt-1 ">
                <div class="border shadow-b w-full px-2 h-[calc(100%-50px)] bg-gray-100 overflow-y-auto scrollbar-container rounded-md">
                    <table class=" w-full">
                        <thead class=" z-10 rounded-md font-mono sticky top-0 shadow-b bg-gray-100">
                            
                            
                            <tr class=" text-gray-700  border-gray-200 rounded-sm font-montserrat ">
                                <th class=" w-16"><div class=" border-t-2 my-1 ">&nbsp</div></th>
                                <th class=" w-[300px]"><div class="border-t-2 my-1 w-full pl-[73px]" style="text-align: start;">Name</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Type</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Size</div></th>
                                <th class="w-32"><div class="border-t-2 my-1  w-full">Last Modified</div></th>
                                <th class="w-16"><div class="border-t-2 my-1  w-full">Action</div></th>
                            </tr>
                            
                        </thead>
                        
                        <tbody >
                           
                              <tr :key="file.id" v-for="file in this.files" class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer border-l-4 hover:border-l-4 hover:border-l-lime-700 transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" >
                                
                                
                                <td class="w-16 text-end">
                                    <font-awesome-icon :icon="faRegularStar" class="pr-3 cursor-pointer text-yellow-500 "/>
                                    
                                </td>
                             
                                <td class=" flex items-end  ">
                                    
                                    <img :src="`../../images/${file.type}.png`" class="w-10 h-10" alt="" srcset="">

                                    <h1 class=" ml-10  w-[380px] truncate mt-1 font-montserrat">{{ file.name }}</h1>

                                </td>
                            
                                <td class="text-center font-montserrat">{{ file.type }}</td>
                                <td class="text-center font-montserrat">{{ file.size }} mb</td>
                                <td class="text-center font-montserrat">{{ formatTimestamp(file.updated_at) }}</td>
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
import { format } from 'date-fns';
import axios from 'axios';

export default {
   
    data(){
        return{
              folder_name:null,
              folder_id:null,
              files:[],
              error:[],
              file_mod_date:null,
              
        }
    },
    created: function(){
        this.fetchFiles();
    },
    methods:{
        
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

    },
    mounted(){

        const folderId = this.$route.params.id;
        this.fetchFolder(folderId);
        this.fetchFiles(folderId);
        
    }
}
</script>
<style lang="">
    
</style>