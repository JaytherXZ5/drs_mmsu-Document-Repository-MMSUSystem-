<template>
    <slot name="psv_area">
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
                            <input type="checkbox" class="sr-only peer" v-model="psv_area.area_status" @change="togglePsvAreaStatus(psv_area)" checked :unchecked="psv_area.area_status === 0">
                            <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-focus:ring-4 peer-focus:ring-blue-300 dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-green-400"></div>
                            <label class="ml-3 text-sm text-gray-900">{{ psv_area.area_status ? 'Active' : 'Inactive' }}</label>
                        </label>

                        </td>
                        <td class="px-6 py-2">
                            <button @click="openEditModal(psv_area)" class=" font-montserrat text-center shadow rounded-md bg-blue-600 text-white hover:bg-white border-2 hover:border-2 hover:border-blue-600 hover:text-gray-600 w-[45%] focus:outline-none transition-transform duration-300 hover:-translate-x-1 p-[2px] ml">Edit</button>|
                            <button @click="deletePsvArea(psv_area.id)" class=" font-montserrat text-center shadow rounded-md bg-red-600 text-white hover:bg-white border-2 hover:border-2 hover:border-red-600 hover:text-gray-600 w-[45%] focus:outline-none transition-transform duration-300 hover:translate-x-1 p-[2px] ml"> Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>

            <EditAreaModal :showModal="isEditModalOpen"
                        :area ="selectedArea"
                        
                        @update-area="updatePsvArea"
                        @close-modal="closeEditModal"                
        >
            </EditAreaModal> 
    </slot>
</template>
<script>

import EditAreaModal from './EditAreaModal.vue';

export default {
    data(){
        return{
           psv_areas:[],
            isEditModalOpen: false,
            isEditModalOpen: false, 
        }
        
    },
    components:{
        EditAreaModal
    },
    methods:{
        async updatePsvArea(updatedArea) {
        const response = await axios.put(`/api/update_psv_area/${updatedArea.id}`, {
            area_name: updatedArea.area_name,
            area_description: updatedArea.area_description,
        });
        this.closeEditModal();
        },


        togglePsvAreaStatus(psv_area) {
            const newValue = psv_area.area_status ? 1 : 0;

            axios.post(`/api/updatePsvAreaStatus/${psv_area.id}`, { status: newValue })
                .then(response => {
                    console.log(response.data.message);
                    this.getPSV_Areas();
                })
                .catch(error => {
                    console.error(error.response.data.error);
                });
        },


        async deletePsvArea(areaId) {
            const response = await axios.delete(`/api/delete_psv_area/${areaId}`);

            this.psv_areas = this.areas.filter(area => area.id !== areaId);
        },

        async getPSV_Areas(){
           await axios.get('api/psv_areas').then(({data})=>{
            this.psv_areas = data;
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
    },
    mounted(){
        this.getPSV_Areas();
    }
}
</script>
<style>
    
</style>