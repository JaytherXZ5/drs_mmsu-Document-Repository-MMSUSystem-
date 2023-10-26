<template lang="">
    <div class="mt-2 w-[300px] h-[90%] flex flex-col">
        <div class="h-20 flex justify-start items-start ml-4 ">


            <router-link :to="{name: 'CreateFolder'}">
                <button class="w-[180px] h-14 border rounded-xl shadow-left-side flex-row ">
                    <p class="flex justify-center items-center text-[20px]">
                        <font-awesome-icon :icon="faPlus" class="flex w-[10%] text-green-600 mr-3"/>
                        <h1 class="font-semibold text-green-700">NEW</h1>
                    </p>
                </button>
            </router-link>
               
        </div>
        <!--NAV-->
        
        
        <Navigation/>
    </div> 

    <!-------------------------------------------MY FILES------------------------------>
    <div class="mt-2 flex w-[78%] rounded-2xl h-[88%] border shadow-left-side flex-col bg-mmsu-light-gray">

        <div class=" flex flex-row h-10 mt-2 ml-4 gap-5">
            <img src="../../../public/images/icons/back.png" @click="$event=>$router.go(-1)" class="w-10 h-10">
            <input type="text" class="border-none custom-shadow rounded-xl w-[80%] bg-white pl-3 placeholder:font-semibold placeholder:text-green-700" placeholder="/Root/MyFolder/file.png">
        </div>
        <div class="ml-4 flex flex-row gap-6 mt-2">
            <button class="border-gray-400 w-[100px] rounded-xl bg-gray-300 p-2">type v</button>
            <button class=" border-gray-400 w-[100px] rounded-xl bg-gray-300">modified v</button>
        </div>

        <div class="ml-4 mt-2 border rounded-lg h-[82%]">
            <div class="h-10 flex-row ml-16 ">
                <p class="flex mt-2 font-semibold font-sans">Name</p>
                <p></p>
                <p></p>
                <p></p>
            </div>

            <div class="h-[94%] rounded-lg flex-col">
                <div class="flex flex-col ml-5 h-[95%] bg-mmsu-light-gray">
                    <!----------------------->

                    
                    <div class=" gap-1 p-2  flex flex-col bg-mmsu-light-gray overflow-hidden">
                        
                            <div class=" lg:w-[100%] lg:h-[40px] flex flex-row border-b-2 text-black" v-for="folder in folders">
                                <router-link :to="{name: 'FileList', params:{id: folder.id} }" class="relative w-[100%] flex flex-row">
                                <!--<font-awesome-icon :icon="faFolder" class="flex w-10 h-10 text-blue-400"/>-->
                <!--////////////////////////////////////////////////////////FOLDERS////////////////////////////////////////////////////--> 
                                    
                                    <img src="/images/icons/folder.png" class="flex w-10 h-8 text-blue-400" alt="" srcset="">
                                    <p class="relative ml-5 mt-2 w-[200px] font-medium  font-mono">{{ folder.name }}</p>
                                </router-link>
                            </div>
                        
                    </div>
                    <!----------------------->

                    <div class="px-1 mt-4 w-full" >
                        <p class="px-2 mb-2 flex text-[24px] text-black"> Recent Uploads</p>

                        
                        <!--
                        <div class="flex mt-0 cursor-pointer"  v-for="file in files">
                            <div class="pt-0 w-[52px] h-[67px] flex justify-center items-center">
                                <img :src="`/images/icons/${file.type}.png`" alt="">
                            </div>
                            <div class=" px-2 w-[100%] bg-slate cursor-pointer">
                                <p class=" my-2 w-[80%] h-[20px]">{{ file.name + '.'+file.type }}</p>
                                <p class=" mt-2 w-[80%] h-[20px] text-[10px]">{{ file.create_at }}</p>
                            </div>


                            <div class="t-0 mt-2 mr-2 w-[15px] h-[15px] flex flex-col">
                                <div class="flex">
                                    <font-awesome-icon :icon="faDownload" class="flex w-[100%] h-[100%] text-blue-400"/>
                                </div>
                                <div class=" mt-2 flex">
                                    <font-awesome-icon :icon="faArchive" class="flex w-[100%] h-[100%] text-red-500" />
                                </div>
                
                            </div>
                        </div>
                    -->
                    
                    
                     </div>
                     <div class=" h-[50%] flex flex-row bg-gray-100 rounded-lg">
                        <div class=" pt-0 w-[100%] h-[100%] flex justify-start items-center " v-for="file in files">
                                <img :src="`/images/icons/${file.type}.png`" class="w-[200px] mt-[] " alt="">
                                <p class="absolute ml-10 mt-[40px] text-green-900">{{ file.name + '.'+file.type }}</p>
                        </div>
                     </div>
                </div>
            </div>

            
        
        </div>

    </div>
</template>
<script>
import { faFile } from '@fortawesome/free-regular-svg-icons';
import { faFolder,faDownload, faArchive} from '@fortawesome/free-solid-svg-icons';
import axios from 'axios';
import { faPlus } from '@fortawesome/free-solid-svg-icons';
import Navigation from '../Components/Navigation.vue';
import FileList from '../Components/FileList.vue';
export default {
    data(){
        return {
            folders:[],
            files:[]
        }
        
    },
    created: function(){
        this.getData();
    },
    components:{
        Navigation,
        FileList
       
    },
    computed:{
        faPlus(){return faPlus;},
        faFolder(){return faFolder;},
        faFile(){return faFile;},
        faDownload(){return faDownload},
        faArchive(){return faArchive},
    } ,
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
}
</script>
<style lang="">
    
</style>