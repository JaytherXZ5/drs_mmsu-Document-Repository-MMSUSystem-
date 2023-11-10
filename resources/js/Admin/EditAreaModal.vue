<template>
    <div :class="{'hidden': !showModal, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-10 bg-opacity-30 flex justify-center items-start p-20': showModal}">
        <div class="bg-white w-[50%] h-[75%] rounded-lg ">
                <transition
                enter-active-class="transition duration-100 ease-out"
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
                            <form @submit.prevent="updateArea">
                                <div class="modal-content flex flex-col px-4">
                                    <h1 class="px-2 pt-6 font-poppins text- text-green-800 ">Create Area</h1>
                                    
                                        <input v-model="editedAreaName" type="text" placeholder="Area Name" class="pl-4 mt-6 ring-1 ring-green-700 h-10 rounded-lg border border-violet-400 outline-none " required>
                                        <textarea v-model="editedAreaDescription" cols="30" rows="10" class="p-2 mt-4 rounded-lg outline-none border-2 ring" ></textarea>
                                    
                                </div>
                                
                                <div class="px-4 flex w-full justify-end mt-3 ">
                                    <button type="submit" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Update</button>
                                    <button @click="closeModal" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                    
                                </div>
                            </form>
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
        area: Object,
        showModal:Boolean, 
    
    },
    data(){
        return{
           editedAreaName: '',
           editedAreaDescription:'',
        };
    },
    watch:{
        showModal(value){
            if(value){
                this.editedAreaName = this.area.area_name;
                this.editedAreaDescription = this.area.area_description;
            }
        }
    },
    methods:{
       updateArea(){
        this.$emit('update-area', {
            id: this.area.id,
            area_name: this.editedAreaName,
            area_description:this.editedAreaDescription
        })

        window.location.reload();
       },

       closeModal(){
        this.$emit('close-modal');
       }


    },

    mounted(){
       
        
    },
    

    components:{
        
    },
    computed:{
      
    }
}
</script>
<style scoped>

</style>