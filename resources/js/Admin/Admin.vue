<template>
    
        
        
            <div class="flex-1 w-[78%] h-full p-4 flex-row flex gap-6">
                <AdminNavigation></AdminNavigation>
                <div v-if="isAreasRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Area></Area>
                </div>
                <div v-if="isAccountsRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                </div>
                
            </div>
        
        
        
        

     
    
</template>
<script>

import AdminNavigation from '../Components/AdminNavigation.vue';
import axios from 'axios';

import Area from '../Admin/Area.vue'
axios.defaults.withCredentials = true;

export default{
    name: 'Admin',
    components:{
     AdminNavigation,Area
    },
    data(){
       
    },
    
    methods:{
        
        
    },
    computed:{
        
       
        

    },
    mounted(){
        axios.get('/api/user').then((res)=>{
            axios.get('/api/isAdmin').then((resp)=>{
                if(resp.data.message == 'admin'){
                    return this.isAdmin = true;
                    
                }else{
                    this.$router.push({name: 'AuthenticatedLayout'});
                }
             })
        axios.get('/api/check-token')
        .then(response => {
                console.log(response.data.message);
                })
                .catch(error => {
                    // Token does not exist
                    console.error(error.response.data.message);
                    // Redirect to a login or unauthorized page using Vue Router
                    this.$router.push({ name: "Login"}); // Change this route to your desired route
                });
          this.user = res.data
      }).catch((error)=>{
        
        if(error.response.status==401){
            this.$router.push({ name: "Login"});
        }
      });
    }
    
}

</script>

