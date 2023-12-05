<template>
    <slot name="accounts">
    <div class="border font-montserrat flex flex-col  w-[calc(100%-5px)] h-[calc(100%-15px)] rounded-2xl">
        
        <div class="h-20 pl-6 border flex flex-row items-center gap-[150px]">
            
            

   

      <router-link to='/register'>
              <div 
              class=" hover:scale-105 flex justify-center hover:border-2 hover:border-white  border-2 border-red-20 shadow-r bg-green-800 py-2 mt-2 ring-2 text-white ring-white rounded-lg transform   transition-transform duration-300">
                <div class=" flex w-12 h-6 rounded ring-2 items-center justify-center ring-white ml-4">
                            <font-awesome-icon :icon="faPlus" class=" text-white hover:rotate-90 transition-transform duration-300"/>
                            <font-awesome-icon :icon="faUser" class=" text-white transition-transform duration-300"/>

                 </div>              
              <a class="flex ml-6 pr-10 transition-transform duration-300 hover:scale-105" href="#">Register Account</a>
                  
              </div>
      </router-link>
            
        </div>
        <div class="relative ">
          
          <table class="w-full text-sm text-left ">
            <thead class="sticky top-0 z-10 text-xs text-gray-700 uppercase bg-gray-100 shadow-b">
              <tr>
                <th scope="col" class="px-2 py-3">Name</th>
                <th scope="col" class="px-1 py-3">User Name</th>
                <th scope="col" class="px-1 py-3">Email</th>
                <th scope="col" class="px-1 py-3">Role</th>
                <th scope="col" class="px-1 py-3">Office</th>
                <th scope="col" class="px-1 py-3 text-center">Action</th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-gray-100 border-b" v-for="user in filteredUsers" :key="user.id">
                <td scope="row" class=" w-[200px] px-2 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  
                  <h1 class="w-[200px] truncate">
                    <span class="font-bold text-green-500" v-if="isSignedInUser(user)">
                     (ADMIN)
                    </span>
                    {{ user.name }}
                  </h1>
                </td>
                <td scope="row" class=" px-1 w-[170px] py-2 font-medium text-gray-900 whitespace-nowrap ">
                  <h1 class="w-[170px] truncate ">{{ user.username }}</h1>
                </td>
                <td scope="row" class="px-1 py-2 w-[170px] font-medium text-gray-900 whitespace-nowrap ">
                  <h1 class="w-[170px] truncate ">{{ user.email }}</h1>
                </td>
                <td scope="row" class="px-1 py-2 w-[170px] font-medium text-gray-900 whitespace-nowrap ">
                  
                  <h1  class="w-[170px] truncate " >{{ user.role.name}}</h1>
                  
                </td>
              
                <td scope="row" class="w-[170px] px-1 py-2 font-medium text-gray-900 whitespace-nowrap ">
                  <h1 class="w-[170px] truncate">{{  getUserOffice(user) }}</h1>
                </td>
                

                <td scope="row" class="flex flex-row items-center justify-center mt-1">
                  <button @click.prevent="openDeleteModal(user)" class="hidden py-1 text-white border-white border-2 text-center rounded-md shadow-r bg-red-600 hover:text-gray-700 hover:bg-white hover:border-red-600 w-[35%] focus:outline-none transition-transform duration-300 hover:translate-x-1">
                     Delete</button>

                     <Menu as="div" class="relative inline-block text-left w-[60%]">
                      <div class="flex flex-row items-center justify-center">
                        <MenuButton
                          type="button"
                          class="outline-none items-center justify-center flex flex-row bg-gray-100 h-10 rounded-md w-[30%] "
                        >
                          
                          
                            <font-awesome-icon :icon="faEllipsis" class="border w-10 p-2 rounded-full bg-gray-200 text-green-700 transition-transform duration-300 hover:scale-110 "/>
                          
              
                        </MenuButton>
                      </div>

                      <transition
                        enter-active-class="transition duration-300 ease-out"
                        enter-from-class="transform scale-95 opacity-0"
                        enter-to-class="transform scale-100 opacity-100"
                        leave-active-class="transition duration-75 ease-in"
                        leave-from-class="transform scale-100 opacity-100"
                        leave-to-class="transform scale-95 opacity-0"
                      >
                        <MenuItems
                          class="border-1 border-slate-600 z-auto absolute ml-10 -left-52 -top-1 mt-2 w-[200px] origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-slate-700 ring-opacity-5 focus:outline-none"
                        >
                          <div class="px-1 py-1">
                            <MenuItem>
                              <button 
                                @click=""
                                :class="[
                                  active ? 'bg-slate-600 text-white' : 'text-gray-900',
                                  'group flex w-full items-center rounded-md px-2 py-1 mb-1 text-sm border-b-2 border-yellow-600 ',
                                ]"
                              >
                                
                                Actions
                              </button>
                            </MenuItem>
                            <MenuItem v-slot="{ active }">
                              <button
                                @click.prevent="showDelete(user)"
                                :class="[
                                  active ? 'bg-red-200 text-gray-700' : 'text-gray-900',
                                  'group flex w-full items-center rounded-md px-2 py-1 text-sm  border-green-700 ',
                                ]"
                              >
                                <!-- Adjust the content based on your institution model structure -->
                                Delete
                              </button>
                            </MenuItem>
                            <MenuItem v-slot="{ active }">
                              <button
                                @click="showDetails(user)"
                                :class="[
                                  active ? 'bg-blue-200 text-gray-700 ' : 'text-gray-900',
                                  'group flex w-full items-center rounded-md px-2 py-1 text-sm  border-green-700 ',
                                ]"
                              >
                                <!-- Adjust the content based on your institution model structure -->
                                Details
                              </button>
                            </MenuItem>
                          </div>
                        </MenuItems>
                      </transition>
                    </Menu>
                </td>
              </tr>
            </tbody>
         </table>

        </div>
        
        <div v-if="isDelete">
          <AccountActionsModal
            :showModal = isModalOpen
            :isDelete = isDelete
            :user = selectedUser
            @close-modal = closeModal
          >

          </AccountActionsModal>
        </div>
       <div v-if="isDetails">
        <AccountActionsModal
            :detailsShowModal = isModalOpen
            :isDetails = isDetails
            :user = selectedUser
            @close-modal = closeModal
          >

          </AccountActionsModal>
       </div>

       
    </div>
</slot>



</template>
<script>
import axios from 'axios';
import CreateAreaModal from './CreateAreaModal.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue';
import EditAreaModal from '../Admin/EditAreaModal.vue';
import { faChevronDown,faEllipsis,faPlus } from '@fortawesome/free-solid-svg-icons';
import { faUser } from '@fortawesome/free-regular-svg-icons';
import AccountActionsModal from './AccountActionsModal.vue';
export default {
    name: "Area",
    data(){
        return{
          
            curr_user:'',
            roles:[],
            users: [],
            institutions: [],
            degrees:[],
            psv_areas:[],
            admin:[],
            
            selectedInstitution: null,
            
            isDelete: false,
            isDetails: false,

            isModalOpen: false,
            selectedUser: null,

            office_id:null,
            
            
            

        }
    },  
    components:{
        CreateAreaModal,Menu, MenuButton, MenuItems, MenuItem, EditAreaModal, AccountActionsModal
    },
    computed:{
      filteredUsers() {
      if (!this.selectedInstitution) {
        return this.users;
      }
      return this.users.filter(user => user.institution_id == this.selectedInstitution);
    },
        faChevronDown(){return faChevronDown;},
        faPlus(){return faPlus;},
        faUser(){return faUser;},
        faEllipsis(){return faEllipsis;},

    },
    methods:{
      async fetchUsers() {
        const response = await axios.get('/api/users');
        this.users = response.data;

     },

     getUserOffice(user){
         if(user.admin_office_id !==0){
            return user.admin_office.name;
         }else if(user.psv_area_id !==0){
            return user.psv_area.area_name + " -- "+user.psv_area.area_description;
         }else if(user.degree_id !==0){
            return user.degree.abbr;
         }else if(user.institution_id !==0){
            return user.institution.name;
         }else if(user.isAdmin){
          return "---"
         }
     },

     async getRoles(){
      try{
          const response = await axios.get('api/roles');
          this.roles = response.data;
          console.log(response.data.id);
        }catch(error){
          console.error('Error fetching user roles:', error);
        }
     },



     async deleteUser(userId) {
            const response = await axios.delete(`/api/delete-user/${userId}`);
    },
    

     
    setSelectedInstitution(institutionId) {
      this.selectedInstitution = institutionId;
      this.fetchUsers();
    },

     filterUsers() {
      
      this.fetchUsers();
    },

    isSignedInUser(user) {
      
      return user.id === this.curr_user.id;
    },

    showDelete(user){
      this.isDelete = true;
      this.isDetails=false;
      this.openModal(user);
    },

    showDetails(user){
      this.isDetails = true;
      this.isDelete = false;
      this.openModal(user)
    },

    openModal(user){
      
      this.isModalOpen = true;
      this.selectedUser = user;

    },

    
    
    closeModal(){
      this.isModalOpen = false;
      this.selectedUser = null;
    },
  


    },
    
    mounted(){
      this.fetchUsers();
      this.getRoles();
      
      axios.get('/api/user').then((res)=>{
            this.curr_user = res.data
        })

      
      
    }
}
</script>
<style lang="">
    
</style>