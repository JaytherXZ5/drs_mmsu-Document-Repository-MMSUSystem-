<template>
    <form class="w-[calc(100%-455px)] h-[60px] flex items-center ">
        <div class="flex w-full h-full items-center">
            <input class=" border-2 border-white text-center font-mono outline-green-600 pl-5 ml-1 w-[calc(100%+500px)] rounded-3xl custom-shadow bg-mmsu-light-gray h-10 placeholder:text-[15px] placeholder:font-semibold placeholder:text-gray-500" placeholder="Search Files and Folders"  type="text">
            <font-awesome-icon :icon="faMagnifyingGlass" class="h-[20px] ml-[-40px] text-green-700"/>
        </div>
        
    </form>
</template>
<script>

import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';

export default{
    components:{

    },
    computed:{
        faMagnifyingGlass(){
            return faMagnifyingGlass;
        }
    }
}
</script>