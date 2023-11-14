<template>
    <div class="fixed bg-green-800 border-green-800 border-y-[30px] border-x-[15px] w-screen h-screen rounded-lg ">
       <div class=" bg-gray-100 w-full h-full relative rounded-2xl border-x-4 border-x-gray-700 rounded-t-xl rounded-b-xl">
        
        <div class="flex-1 gap-2  h-20 flex flex-row items-center p-2 pt-4 border-b-2  " >
            <div class="flex flex-row items-center gap-2 w-full h-full border-2 rounded-2xl ">
                <img class="h-full" src="../../images/mmsu-logo.png" alt="">
                <h1 class="font-serif text-lg text-gray-600"> MARIANO MARCOS STATE UNIVERSITY</h1>
            </div>
            <div class="flex items-center px-2 w-[150%] h-full ">
                <SearchForm></SearchForm>
            </div>
            <div class="border-2 w-full h-full gap-2 p-1 flex flex-row items-center truncate rounded-xl">
                <Profile></Profile>
            </div>
        </div>
        <div v-if="isAdmin" class="w-full h-[87%]">
            <div class="flex-1 w-[78%] h-full p-4 flex-row flex gap-6">
                <AdminNavigation></AdminNavigation>
                 <div v-if="isAreasRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Area>
                        <template v-slot="areas">                                
                        </template>
                    </Area>
                </div>
                <div class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Area>
                        <template v-slot="areas">                                
                        </template>
                    </Area>
                </div>
            </div>
        </div>
        <div v-if="isRegular" class="w-full h-[87%]">
            <div class="flex-1 w-[78%] h-full p-4 flex-row flex gap-6">
                <Navigation></Navigation>
                 <div v-if="isArchivesRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Archive></Archive>
                </div>
                <div v-if="isMyFilesRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    
                       <MyFiles>
                        <template v-slot="my_files">                                
                        </template>
                       </MyFiles> 
                    
                </div>
               
            </div>
        </div>
        
        
        

       </div> 
    </div>
    
</template>
<script>

import SearchForm from '../Components/SearchForm.vue';
import Profile from '../Components/Profile.vue';
import axios from 'axios';
import MyFiles from '../Components/MyFiles.vue';
import Archive from '../Components/Archive.vue';
import Navigation from '../Components/Navigation.vue';
import Admin from '../Admin/Admin.vue';
import AdminNavigation from '../Components/AdminNavigation.vue';
import Area from '../Admin/Area.vue';
axios.defaults.withCredentials = true;

export default{
    name: 'AuthenticatedLayout',
    components:{
    Navigation, SearchForm, Profile, MyFiles, Archive, Admin,
    AdminNavigation, Area
},
    data(){
        return {
            isVisible: true, 
            isAdmin: false,
            isRegular: false
        }
    },
    
    methods:{
        
        
    },
    computed:{
        isMyFilesRoute(){
            return this.$route.path === '/user';
        },
        
        isArchivesRoute(){
            return this.$route.path === '/user/archive';
        },
        isAreasRoute(){
            return this.$route.path === '/areas';
        }

    },
    mounted(){
        axios.get('/api/user').then((res)=>{
            axios.get('/api/isAdmin').then((resp)=>{
                if(resp.data.message == 'admin'){
                    return this.isAdmin = true;
                }else{
                    return this.isRegular = true;
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

<!--<template>
    <MyFiles>
        <template v-slot:default="slotProps">
            {{ slotProps.name }}
        </template>
    </MyFiles>
    <div>
        AuthenticatedLayout
    </div>
</template>
<script>
/*import MyFiles from '../Components/MyFiles.vue';
export default {
    name:'AuthenticatedLayout',
    data(){
        return{}
    },
    components:{
        MyFiles
    },
}*/
</script>-->
