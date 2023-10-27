<template>
    
    <div class= " shadow-2xl shadow-left-side border-2 flex flex-col w-[calc(100%-100px)] h-[calc(100%-15px)] rounded-lg ">
        <div class="flex flex-row bg-white w-full h-8 rounded-t-lg">
            
            <img class="h-full" src="../../images/back.png" alt="" srcset="">
            <input class="pl-5 h-full mt-1 focus:outline-none bg-slate-300 w-[80%] rounded-md" type="text">
        </div>
        <div class=" relative bg-white h-8 w-28  flex flex-row mt-2 gap-5 ml-5 shadow-xl">
           
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 border-green-800 shadow-left-side rounded h-8"
                >
                <option value="">Type</option>
                
            </select>
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 border-green-800 rounded h-8 shadow-left-side"
                >
                <option value="">People</option>
                <option v-for="name in names" :key="name.id" :value="name.name">{{ name.name }}</option>
            </select>
            <select
                id="nameSelect"
                v-model="selectedName"
                class="block border-2 border-green-800 rounded h-8 shadow-left-side"
                >
                <option value="">Modified</option>
                
            </select>
        </div>
        <div class="font-poppins text-[16px] bg-white w-full h-7 mb-2">
            
            <table class=" w-full text-sm text-left text-gray-500 dark:text-gray-400 mt-1 overflow-x-auto flex">
            
            <tbody>
                <tr class="bg-white flex flex-row border mx-8 rounded-sm">
                    
                    <td class="bg-gray-200 border-2 w-[500px] border-x-2  border-x-gray-600 rounded-sm  font-medium text-gray-900 text-center flex items-center justify-center">
                        <p class="pl-7">Name</p>
                    </td> 
                    <td class=" bg-gray-200 w-36 font-medium border-r-2 border-r-gray-600 flex text-gray-900 items-center justify-center">
                        File size
                    </td>
                    <td class="bg-gray-200 w-36 font-medium border-r-2 border-r-gray-600 flex text-gray-900 text-center items-center justify-center">
                        Last Modified
                    </td>
                    <td class="w-[200px] bg-gray-200 text-center flex border-r-2 border-r-gray-600 text-gray-900 font-medium items-center justify-center">
                        Action
                    </td>
                </tr>
                
            </tbody>
            </table>
        </div>

        <!---////////////////////////////////////////////FOLDERS//////////////////////////////////////////////////-->
        <div class="h-[290px] flex border">
           
        <div class="relative overflow-y-auto w-full h-full">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400  ">
            
                <tbody>
                    <router-link :to="{name: FileList}">
                        <tr class="m-1 bg-white h-8 border-b-1 border-gray-400 border-opacity-30 flex flex-row cursor-pointer mx-8 transform hover:translate-x-1 hover:border-l-yellow-500 hover:border-l-4 hover:bg-gray-200 line-animate bg-opacity-40 rounded-md  transition-transform duration-300 " v-for="folder in folders">
                            <td class="w-24 ml-12  font-medium text-center flex flex-row items-center justify-center truncate">
                                
                                <font-awesome-icon :icon="faRegularStar" class="pr-3 cursor-pointer text-yellow-500 "/>
                                <img src="../../images/folder.png" alt="" srcset="" class="h-5 w-6 ">
                            </td>
                            <td class="w-[356px] font-medium text-gray-500 text-center flex flex-row items-center justify-start truncate">
                                
                                <label for="check" class="px-2 text-[15px] font-poppins  truncate">{{ folder.name }}</label>
                            </td> 
                            <td class=" w-[144px] font-medium text-gray-500 text-center flex items-center justify-center">
                                 <label for="">20mb</label>
                           </td>
                            <td class="w-[144px] font-medium text-gray-500 text-center flex items-center justify-center">
                                <label for="">10/23/23</label>
                            </td>
                            <td class=" w-[200px] text-center flex items-center justify-center">
                                <font-awesome-icon :icon="faTrashCan" class=" text-green-500 cursor-pointer h-4 px-4 hover:rotate-45 transition-transform duration-300 "/>
                                <font-awesome-icon :icon="faDownload" class=" text-blue-800 cursor-pointer h-4 px-4 transition-transform duration-300"/>
                                <font-awesome-icon :icon="faEllipsisVertical" class=" text-black cursor-pointer h-3 px-4 hover:rotate-180 transition-transform duration-300"/>
                            </td>
                        </tr>
                    </router-link>
                    
                </tbody>
            </table>
        </div>

           
                    
        </div>

        <div class="h-7 ">
                <h1 class="font-poppins ml-10 mt-2 text-green-800">  RECENT UPLOADS</h1>
        </div>
    </div>

</template>
<script>

import {ChevronUpDownIcon } from '@heroicons/vue/20/solid'
import { faStar as regularStar, faTrashCan } from '@fortawesome/free-regular-svg-icons';
import { faStar as solidStar, faDownload, faEllipsisVertical } from '@fortawesome/free-solid-svg-icons' ;

import axios from 'axios';
axios.defaults.withCredentials = true;
export default {
  data() {
    return {
      selectedName: "",
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


    };
  },
  
  methods: {
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
   
    mounted(){
       this.getData();
       
    },

  computed:{
    faRegularStar(){return regularStar;},
    faSolidStar(){return solidStar;},
    faTrashCan(){return faTrashCan;},
    faDownload(){return faDownload;},
    faEllipsisVertical(){return faEllipsisVertical}
  }
};

</script>
<style>
 
</style>