<template>
    <slot name="areas">
    <div class="border border-t-2 border-t-gray-500 border-l-gray-600 border-r-green-700 border-l-8  border-gray-300 flex flex-col w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-2xl">
        
        <div class="h-16">
            
        </div>
        <div class="relative overflow-x-auto rounded-lg overflow-y-auto ">
            <table class="w-full text-sm text-left ">
                <thead class="sticky top-0 z text-xs text-gray-700 uppercase bg-gray-300">
                    <tr>
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
                    <tr class="bg-white border-b " v-for="area in areas" :key="area.id">
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