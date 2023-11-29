<template>
    <div :class="{'hidden': !area_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-8': area_modalActive}">
        <div class="bg-gray-100 w-[50%] h-[75%] rounded-2xl ">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="area_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="area_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div class="modal-content flex flex-col pt-8 px-10">

                                <h1 class="px-2 font-montserrat text- text-green-800 ">Create Area</h1>

                                <Menu as="div" class="relative inline-block text-left w-[60%]">
                                    <div>
                                    
                                        <MenuButton @click="" type="button" class="h-8 shadow-r  outline-none items-center justify-center flex flex-row bg-gray-100 border-2 border-gray-200  hover:ring-2 rounded-md w-[30%] transform transition-transform duration-300">

                                            <h1 class=" text-green-800 font-montserrat text-sm ">{{ this.selectedLabel }}</h1><font-awesome-icon :icon="faChevronDown" class=" text-green-700 ml-4 "/>
                                        </MenuButton>
                                    </div>

                                    <transition
                                    enter-active-class="transition duration-100 ease-out"
                                    enter-from-class="transform scale-95 opacity-0"
                                    enter-to-class="transform scale-100 opacity-100"
                                    leave-active-class="transition duration-75 ease-in"
                                    leave-from-class="transform scale-100 opacity-100"
                                    leave-to-class="transform scale-95 opacity-0"
                                    >
                                    <MenuItems
                                        class=" border-2 border-gray-400 z-50 absolute ml-10 left-10 mt-2 w-[250px] origin-top-right divide-y  divide-gray-100 rounded-md bg-gray-100 shadow-lg ring-1 ring-black  ring-opacity-5 focus:outline-none"
                                    >
                                        <div class="px-1 py-1">
                                            
                                        
                                        <MenuItem v-slot="{ active }">
                                            
                                                <button @click="useArea"
                                                :class="[
                                                    active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                                    'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2 border-yellow-600 ',
                                                    ]"
                                                >
                                                    Areas
                                                </button>
                                            
                                        </MenuItem>
                                        
                                        <MenuItem v-slot="{ active }">
                                            <button @click="usePSVArea"
                                            :class="[
                                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                                ]"
                                            >
                                            PSV AREAS
                                            </button>
                                        </MenuItem>

                                        <MenuItem v-slot="{ active }">
                                            <button @click="useIAArea"
                                            :class="[
                                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                                ]"
                                            >
                                            IA AREAS
                                            </button>
                                        </MenuItem>
                                        <MenuItem v-slot="{ active }">
                                            <button @click.prevent=""
                                            :class="[
                                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                                ]"
                                            >
                                            LEVEL 3 PHASE 2 AREAS
                                            </button>
                                        </MenuItem>
                                        <MenuItem v-slot="{ active }">
                                            <button @click.prevent=""
                                            :class="[
                                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                                ]"
                                            >
                                            LEVEL 4 PHASE 2 AREAS
                                            </button>
                                        </MenuItem>

                                        
                                        
                                        </div>
                                        

                                        
                                    </MenuItems>
                                </transition>
                                </Menu>

                                <input v-model="this.form.area_name" type="text" placeholder="Area Name" class="pl-4 mt-4 bg-gray-100  h-10 rounded-xl border shadow-inset outline-none " required>
                                
                                <textarea v-model="this.form.area_description" cols="30" rows="10" placeholder="Area Description" class="p-2 mt-4 rounded-xl outline-none border bg-gray-100 shadow-inset" ></textarea>
                            </div>
                            
                            <div v-if="is_area" class="px-10 flex w-full justify-end mt-3 ">
                                <button @click="createArea" type="button" class="border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Create</button>
                                <button @click="close" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                
                            </div>
                            <div v-if="is_psv_area" class="px-10 flex w-full justify-end mt-3 ">
                                <button @click="createPSV_Area" type="button" class="border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Create</button>
                                <button @click="close" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                
                            </div>
                            <div v-if="is_ia_area" class="px-10 flex w-full justify-end mt-3 ">
                                <button @click="createIA_Area" type="button" class="border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Create</button>
                                <button @click="close" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                
                            </div>
                            <div v-if="is_default_area" class="px-10 flex w-full justify-end mt-3 ">
                                <button @click="createArea" type="button" class="border-2 border-white w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Create</button>
                                <button @click="close" type="submit" class="ml-2 border-2 border-white w-20 h-10 rounded-lg bg-green-700 shadow-r hover:bg-white hover:text-green-700 hover:border-green-700 font-montserrat text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                            </div>
                            
                        </div>
                        
                    </transition>
                </div>
            </transition>
        </div>
    </div>
   
</template>

<script>

import {faCircleXmark} from '@fortawesome/free-regular-svg-icons'
import axios from 'axios';
import Swal from 'sweetalert2';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';
import { faChevronDown } from '@fortawesome/free-solid-svg-icons';
export default{
    data(){
        return{
            form:{
                areas: [],
                area_name: '',
                area_description: '',
                newAreaStatus: false,
                totalAreasCount: 0,
                totalPsvAreasCount:0,
                totalIaAreasCount:0,

                

            },
            is_default_area: true,
                is_area: false,
                is_psv_area: false,
                is_ia_area: false,
                selectedLabel: 'Areas',  
        }
    },
    components:{
        Menu, MenuButton, MenuItems, MenuItem,
    },
    methods:{
        async createArea(){
            
            const response = await axios.post('/api/create_area', {
            area_name: this.form.area_name,
            area_order: this.form.totalAreasCount + 1, // Add 1 to the total number of areas
            area_description: this.form.area_description,
            
            });
            
            window.location.reload();
        },

        async createPSV_Area(){
            
            const response = await axios.post('/api/create_psv_area', {
            area_name: this.form.area_name,
            area_order: this.form.totalPsvAreasCount + 1, // Add 1 to the total number of areas
            area_description: this.form.area_description,
            
            });
            window.location.reload();
            
        },

        async createIA_Area(){
            
            const response = await axios.post('/api/create_ia_area', {
            area_name: this.form.area_name,
            area_order: this.form.totalIaAreasCount + 1, // Add 1 to the total number of areas
            area_description: this.form.area_description,
            
            });
            window.location.reload();
            
        },

        async fetchTotalAreasCount() {
            const response = await axios.get('/api/areas/total-count');
            this.form.totalAreasCount = response.data.total_areas_count;
        },

        async fetchTotalPsvAreasCount() {
            const response = await axios.get('/api/psv_areas/total-count');
            this.form.totalPsvAreasCount = response.data.total_areas_count;
        },

        async fetchTotalIaAreasCount() {
            const response = await axios.get('/api/ia_areas/total-count');
            this.form.totalIaAreasCount = response.data.total_areas_count;
        },

    useArea() {
      this.is_area = true;
      this.is_psv_area = false;
      this.is_ia_area = false;
      this.is_default_area = false;
      this.selectedLabel = 'Areas';

    },
    usePSVArea() {
      this.is_area = false;
      this.is_psv_area = true;
      this.is_ia_area = false;
      this.is_default_area = false;
      this.selectedLabel = 'PSV Areas';
    },
    useIAArea() {
      this.is_area = false;
      this.is_psv_area = false;
      this.is_ia_area = true;
      this.is_default_area = false;
      this.selectedLabel = 'IA Areas';
    },
        
    },
    async mounted(){
        await this.fetchTotalAreasCount();
        await this.fetchTotalPsvAreasCount();
        await this.fetchTotalIaAreasCount();
        
    },
    props: ["area_modalActive"],
    setup(props, {emit}){
        const close = () =>{
            emit('close');
        };
        return {close}
    },

    
    computed:{
        faCircleXmark(){return faCircleXmark;},
        faChevronDown(){return faChevronDown;}
    }
}
</script>
<style scoped>

</style>