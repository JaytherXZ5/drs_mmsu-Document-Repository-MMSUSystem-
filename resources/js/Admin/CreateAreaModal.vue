<template>
    <div :class="{'hidden': !area_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-10 bg-opacity-30 flex justify-center items-start p-20': area_modalActive}">
        <div class="bg-white w-[50%] h-[75%] rounded-lg ">
                <transition
                enter-active-class="transition duration-100 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="area_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="area_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-poppins text- text-green-800 ">Create Area</h1>
                                <input v-model="this.form.area_name" type="text" placeholder="Area Name" class="pl-4 mt-6 ring-1 ring-green-700 h-10 rounded-lg border border-violet-400 outline-none " required>
                                
                                <textarea v-model="this.form.area_description" cols="30" rows="10" class="p-2 mt-4 rounded-lg outline-none border-2 ring" ></textarea>
                            </div>
                            
                            <div class="px-4 flex w-full justify-end mt-3 ">
                                <button @click="createArea" type="button" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Create</button>
                                <button @click="close" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Cancel</button>
                                
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
    data(){
        return{
            form:{
                areas: [],
                area_name: '',
                area_description: '',
                newAreaStatus: false,
                totalAreasCount: 0,
            }
        }
    },
    methods:{
        async createArea(){
            
            const response = await axios.post('/api/create_area', {
            area_name: this.form.area_name,
            area_order: this.form.totalAreasCount + 1, // Add 1 to the total number of areas
            area_description: this.form.area_description,
            
            });
            window.location.reload();
            
        },
        async fetchTotalAreasCount() {
            const response = await axios.get('/api/areas/total-count');
            this.form.totalAreasCount = response.data.total_areas_count;
        },
        
    },
    async mounted(){
        await this.fetchTotalAreasCount();
        
    },
    props: ["area_modalActive"],
    setup(props, {emit}){
        const close = () =>{
            emit('close');
        };
        return {close}
    },

    components:{
        
    },
    computed:{
        faCircleXmark(){return faCircleXmark;},
    }
}
</script>
<style scoped>

</style>