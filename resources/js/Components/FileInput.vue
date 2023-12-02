<template>
    <div>
        <div class="flex flex-row">
            <input :value="getFilesName()" type="text" readonly class="shadow-lg border h-10 border-gray-300 rounded px-2 w-[40%] focus:outline-green-600 placeholder:text-gray-400" placeholder="Choose Files">
            <span>
                <button  @click="showFilePicker" class="h-full border-green-600 border flex flex-row items-center rounded justify-center "><font-awesome-icon :icon="faPaperclip" class=" text-green-800 h-6 w-6 px-2 hover:rotate-90 transition-transform duration-300"/>
                </button>           
            </span>
        </div>
        <input type="file" ref="file" class="hidden" @change="onChange" multiple>

    </div>
</template>
<script>
import { faPaperclip } from '@fortawesome/free-solid-svg-icons';
export default {
    data(){
        return{
            files: [],
        }
    },
    methods:{
        showFilePicker(){
            this.$refs.file.click();
        },
        onChange(event){
            this.files = event.target.files;
            this.$emit('file-change', this.files);
            
        },
        getFilesName(){
            let filesName =[]
            if(this.files.length > 0){
                for(let file of this.files){
                    filesName.push(file.name)
                }
            }

            return filesName.join(", ");
        }
    },
    computed:{
        faPaperclip(){return faPaperclip;},
    },
}
</script>
