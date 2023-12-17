<template>
    <form class="flex items-center px-2 w-[150%] h-full">
        <input class="focus:outline-none font-montserrat  border-gray-200 border bg-gray-100 h-[80%] px-4 text-gray-600 rounded-2xl w-full shadow-inset" type="text">
        <div class="absolute xl:left-[990px] xl:top-7 lg:left-[670px]">
            <lord-icon
                src="https://cdn.lordicon.com/kkvxgpti.json"
                trigger="loop"
                delay="3000"
                state="in-search"
                colors="primary:#0a5c15"
                style="width:30px;height:30px">
            </lord-icon>
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