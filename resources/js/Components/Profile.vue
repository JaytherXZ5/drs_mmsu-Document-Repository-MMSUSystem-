<template>
     <div class="flex justify-center items-end ml-5 ">
            <img src="../../images/profile.png" class="w-12 custom-shadow rounded-full" alt="" srcset="">
        </div>
    <div class=" ml-3 text-right ">
       

      <Menu as="div" class="relative text-left flex flex-row">
        <div class="w-[200px] truncate">
           <h1 class="m font-poppins text-green-900 text-[16px] border-b-2">{{user.name}}</h1>
        </div>

        <div class="h-10  hover:scale-105 shadow-left-side rounded-3xl transition-transform duration-300 ">
          <MenuButton
            class="px-1 w-full flex flex-row h-full   justify-center rounded-full bg-white border-green-700 border-2 text-sm font-medium text-white hover:bg-opacity-30 focus:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75"
          >
            <img src="../../images/settings.png" class="w-8 mt-[2px]  hover:rotate-90 transition-transform duration-300 " alt="" srcset="">
            <font-awesome-icon :icon="faChevronRight" class="ml-3 mt-[6px] text-green-700 h-6"/>
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
            class="absolute right-0 mt-2 w-[150px] origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
          >
            <div class="px-1 py-1">
                <MenuItem v-slot="{ active }">
                <button  
                  :class="[
                    active ? 'bg-violet-500 text-white' : 'text-gray-900',
                    'group flex w-full items-center rounded-md px-2 py-2 text-sm ',
                  ]"
                >
                  
                  Edit Profile
                </button>
              </MenuItem>
              <MenuItem v-slot="{ active }">
                <button @click.prevent="logout"
                  :class="[
                    active ? 'bg-violet-500 text-white' : 'text-gray-900',
                    'group flex w-full items-center text-black rounded-md px-2 py-2 text-sm',
                  ]"
                >
                  
                  Logout
                </button>
              </MenuItem>

             
            </div>
           
  
            
          </MenuItems>
        </transition>
      </Menu>
    </div>
  </template>
  
  <script>
  import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
  import { faChevronRight} from '@fortawesome/free-solid-svg-icons';
  import axios from 'axios';
  axios.defaults.withCredentials = true;
  export default{
    data(){
        return{
            user: "",
        }
    },
    methods:{
        logout(){
          axios.post('/api/logout').then(()=>{
              this.$router.push({ name: "Home"})
          })
      }
    },
    mounted(){
        axios.get('/api/user').then((res)=>{
            this.user = res.data
        }).catch((error)=>{
            error.response.status
        })
    },
    components:{
        Menu, MenuButton, MenuItem, MenuItems,
    },
    computed:{
        faChevronRight(){return faChevronRight;},
    }
    
  }

  </script>
  