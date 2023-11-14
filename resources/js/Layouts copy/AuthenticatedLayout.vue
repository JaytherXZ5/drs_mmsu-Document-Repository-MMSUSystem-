<template>
    <div class="fixed bg-green-800 border-green-800 border-y-[20px] border-x-[10px] w-screen h-screen rounded-lg ">
       <div class=" bg-mmsu-light-gray w-full h-full relative rounded-xl">

        <div v-if="isAdmin" class="h-full bg-white flex w-full gap-4 rounded-xl" >
            
            <AdminNavigation />
             <main class="flex-1 flex flex-col overflow-hidden w-full">
                
                <div class="flex items-center justify-start w-full mt-2  ">
                    <SearchForm/>
                    <Profile/>
                </div>
                <div v-if="isUsersRoute"  class="flex-1 w-[calc(100%-100px)]  h-[100%] mt-6 flex flex-col overflow-hidden">
                    
                    <MyFiles >
                        <template v-slot="my_files">                                
                        </template>
                    </MyFiles>
                </div>
                <div v-if="isAdminAreasRoute" class="flex-1 w-[calc(100%-100px)]  h-[100%] mt-6 flex flex-col overflow-hidden">
                    <Area >
                        <template v-slot="areas">                                
                        </template>
                    </Area>
                </div>
                

                <div>

                </div>
            </main>
        </div>
       
        <div v-else class="h-full bg-white flex w-full gap-4 rounded-xl">
            <Navigation />
             <main class="flex-1 flex flex-col overflow-hidden w-full">
                <div class="flex items-center justify-start w-full ">
                    <SearchForm/>
                    <Profile/>
                </div>
                <div class="flex-1 w-[calc(100%-100px)] h-[100%] mt-6 flex flex-col overflow-hidden">
                    <!--<MyFiles>
                        <template v-slot:default="slotProps">
                            {{ slotProps.name }}
                        </template>
                    </MyFiles>-->
                    <MyFiles>
                        <template v-slot="my_files">                                
                        </template>
                    </MyFiles>
                </div>
                <div>

                </div>
            </main>
        </div>

        

       </div> 
    </div>
    
</template>
<script>
import Navigation from '../Components/Navigation.vue';
import SearchForm from '../Components/SearchForm.vue';
import Profile from '../Components/Profile.vue';
import MyFiles from '../Components/MyFiles.vue';
import AdminNavigation from '../Components/AdminNavigation.vue';
import axios from 'axios';
import Area from '../Admin/Area.vue';
axios.defaults.withCredentials = true;

export default{
    name: 'AuthenticatedLayout',
    components:{
    Navigation, SearchForm, Profile, MyFiles, AdminNavigation,Area
    },
    data(){
        return {
            isVisible: true, 
            isAdmin: false     
        }
    },
    
    methods:{
        
        
    },
    computed:{
        isAdminAreasRoute() {
        return this.$route.path === '/areas';
    },
        isUsersRoute() {
            return this.$route.path === '/user';
        }
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
