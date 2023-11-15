<template>
    <slot name="accounts">
    <div class="border font-montserrat flex flex-col w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-2xl">
        
        <div class="h-20 border flex flex-row items-center gap-5">
            <h1 class="pl-6">INSTITUTION: </h1>
            

            <Menu as="div" class="relative inline-block text-left w-[60%]">
      <div>
        <MenuButton
          type="button"
          class="shadow-r  outline-none items-center justify-center flex flex-row bg-gray-100 border-2 border-gray-200 h-12 hover:ring-2 rounded-xl w-[30%] transform transition-transform duration-300"
        >
          
          <h1 class="text-green-800 font-montserrat text-lg">{{ selectedInstitution ? institutions.find(inst => inst.id === selectedInstitution)?.name : 'Select Institution' }}</h1>
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
          class="border-2 border-slate-600 z-50 absolute ml-10 left-10 mt-2 w-[250px] origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
        >
          <div class="px-1 py-1">
            <MenuItem v-slot="{ active }">
              <button
                @click="setSelectedInstitution(null)"
                :class="[
                  active ? 'bg-slate-600 text-white' : 'text-gray-900',
                  'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2 border-yellow-600 ',
                ]"
              >
                
                All Institutions
              </button>
            </MenuItem>
            <MenuItem v-for="institution in institutions" :key="institution.id" v-slot="{ active }">
              <button
                @click="setSelectedInstitution(institution.id)"
                :class="[
                  active ? 'bg-slate-600 text-white' : 'text-gray-900',
                  'group flex w-full items-center rounded-t-md px-2 py-2 text-sm  border-green-700 ',
                ]"
              >
                <!-- Adjust the content based on your institution model structure -->
                {{ institution.name }}
              </button>
            </MenuItem>
          </div>
        </MenuItems>
      </transition>
    </Menu>
            
        </div>
        <div class="relative overflow-x-auto rounded-lg overflow-y-auto ">
          
          <table class="w-full text-sm text-left ">
            <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b">
              <tr>
                <th scope="col" class="px-6 py-3">Name</th>
                <th scope="col" class="px-6 py-3">Email</th>
                <th scope="col" class="px-6 py-3">User Role</th>
                <th scope="col" class="px-6 py-3">Institution</th>
                <th scope="col" class="px-6 py-3">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-gray-100 border-b" v-for="user in filteredUsers" :key="user.id">
                <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  {{ user.name }}
                </td>
                <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  {{ user.email }}
                </td>
                <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  {{ user.user_role ? user.user_role.role : 'N/A' }}
                </td>
                <td scope="row" class="px-6 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  {{ user.institution ? user.institution.name : 'N/A' }}
                </td>
                <td>
                  
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
        
            
            users: [],
            institutions: [],
            selectedInstitution: null,
            
            
        }
    },  
    components:{
        CreateAreaModal,Menu, MenuButton, MenuItems, MenuItem, EditAreaModal
    },
    computed:{
      filteredUsers() {
      if (!this.selectedInstitution) {
        return this.users;
      }
      return this.users.filter(user => user.institution_id == this.selectedInstitution);
    },
        faChevronDown(){
            return faChevronDown;
        }
    },
    methods:{
      async fetchUsers() {
        const response = await axios.get('/api/users');
        this.users = response.data;

      const institutionsResponse = await axios.get('/api/institutions');
      this.institutions = institutionsResponse.data;
     },

     
    setSelectedInstitution(institutionId) {
      this.selectedInstitution = institutionId;
      this.fetchUsers();
    },

     filterUsers() {
      // Fetch users again to apply the filter
      this.fetchUsers();
    },

    },
    
    mounted(){
      this.fetchUsers();
      
    }
}
</script>
<style lang="">
    
</style>