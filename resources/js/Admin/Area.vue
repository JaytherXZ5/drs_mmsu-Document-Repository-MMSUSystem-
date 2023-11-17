<template>
    <slot name="areas">
    <div class="border font-montserrat flex flex-col w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-2xl">
        
        <div class="ml-4 h-28 flex flex-row items-center gap-5">
           
            <Menu as="div" class="relative inline-block text-left w-[60%]">
              <div>
                
                  <MenuButton @click="" type="button" class="shadow-r  outline-none items-center justify-center flex flex-row bg-gray-100 border-2 border-gray-200 h-12 hover:ring-2 rounded-xl w-[30%] transform transition-transform duration-300">

                      <h1 class=" text-green-800 font-montserrat text-md ">{{ this.selectedLabel }}</h1><font-awesome-icon :icon="faChevronDown" class=" text-green-700 ml-4 "/>
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
                  class=" border-2 border-green-600 z-50 absolute ml-10 left-10 mt-2 w-[250px] origin-top-right divide-y divide-gray-100 rounded-xl bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                >
                  <div class="px-1 py-1">
                     
                    
                    <MenuItem v-slot="{ active }">
                        
                            <button @click="showArea"
                            :class="[
                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                ]"
                            >
                                Areas
                            </button>
                        
                    </MenuItem>
                    
                    <MenuItem v-slot="{ active }">
                      <button @click="showPSVArea"
                      :class="[
                                active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2  ',
                                ]"
                      >
                        PSV AREAS
                      </button>
                    </MenuItem>

                    <MenuItem v-slot="{ active }">
                      <button @click="showIAArea"
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
        </div>

        <div v-if="is_psv_area" class="relative overflow-x-auto rounded-lg overflow-y-auto ">
            <table class="w-full text-sm text-left">
                <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b font-montserrat">
                    <tr class="">
                        <th scope="col" class="px-6 py-3">
                            Order
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Area
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Description
                        </th>
                        <th>
                            Status
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-gray-100 border-b  " v-for="psv_area in psv_areas" :key="psv_area.id">
                        <td scope="row" class="px-6 py-2 font-bold text-gray-500 whitespace-nowrap ">
                            {{ psv_area.area_order }}
                        </td>
                        <td scope="row" class="px-6 py-2 font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ psv_area.area_name }}
                        </td>
                        <td  class="px-6 py-2  font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ psv_area.area_description }}
                        </td>
                        <td class=" py-2 font-montserrat text-gray-600 whitespace-nowrap ">
                            
                            <label class="relative inline-flex items-center cursor-pointer">
                            <input type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300  dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm text-gray-900 ">Active</label>
                            </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(psv_area)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:-translate-x-1 p-[2px] ml">Edit</button> |
                            <button @click="deletePsvArea(psv_area.id)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:translate-x-1 p-[2px] ml"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </div>

        <div v-if="is_ia_area" class="relative overflow-x-auto rounded-lg overflow-y-auto ">
            <table class="w-full text-sm text-left">
                <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b font-montserrat">
                    <tr class="">
                        <th scope="col" class="px-6 py-3">
                            Order
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Area
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Description
                        </th>
                        <th>
                            Status
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-gray-100 border-b  " v-for="ia_area in ia_areas" :key="ia_area.id">
                        <td scope="row" class="px-6 py-2 font-bold text-gray-500 whitespace-nowrap ">
                            {{ ia_area.area_order }}
                        </td>
                        <td scope="row" class="px-6 py-2 font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ ia_area.area_name }}
                        </td>
                        <td  class="px-6 py-2  font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ ia_area.area_description }}
                        </td>
                        <td class=" py-2 font-montserrat text-gray-600 whitespace-nowrap ">
                            
                            <label class="relative inline-flex items-center cursor-pointer">
                            <input type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300  dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm text-gray-900 ">Active</label>
                            </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(ia_area)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:-translate-x-1 p-[2px] ml">Edit</button>|
                            <button @click="deleteIaArea(ia_area.id)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:translate-x-1 p-[2px] ml"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </div>

        <div v-if="is_area" class="relative overflow-x-auto rounded-lg overflow-y-auto ">
            <table class="w-full text-sm text-left">
                <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b font-montserrat">
                    <tr class="">
                        <th scope="col" class="px-6 py-3">
                            Order
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Area
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Description
                        </th>
                        <th>
                            Status
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-gray-100 border-b  " v-for="area in areas" :key="area.id">
                        <td scope="row" class="px-6 py-2 font-bold text-gray-500 whitespace-nowrap ">
                            {{ area.area_order }}
                        </td>
                        <td scope="row" class="px-6 py-2 font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ area.area_name }}
                        </td>
                        <td  class="px-6 py-2  font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ area.area_description }}
                        </td>
                        <td class="px-6 py-2 font-montserrat text-gray-600 whitespace-nowrap ">
                            
                            <label class="relative inline-flex items-center cursor-pointer">
                            <input type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300  dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm text-gray-900 ">Active</label>
                            </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(area)" class=" text-blue-600 dark:text-blue-500 hover:underline">Edit |&nbsp</button>
                            <button @click="deleteArea(area.id)" class=" text-black  hover:underline"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </div>
        
        <div v-if="is_default_area" class="relative overflow-x-auto rounded-lg overflow-y-auto ">
            <table class="w-full text-sm text-left">
                <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b font-montserrat">
                    <tr class="">
                        <th scope="col" class="px-6 py-3">
                            Order
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Area
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Description
                        </th>
                        <th>
                            Status
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-gray-100 border-b  " v-for="area in areas" :key="area.id">
                        <td scope="row" class="px-6 py-2 font-bold text-gray-500 whitespace-nowrap ">
                            {{ area.area_order }}
                        </td>
                        <td scope="row" class="px-6 py-2 font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ area.area_name }}
                        </td>
                        <td  class="px-6 py-2  font-montserrat text-gray-500 whitespace-nowrap ">
                            {{ area.area_description }}
                        </td>
                        <td class=" py-2 font-montserrat text-gray-600 whitespace-nowrap ">
                            
                            <label class="relative inline-flex items-center cursor-pointer">
                            <input type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300  dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm text-gray-900 ">Active</label>
                            </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(area)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:-translate-x-1 p-[2px] ml">Edit</button>|
                            <button @click="deleteArea(area.id)" class=" font-montserrat text-gray-600 text-center border rounded-md shadow-r hover:bg-green-700 hover:text-white hover:border-white w-[45%] focus:outline-none transition-transform duration-300 hover:translate-x-1 p-[2px] ml"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </div>


        <div v-if="is_area">
           <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                        @update-area="updateArea"
                        
                        @close-modal="closeEditModal"                
        >
            </EditAreaModal> 
        </div>
        
        <div v-if="is_psv_area">
           <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                        
                        @update-area="updatePsvArea"
                        @close-modal="closeEditModal"                
        >
            </EditAreaModal> 
        </div>
        <div v-if="is_ia_area">
           <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                       
                        @update-area="updateIaArea"
                        @close-modal="closeEditModal"                
        >
            </EditAreaModal> 
        </div>
        <div v-if="is_default_area">
           <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                        @update-area="updateArea"
                        @close-modal="closeEditModal"                
        >
            </EditAreaModal> 
        </div>

    </div>
</slot>
</template>
<script>
import axios from 'axios';
import CreateAreaModal from './CreateAreaModal.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';
import EditAreaModal from '../Admin/EditAreaModal.vue';
import {ref} from 'vue';
import { faChevronDown } from '@fortawesome/free-solid-svg-icons';

export default {
    name: "Area",
    data(){
        return{
        
            areas:[],
            psv_areas:[],
            ia_areas:[],
            isEditModalOpen: false,
            selectedArea: null,

            is_default_area: true,
            is_area: false,
            is_psv_area: false,
            is_ia_area: false,
            selectedLabel: 'Areas',       
            

            
            
        }
    },  
    components:{
        CreateAreaModal,Menu, MenuButton, MenuItems, MenuItem, EditAreaModal
    },
    computed:{
        faChevronDown(){
            return faChevronDown;
        }
    },
    methods:{
        async getAreas(){
           await axios.get('api/areas').then(({data})=>{
            this.areas = data;
           }).catch((error)=>{
            this.errors = error.response.data.errors;
           })
        },

        openEditModal(area) {
            this.isEditModalOpen = true;
            this.selectedArea = area;
        },

        closeEditModal() {
            this.isEditModalOpen = false;
            this.selectedArea = null;
        },

        async updateArea(updatedArea) {
        const response = await axios.put(`/api/areas/${updatedArea.id}`, {
            area_name: updatedArea.area_name,
            area_description: updatedArea.area_description,
        });

        this.closeEditModal();
        },
        
        async updatePsvArea(updatedArea) {
        const response = await axios.put(`/api/psv_areas/${updatedArea.id}`, {
            area_name: updatedArea.area_name,
            area_description: updatedArea.area_description,
        });
        this.closeEditModal();
        },  

        async updateIaArea(updatedArea) {
        const response = await axios.put(`/api/ia_areas/${updatedArea.id}`, {
            area_name: updatedArea.area_name,
            area_description: updatedArea.area_description,
        });
        this.closeEditModal();
        },  
        
        


        async deleteArea(areaId) {
            const response = await axios.delete(`/api/areas/${areaId}`);

            this.areas = this.areas.filter(area => area.id !== areaId);
        },

        async deletePsvArea(areaId) {
            const response = await axios.delete(`/api/psv_areas/${areaId}`);

            this.areas = this.areas.filter(area => area.id !== areaId);
        },

        async deleteIaArea(areaId) {
            const response = await axios.delete(`/api/ia_areas/${areaId}`);

            this.areas = this.areas.filter(area => area.id !== areaId);
        },



    ////////////////////PSV//////////////////////////
    async getPSV_Areas(){
        const response = await axios.get('/api/psv_areas');
        this.psv_areas = response.data;
        },
    
    async getIA_Areas(){
        const response = await axios.get('/api/ia_areas');
        this.ia_areas = response.data;
    },
    
       
    
    
    showArea() {
      this.is_area = true;
      this.is_psv_area = false;
      this.is_ia_area = false;
      this.is_default_area = false;
      this.selectedLabel = 'Areas';

    },
    showPSVArea() {
      this.is_area = false;
      this.is_psv_area = true;
      this.is_ia_area = false;
      this.is_default_area = false;
      this.selectedLabel = 'PSV Areas';
    },
    showIAArea() {
      this.is_area = false;
      this.is_psv_area = false;
      this.is_ia_area = true;
      this.is_default_area = false;
      this.selectedLabel = 'IA Areas';
    },





    },
    
    mounted(){
        this.getAreas();
        this.getPSV_Areas();
        this.getIA_Areas();
    }
}
</script>
<style lang="">
    
</style>