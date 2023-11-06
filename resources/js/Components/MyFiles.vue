<template>
    <!--<div class="border">
        <div class="flex flex-col" v-for="folder in folders" :key="folder.name">
        <slot :name="folder.name">{{ folder.name }}</slot>
    </div>
    </div>-->
    <slot name="my_files">
       
        <div class="custom-shadow border-t-2 border-t-green-500 border-l-2 border-r-green-700 border-r-8 border-l-green-500 border-gray-300 flex flex-col w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-lg">
            <div class="flex flex-row bg-white w-full h-8 rounded-t-lg">
            
                <img class="h-full" src="../../images/back.png" alt="" srcset="">
                <label class="ml-5 h-full w-[20%] text-center rounded-md font-serif text-xl border-2 mt-1 bg-gray-300" type="text">MY DRS</label>
            </div>

            <div class="  relative bg-white h-8 w-28  flex flex-row py-1 mt-1 gap-5 pl-5 shadow-xl">
            
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 bg-gray-300 shadow-left-side rounded h-6"
                >
                <option class="" value="">Type</option>
                
            </select>
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 bg-gray-300 rounded h-6 shadow-left-side"
                >
                <option value="">People</option>
                <option v-for="name in names" :key="name.id" :value="name.name">{{ name.name }}</option>
            </select>
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 bg-gray-300 rounded h-6 shadow-left-side"
                >
                <option value="">Modified</option>
                
            </select>
            </div>
            
            <div class="w-full h-full  flex flex-col items-start">
                <div class="w-full px-2 h-[calc(45%)] bg-white overflow-y-auto">
                    
                    <table class=" w-full">
                        <thead class=" sticky top-0 z-10 bg-white rounded-md font-mono ">
                            
                            
                            <tr class=" text-gray-700  border-gray-400  shadow-left-side rounded-sm">
                                <th class=" w-16 "><div class="border-t-2 my-1 border-r-2 border-gray-700">&nbsp</div></th>
                                <th class=" w-[300px]"><div class="border-t-2 my-1 border-r-2 w-full border-gray-700">Name</div></th>
                                <th class="w-16"><div class="border-t-2 my-1 border-r-2 w-full border-gray-700">Type</div></th>
                                <th class="w-16"><div class="border-t-2 my-1 border-r-2 w-full border-gray-700">Size</div></th>
                                <th class="w-32"><div class="border-t-2 my-1 border-r-2 w-full border-gray-700">Last Modified</div></th>
                                <th class="w-16"><div class="border-t-2 my-1 border-r-2 w-full border-gray-700">Action</div></th>
                            </tr>
                            
                        </thead>
                        
                        <tbody class="">
                            <tr class="text-gray-700 border-gray-300 border-b-2 hover:translate-x-1 cursor-pointer hover:border-b-green-700 transition-transform rounded-md hover:bg-gray-200 duration-300 hover:text-green-700" v-for="folder in this.folders">
                                <td class="w-16 text-end">
                                    <font-awesome-icon :icon="faRegularStar" class="pr-3 cursor-pointer text-yellow-500 "/>
                                   
                                </td>
                                <td class=" bg-white flex items-center hover:bg-gray-200 "> 
                                    <img src="../../images/folder.png" alt="" srcset="" class="h-5 w-6 ">
                                    <h1 class=" ml-10  w-[380px] truncate mt-1 font-mono">{{ folder.name }}</h1>

                                </td>
                                <td class="text-center font-mono">DIR</td>
                                <td class="text-center font-mono">10mb</td>
                                <td class="text-center font-mono">11/1/23</td>
                                <td class="w-16"></td>
                            </tr>
                            
                        </tbody>
                        
                    </table>
                </div>
                <div class="w-full h-[260px] bg-white rounded-b-xl border flex flex-col">
                    <h1 class=" mx-4 border-b-2 border-violet-700 font-poppins">Recent Uploads</h1>
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
        return {
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