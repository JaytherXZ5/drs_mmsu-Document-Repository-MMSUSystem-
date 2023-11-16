<template>
    <slot name="areas">
    <div class="border font-montserrat flex flex-col w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-2xl">
        
        <div class="h-20 border flex flex-row items-center gap-5">
            <h1 class="pl-6">SELECTED: </h1>
            <Menu as="div" class="relative inline-block text-left w-[60%]">
              <div>
                
                  <MenuButton @click="" type="button" class="flex flex-row items-center gap-4 border-2 px-4 py-2 hover:scale-110 transition-transform duration-300 t rounded-lg border-lime-700 ">

                      <h1 class=" text-green-800 font-montserrat text-md ">AREAS</h1><font-awesome-icon :icon="faChevronDown" class=" text-green-700 "/>
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
                  class=" border-2 border-green-400 z-50 absolute ml-10 left-10 mt-2 w-[250px] origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                >
                  <div class="px-1 py-1">
                     
                    
                    <MenuItem v-slot="{ active }">
                        <router-link to="/admin/areas">
                            <button @click.prevent=""
                                :class="[
                                active ? 'bg-violet-500 text-white' : 'text-gray-900',
                                'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
                                ]"
                            >
                                Areas
                            </button>
                        </router-link>
                    </MenuItem>
                    
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
                        ]"
                      >
                        PSV AREAS
                      </button>
                    </MenuItem>

                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
                        ]"
                      >
                        IA AREAS
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
                        ]"
                      >
                        LEVEL 3 PHASE 2 AREAS
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
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
        <div class="relative overflow-x-auto rounded-lg overflow-y-auto ">
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
                    <tr class="bg-gray-100 border-b font-montserrat " v-for="area in areas" :key="area.id">
                        <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                            {{ area.area_order }}
                        </td>
                        <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                            {{ area.area_name }}
                        </td>
                        <td class="px-6 py-2">
                            {{ area.area_description }}
                        </td>
                        <td class="px-6 py-2">
                            
                            <label class="relative inline-flex items-center cursor-pointer">
                            <input type="checkbox" value="" class="sr-only peer" checked>
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300  dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300">Active</label>
                            </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(area)" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit |&nbsp</button>
                            <button @click="deleteArea(area.id)" class="font-medium text-black  hover:underline"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

        </div>
        
        <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                        @update-area="updateArea"
                        @close-modal="closeEditModal"                
        >
        </EditAreaModal>

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
            isEditModalOpen: false,
            selectedArea: null,
            
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

        async deleteArea(areaId) {
        const response = await axios.delete(`/api/areas/${areaId}`);

        // Handle the response as needed, e.g., update the areas array

        // Optionally, you can also remove the deleted area from the local array
        this.areas = this.areas.filter(area => area.id !== areaId);
    },

    },
    
    mounted(){
        this.getAreas();
    }
}
</script>
<style lang="">
    
</style>