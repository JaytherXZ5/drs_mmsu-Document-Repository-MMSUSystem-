<template>
    <div class="flex flex-wrap w-full justify-center items-center pt-56">
       <div class="flex flex-wrap max-w-xl">
           <div class="p-2 text-2xl text-gray-800 font-montserrat"><h1>LOGIN TO YOUR ACCOUNT</h1></div>
            <div class="p-2 pt-0 mt-4  w-full">
            
                <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none px-4 py-2" placeholder="Email or Username" type="" v-model="form.login">
            </div>
            <div class="p-2 pt-0 mt-4 w-full">
                <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none  text-base px-4 py-2" placeholder="Password" type="password" v-model="form.password" name="password">
            </div>
           <div class="p-2 w-full mt-4">
               <button @click.prevent="loginUser" type="submit" class="content-shadow flex text-white bg-green-800  border-2 py-2 px-8 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Login</button>
           </div>
       </div> 
   </div>
</template>
<script >
import axios from 'axios';
import { ref } from 'vue';



export default {
   data(){
       return{
            user:null,
            is_admin:false,

           form:{
               login: '',
               password: ''
           },
           errors: []
       }
   },
   methods:{

       async loginUser(){
           await axios.post('/api/login', this.form).then(() =>{
            
                
                    this.$router.push({name: 'AuthenticatedLayout'});
             
            }).catch((error) =>{
                this.errors = error.response.data.errors;
           });
           
        }
   },
   mounted() {
        
   },
}
</script>