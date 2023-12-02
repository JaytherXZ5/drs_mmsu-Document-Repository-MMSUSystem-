<template>
    <div :class="{'hidden': !upload_modalActive, 'absolute w-screen h-screen top-0 left-0 bg-gray-900 z-50 bg-opacity-30 flex justify-center items-start p-40': upload_modalActive}">
        <div class="bg-white w-[50%] h-[45%] rounded-lg z-50">
                <transition
                enter-active-class="transition duration-500 ease-out"
                enter-from-class="transform scale-95 opacity-0"
                enter-to-class="transform scale-100 opacity-100"
                leave-active-class="transition duration-75 ease-in"
                leave-from-class="transform scale-100 opacity-100"
                leave-to-class="transform scale-95 opacity-0"
                >
                <div v-show="upload_modalActive" class="modal" >
                    <transition name="modal-animation-inner">
                        <div v-show="upload_modalActive" class="modal-inner">
                            <!--<font-awesome-icon :icon="faCircleXmark" @click="close" class=""/>-->
                            <slot/> 
                            <div class="modal-content flex flex-col px-4">
                                <h1 class="px-2 pt-6 font-poppins text- text-green-800 ">Upload a File</h1>
                                
                                <input type="file" @change="handleFileChange" ref="uploadFile">
                               
                                <div @click="openDialog" class="">

                                </div>
                            </div>
                            
                            <div class="px-4 flex w-full justify-end mt-3">
                                
                                <button @click="uploadFile()" type="submit" class="ml-2 border-2 w-20 h-10 rounded-lg bg-violet-500 shadow-left-side text-white hover:scale-110  transition-transform duration-300">Done</button>
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
            
            folder_id:null,
            selectedFile:null,
            files:[],
        }
    },
    
    methods:{
        toFiles(){
            this.$router.push({name: 'FileList'});
        },
        async fetchFiles(folderId) {
        try {
            const response = await axios.get(`/api/folder/${folderId}/files`);
            this.files = response.data.files;

        } catch (error) {
            console.error('Error fetching folders:', error);
        }
      },
        
        handleFileChange(event){
            this.selectedFile = event.target.files[0];
        },
        openDialog(){
            const elem = this.$refs.uploadFile;
            elem.click();
        },
       async uploadFile(){
            const formData = new FormData();
            formData.append('file', this.selectedFile);
            this.fetchFiles(this.$route.params.id);
            try {
                const {data} = await axios.post(`/api/file/upload/${this.$route.params.id}`, formData)
                this.close();
            } catch (error) {
                console.log(error);
                Swal.fire(error?.response?.data?.message);
            }
        }
        
    },
    props: ["upload_modalActive"],
    setup(props, {emit}){
        const close = () =>{

            emit('close');
            window.location.reload()
        };
        return {close}
    },
    components:{
        
    },
   
    computed:{
        
    },
    mounted(){
        
        
       
    }
}
</script>
<style scoped>

</style>