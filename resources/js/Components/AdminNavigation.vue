<template>
  <nav class="min-w-[270px] ">
      <div class="h-[70px] px-3 mt-1 flex items-center gap-3">
          <img src="../../images/mmsu-logo.png" class=" h-[calc(100%-30px)] " alt="logo" srcset="">
         <h1 class="font-serif text-lg"> MARIANO MARCOS <br>STATE UNIVERSITY</h1>
      </div>
      <div class="h-20 w-full  px-3 flex items-center justify-start">
          <!--<CreateFolderModal @close="toggleModal" :modalActive="modalActive">
              <div class="modal-content">
                  <h1>Modal Header
                  </h1>
              </div>
          </CreateFolderModal>
      
          <button @click="toggleModal" type="button" class="items-center justify-center flex flex-row bg-mmsu-light-gray border h-12 rounded-xl w-[60%] shadow-left-side transform hover:scale-110  transition-transform duration-300">
              <div class="w-6 h-6 rounded ring-2 ring-green-600 mr-2">
                  <font-awesome-icon :icon="faPlus" class=" text-green-800 hover:rotate-90 transition-transform duration-300"/>
              </div>
              <h1 class=" text-green-800 font-poppins text-xl ">NEW</h1>
          </button>-->
          <Menu as="div" class="relative inline-block text-left w-[60%]">
              <div>
                
                  <MenuButton @click="" type="button" class=" outline-none items-center justify-center flex flex-row bg-mmsu-light-gray border  h-12 rounded-xl w-[100%] shadow-left-side transform hover:scale-110  transition-transform duration-300">
                      <div class="w-6 h-6 rounded ring-2 ring-green-600 mr-2">
                          <font-awesome-icon :icon="faPlus" class=" text-green-800 hover:rotate-90 transition-transform duration-300"/>
                      </div>
                      <h1 class=" text-green-800 font-poppins text-xl ">NEW</h1>
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
                      <button  @click="toggleModal"
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center rounded-t-md px-2 py-2 text-sm border-b-2 border-green-700 ',
                        ]"
                      >
                      <font-awesome-icon :icon="faFolderPlus"  class="mr-2 h-4 "/>
                        New Folder
                      </button>
                    </MenuItem>
                    
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm',
                        ]"
                      ><font-awesome-icon :icon="faFileArrowUp" class="mr-2 w-4 h-4"/>
                        File Upload
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-b-2 border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Folder Upload
                      </button>
                    </MenuItem>
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
                      <button @click=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Add IA Areas
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Add Level 3 Phase 2 Areas
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Add Level 4 Phase 2 Areas
                      </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                      <button @click.prevent=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center text-black rounded-t-md px-2 py-2 text-sm border-b-2 border-green-700',
                        ]"
                      >
                      <img src="../../images/folder-upload.svg" class="w-4 h-4 mr-2" alt="" srcset="">
                        Add PSV Areas
                      </button>
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
      <div class="px-3 relative h-[calc(90%-80px)] rounded-b-xl">
          <div class="bg-gray-100 flex flex-col gap-2 border-gray-600 border-4 shadow-left-side h-[calc(100%-15px)] rounded-t-xl rounded-b-md  text-white font-poppins p-8">
            <router-link to='/user'> 
                <div class=" bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300 ">
                    <a class="ml-6 pr-4" href="#"> My Repository</a>
                    <font-awesome-icon :icon="faFolder" class="ml-3 hover:rotate-45  transition-transform duration-300 mr-2"/>
                </div>
            </router-link>
              <div class=" bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[52px]" href="#">Favorites</a>
                  <font-awesome-icon :icon="faStar" class="ml-3 hover:rotate-45 transition-transform duration-300"/>
              </div>
              <div class=" bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[6px]" href="#">Shared with me</a>
                  <font-awesome-icon :icon="faPeopleGroup" class="ml-3 hover:rotate-45 transition-transform duration-300"/>
              </div>
              <div class="bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">Archived</a>
                  <font-awesome-icon :icon="faArchive" class="ml-3 hover:rotate-45 transition-transform duration-300"/>
              </div>
              <!--admin areas//////////////////////////////////////////////////////////////////////////-->
              <router-link to='/areas'>
              <div class="bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">Areas</a>
                  
              </div>
            </router-link>
              <div class="bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">PSV Areas</a>
                  
              </div>
              <div class="bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">IA Areas</a>
                  
              </div>
              <div class="bg-green-700 py-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform hover:scale-110  transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">Archived</a>
                  
              </div>

          </div>
      </div>
      <!--<div class="px-3 relative h-[calc(50%-70px)] rounded-b-xl">
          <div class="bg-green-800 h-[calc(100%-15px)] mt-[-12px] rounded-b-xl rounded-t-md text-white font-poppins p-4">
              STORAGE
          </div>
      </div>-->
      
</nav>
</template>
<script>

import { faArchive, faPeopleGroup, faFolderPlus,faFileArrowUp, faPlus } from '@fortawesome/free-solid-svg-icons';
import { faFolder,faFile, faStar, } from '@fortawesome/free-regular-svg-icons';
import CreateFolderModal from './CreateFolderModal.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { faChevronRight} from '@fortawesome/free-solid-svg-icons';
import CreateAreaModal from '../Admin/CreateAreaModal.vue';
import {ref} from 'vue';
export default{
  name: "Navigation",
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