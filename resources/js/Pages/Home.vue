<template>
    <div></div>
    <div class = "flex bg-gray-100 border-b border-gray-300 py-4">
        <div class="container mx-auto flex justify-between px-5">
            <div class="flex">
                <router-link class="mr-4" to='/' exact>Home</router-link>
                <router-link to='about'></router-link>
            </div>
           <div class="flex">
                <router-link class="mr-4" to="/login" exact>Login</router-link>
                <router-link to='/register'>Register</router-link>
        </div>
        </div>
        
    </div>

    <div>
        My DRS
    </div>
</template>
<script>
import axios from 'axios';

export default {
    components:{
       
    }
}
</script>
<style lang="">
    
</style>