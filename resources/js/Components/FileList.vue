<template>
    <div class="px-2">
        <div class="file-item mt-0 flex" v-for="file in files" >
            <div class="mt-0 w-[52px] h-[67px]">
                <img :src="`../../images/${file.type}.svg`" alt="" srcset="">

            </div>
            <div class="pt-2 px-2 w-[calc(100%-80px)]">
                <p>{{ file.name + "."+file.type }}</p>
            </div>

        </div>
        <div class="p-2 w-[20px] h-[67px]">

        </div>
    </div>
</template>
<script>
export default{
    
}
</script>