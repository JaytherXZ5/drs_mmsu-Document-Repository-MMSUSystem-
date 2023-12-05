<template>
  <nav class="border-2  content-shadow h-full w-full rounded-xl min-w-[300px] bg-gray-100">
    <div class="h-20 w-full  px-3 flex items-center justify-start">
          <Menu as="div" class="relative inline-block text-left w-[60%]">
              <div class=" w-[200px]">
                
                  <MenuButton v-if="this.$route.path === '/user' || this.$route.path === `/folders/${this.$route.params.id}` " @click="" type="button" class="shadow-r outline-none items-center justify-center flex flex-row bg-gray-100 border-2 border-gray-200  h-12 rounded-xl w-[100%] transform  hover:scale-110  transition-transform duration-300">
                      <div class="w-6 h-6 rounded ring-2 ring-green-600 mr-2">
                          <font-awesome-icon :icon="faPlus" class=" text-green-800 hover:rotate-90 transition-transform duration-300"/>
                      </div>
                      <h1  class=" text-green-800 font-montserrat text-lg ">New</h1>
                    </MenuButton>
                    <div v-if="this.$route.path === '/user/archive'" class="border w-[270px] rounded h-12 flex items-center justify-center font-montserrat text-gray-700 text-xl opacity-80">
                      ARCHIVES
                    </div>
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
                  <div class="px-1 py-1 ">
                      <MenuItem v-if="this.$route.path==='/user'"  v-slot="{ active }">
                        
                      <button @click="toggleModal" class=""
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-900',
                          'group flex w-full items-center rounded-md px-2 py-2 text-sm border-b-2 border-green-700 ',
                        ]"
                      >
                      <font-awesome-icon :icon="faFolderPlus"  class="mr-2 h-4 "/>
                        New Folder
                      </button>
                    </MenuItem>
                    
                    <MenuItem v-if="this.$route.path === `/folders/${this.$route.params.id}`" v-slot="{ active }">
                      <button @click="toggleUploadModal"
                        :class="[
                          active ? 'bg-violet-500 text-white' : 'text-gray-700',
                          'group flex w-full items-center text-black rounded-md px-2 py-2 text-sm',
                        ]"
                      ><font-awesome-icon :icon="faFileArrowUp" class="mr-2 w-4 h-4"/>
                        File Upload
                      </button>
                    </MenuItem>
                   
                  </div>
                  

                  
                </MenuItems>
          </transition>
          </Menu>
          
          <CreateFolderModal @close="toggleModal" :modalActive="modalActive">
                    
        </CreateFolderModal>
        
        <UploadFileModal @close="toggleUploadModal" :upload_modalActive="upload_modalActive">

        </UploadFileModal>


   
    </div>
    
     <!--NAVIGATION-->
     <div class=" px-3 relative h-[calc(90%-80px)] rounded-b-xl">
          <div class="pl-4 bg-gray-100 flex flex-col gap-2  h-[calc(100%-15px)] rounded-t-xl rounded-b-md border-2 border-gray-300     text-white font-montserrat p-8">
             
              <!--admin areas//////////////////////////////////////////////////////////////////////////-->
              <router-link to='/user'>
              <div :class="{
                        'bg-white translate-x-4 text-green-700': this.$route.path=== '/user'  ,
                        'bg-green-700': this.$route.path !== '/user',
                      }"
                      
                      class="content-shadow bg-green-700 py-2 mt-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform   transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">FOLDERS</a>
                  
              </div>
            </router-link>
            <router-link to='/user/archive'>
              <div :class="{
                        'bg-white translate-x-4 text-green-600': this.$route.path === '/user/archive' ,
                        'bg-green-700': this.$route.path !== '/user/archive',
                      }" 
              
                class="content-shadow bg-green-700 py-2 mt-2 ring-2 ring-white hover:bg-white hover:ring-green-800 hover:text-green-800 rounded-md transform   transition-transform duration-300">
                  <a class="ml-6 pr-[56px]" href="#">ARCHIVED</a>
              </div>
            </router-link>

          </div>
      </div>
    
  </nav>
</template>
<script>

import { faArchive, faPeopleGroup, faFolderPlus,faFileArrowUp, faPlus } from '@fortawesome/free-solid-svg-icons';
import { faFolder,faFile, faStar, } from '@fortawesome/free-regular-svg-icons';
import CreateFolderModal from './CreateFolderModal.vue';
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { faChevronRight} from '@fortawesome/free-solid-svg-icons';
import UploadFileModal from './UploadFileModal.vue';
import {ref} from 'vue';
export default{

  name: "Navigation",
  
  data(){
    return{
      isFolder: false,
    }
  },
  
  components:{
      Menu, MenuButton, MenuItems, MenuItem, CreateFolderModal,UploadFileModal,
    },
  setup(){
      const modalActive = ref(false);

      const upload_modalActive = ref(false);

      const toggleModal = () =>{
          modalActive.value = !modalActive.value;
      }
      const toggleUploadModal = () =>{
          upload_modalActive.value = !upload_modalActive.value;
      }
      return {modalActive, toggleModal, upload_modalActive, toggleUploadModal}
      
  },

  mounted(){
    
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