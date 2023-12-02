<template>
    <div :class="{'hidden': !modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': modalActive}">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-poppins text- text-green-800 ">Create New Folder</h1>
                                
                                <input v-model="formData.name" type="text" placeholder="Folder Name" class="pl-4 mt-8 ring-1 ring-green-700 h-10 rounded-lg border border-violet-400 " required>
                            </div>
                            <div class="px-4 flex w-full justify-end mt-3">
                                
                                <button @click="createFolder" type="button" class="border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Create</button>
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
            formData:{
                name: "",
                degree_id:null,
                institution_id:null,
            },

            user:""
        }
    },
    methods:{

       
        async createFolder(){
            try { 
            const {data} = await axios.post('/folder/create', this.formData);
            if(data){
                
                
            }
            window.location.reload();
        } catch (error) {
            console.log(error)
            Swal.fire(error?.response?.data?.message);
        }
        }
        
    },
    props: ["modalActive"],
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
    },
    mounted(){
        axios.get('/api/user').then((res)=>{
            this.user = res.data
            this.formData.degree_id = res.data.degree_id;
            this.formData.institution_id = res.data.institution_id;

        }).catch((error)=>{
            error.response.status
        })
    }
}
</script>
<style scoped>

</style>