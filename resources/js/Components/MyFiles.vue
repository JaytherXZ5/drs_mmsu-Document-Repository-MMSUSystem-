<template>
   
    <slot name="my_files">
       <div class=" border h-full w-full rounded-md p-1 ">
            <h1 class=" border pl-4">MY DRS</h1>
            <h1 class="pl-4 border"> Types</h1>
            <div class="w-full h-full  flex flex-col items-start mt-1 ">
                <div class="border shadow-b w-full px-2 h-[calc(45%)] bg-gray-100 overflow-y-auto scrollbar-container rounded-md">
                    
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
                        
                        <tbody class="">
                            
                            <tr class="h-9 text-gray-700 border-gray-300 border-b-2 cursor-pointer border-l-4 hover:border-l-4 hover:border-l-lime-700 transition-transform rounded-md hover:bg-gray-200 duration-500 hover:text-green-700" v-for="folder in this.folders">
                                <td class="w-16 text-end">
                                    <font-awesome-icon :icon="faRegularStar" class="pr-3 cursor-pointer text-yellow-500 "/>
                                   
                                </td>
                                <td class=" flex items-end  ">
                                    
                                    <lord-icon
                                        src="https://cdn.lordicon.com/fkaukecx.json"
                                        trigger="hover"
                                        class="w-8 "
                                        colors="primary:#e88c30"
                                        style=""
                                        >
                                    </lord-icon>
                                    
                                    <h1 class=" ml-10  w-[380px] truncate mt-1 font-montserrat">{{ folder.name }}</h1>

                                </td>
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
import { faStar as solidStar, faDownload, faEllipsisVertical } from '@fortawesome/free-solid-svg-icons' ;
import AuthenticatedLayout from '../Layouts/AuthenticatedLayout.vue';
export default {
    name: 'MyFiles',
    components:{
        
    },
    data(){
        return {selectedName: "",
            names: [
                { id: 1, name: "Alice" },
                { id: 2, name: "Bob" },
                { id: 3, name: "Charlie" },
                { id: 4, name: "David" },
                { id: 5, name: "Eve" },
                // Add more names as needed
            ],
            folders:[],
            files:[]
        }
    },
    methods:{
        async getData(){
            try{
                const {data} = await axios.get('api/home/get-data');
                this.folders = data.folders;
                this.files = data.files;
                console.log(data);
                
            }catch(error){
                console.log(error);
            }
        }
    },
    created(){
        this.getData();
    },
    mounted(){
        this.getData();
    },
    computed:{
        faRegularStar(){return regularStar;},
        faSolidStar(){return solidStar;}
    }
}
</script>
<style >
    
</style>