<template>
  <nav class="border-2 shadow-r h-full w-full rounded-xl min-w-[300px] bg-gray-100">
    <div class="h-20 w-full  px-3 flex items-center justify-start">
          <Menu as="div" class="relative inline-block text-left w-[60%]">
              <div>
                
                  <MenuButton @click="" type="button" class="shadow-r  outline-none items-center justify-center flex flex-row bg-gray-100 border-2 border-gray-200  h-12 rounded-xl w-[100%] transform  hover:scale-110  transition-transform duration-300">
                      <div class="w-6 h-6 rounded ring-2 ring-green-600 mr-2">
                          <font-awesome-icon :icon="faPlus" class=" text-green-800 hover:rotate-90 transition-transform duration-300"/>
                      </div>
                      <h1 class=" text-green-800 font-montserrat text-xl ">NEW</h1>
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
                      <button @click="toggleAreaModal"
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Add Areas
                      </button>
                    </MenuItem>

                    <MenuItem v-slot="{ active }">
                      <router-link to="/register">
                      <button @click =""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Register New Account
                      </button>
                    </router-link>
                    </MenuItem>
                   
                  </div>
                  

                  
                </MenuItems>
          </transition>
          </Menu>
          
          <CreateFolderModal @close="toggleModal" :modalActive="modalActive">
                    
        </CreateFolderModal>
        <CreateAreaModal @close="toggleAreaModal" :area_modalActive="area_modalActive">
                    
        </CreateAreaModal>

   
    </div>
    
     <!--NAVIGATION-->
     <div class=" px-3 relative h-[calc(90%-80px)] rounded-b-xl">
          <div class="pl-4 bg-gray-100 flex flex-col gap-2  h-[calc(100%-15px)] rounded-t-xl rounded-b-md border-2 border-gray-300     text-white font-montserrat p-8">
            
              <!--admin areas//////////////////////////////////////////////////////////////////////////-->
              <router-link to='/areas'>
              <div :class="{
                        'bg-white translate-x-4 text-green-800': currentRoute === '/areas',
                        'bg-green-800': currentRoute !== '/areas',
                      }"
          
                    class="shadow-r border-2 bg-green-800 py-2 mt-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform   transition-transform duration-300">
                  <a class="ml-6 " href="#">Areas</a>
                  
              </div>
            </router-link>
            <router-link to='/accounts'>
              <div 

              :class="{
                        'bg-white translate-x-4 text-green-800': currentRoute === '/accounts',
                        'bg-green-800': currentRoute !== '/accounts',
                      }"

                  class="border-2 shadow-r bg-green-800 py-2 mt-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform   transition-transform duration-300">
                  <a class="ml-6 " href="#">Manage Accounts</a>
                  
              </div>
            </router-link>


          </div>
      </div>
    
  </nav>
</template>
<script>

import { faArchive, faPeopleGroup, faFolderPlus,faFileArrowUp, faPlus } from '@fortawesome/free-solid-svg-icons';
import { faFolder,faFile, faStar, } from '@fortawesome/free-regular-svg-icons';
import CreateFolderModal from '../Components/CreateFolderModal.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { faChevronRight} from '@fortawesome/free-solid-svg-icons';
import CreateAreaModal from "./CreateAreaModal.vue";
import {ref} from 'vue';
export default{
  name: "Navigation",

  data(){
    return{
      currentRoute: '',
    }
  },
  components:{
      Menu, MenuButton, MenuItems, MenuItem, CreateFolderModal, CreateAreaModal
  },
  setup(){
      const modalActive = ref(false);
      const area_modalActive = ref(false);
      const toggleModal = () =>{
          modalActive.value = !modalActive.value;
      
      }
      const toggleAreaModal = () =>{
        area_modalActive.value = !area_modalActive.value;
      }
      return {area_modalActive,modalActive, toggleModal, toggleAreaModal}
      
  },
  watch: {
    '$route.path'(newPath) {
      this.currentRoute = newPath;
    },
  },
  mounted(){
    this.currentRoute = this.$route.path;
  },

  computed:{
      faPlus(){return faPlus;},
      faFolder(){return faFolder;},
      faFileArrowUp(){return faFileArrowUp;},
      faFolderPlus(){return faFolderPlus},
      faArchive(){return faArchive},
      faPeopleGroup(){return faPeopleGroup},
      faStar(){return faStar},
      
  }
}
</script>