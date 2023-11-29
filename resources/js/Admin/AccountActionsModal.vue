<template>
    <div :class="{'hidden': !showModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': showModal}">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="showModal" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="showModal" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div v-if="showModal" class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-montserrat text-xl text-violet-800 ">Proceed to Delete Account?</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-md text-green-800 border-b">Name: {{ this.user.name}}</h1>
                                <h1 class="px-2 pt-1 font-montserrat text-md text-green-800 border-b ">User Name: {{this.user.username }}</h1>
                            </div>
                            <div v-if="showModal" class="px-4 flex w-full justify-end mt-3">
                                <button @click="deleteUser(this.user.id)" type="button" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Delete</button>
                                <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                            </div>
                            
                        </div>
                    </transition>
                </div>
            </transition>
        </div>
    </div>
   
</template>

<script>

import {faCircleXmark} from '@fortawesome/free-regular-svg-icons'
import axios from 'axios';
import Swal from 'sweetalert2';

export default{
    props:{
        user: Object,
        showModal: Boolean,
    },
    data(){
        return{
           
        }
    },

    
    methods:{
        async deleteUser(userId){
            const response = await axios.delete(`/api/delete-user/${userId}`);
            this.closeModal();
            window.location.reload();
        },

        getUserOffice(user){
         if(user.admin_office_id !==0){
            return user.admin_office.name;
         }else if(user.psv_area_id !==0){
            return user.psv_area.area_name;
         }else if(user.degree_id !==0){
            return user.degree.abbr;
         }else if(user.institution_id !==0){
            return user.institution.name;
         }else if(user.isAdmin){
          return "---"
         }
     },
     closeModal(){
        this.$emit('close-modal');
       },
    

        
    },
    

    components:{
        
        
    },
    computed:{
        faCircleXmark(){return faCircleXmark;},
    },
    mounted(){
        
    }
}
</script>
<style>

</style>
