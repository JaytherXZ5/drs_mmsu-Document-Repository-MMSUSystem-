<template>
    <div class="fixed bg-green-800 border-green-800 border-y-[20px] border-x-[10px] w-screen h-screen rounded-lg ">
       <div class=" bg-mmsu-light-gray w-full h-full relative rounded-xl">

        <div class="h-full bg-white flex w-full gap-4 rounded-xl">
            <Navigation />
             <main class="flex-1 flex flex-col overflow-hidden w-full">
                
                <div class="flex items-center justify-start w-full ">
                    <SearchForm/>
                    <Profile/>
                </div>
                <div class="flex-1 flex flex-col overflow-hidden">
                    <MyFiles/>
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
import axios from 'axios';
import FileList from '../Components/FileList.vue';
axios.defaults.withCredentials = true;

export default{
    components:{
    Navigation, SearchForm, Profile,
    MyFiles,FileList
    },
    data(){
        return      
    },
    mounted(){
        axios.get('/api/user').then((res)=>{
        axios.get('/api/check-token')
        .then(response => {
                    
                    console.log(response.data.message);
                    axios.get('/api/isAdmin').then((resp)=>{
                if(resp.data.message == 'admin'){
                    this.$router.push({name: 'Admin'});
                }else{
                    this.$router.push({name: 'AuthenticatedLayout'});
                }
             })
                
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