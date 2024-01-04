<template>
    <div class="fixed bg-green-600 border-green-600  border-y-[10px] border-x-[15px] w-screen h-screen ">
       <div class=" bg-gray-50 shadow w-full h-full relative rounded-xl  ">
        
        <div class="bg-gray-100 rounded-t-3xl flex-1 gap-2  h-20 flex flex-row items-center p-2 pt-4 border-b-2  " >
            <div class="flex flex-row items-center gap-2 border w-full h-full rounded-2xl ">
                <img class="h-full" src="../../images/mmsu-logo.png" alt="">
                <h1 class="font-serif text-lg text-gray-600"> MARIANO MARCOS STATE UNIVERSITY</h1>
            </div>
            <div class="flex items-center px-2 w-[150%] h-full ">
                <SearchForm></SearchForm>
            </div>
            <div class=" border-2 w-full h-full gap-2 p-1 flex flex-row items-center truncate rounded-xl">
                <Profile></Profile>
            </div>
        </div>
        <div v-if="isAdmin" class="w-full h-[87%] ">
            <div class="flex-1 w-[78%] h-full p-4 flex-row flex gap-6">
                <AdminNavigation></AdminNavigation>
                <div v-if="isAccountsRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Accounts>
                        <template v-slot="accounts">                                
                        </template>
                    </Accounts>
                </div>

                 <div v-if="isAreasRoute"  class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Area>
                        <template v-slot="areas">                                
                        </template>
                    </Area>
                </div>
                <div v-if="isRegisterRoute"  class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    <Register>
                        <template v-slot="register">                                
                        </template>
                    </Register>
                </div>

                <div v-if="isDefaultRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
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
                    <Archive>
                        <template v-slot="archive">                                
                        </template>
                    </Archive>
                </div>
                <div v-if="isMyFoldersRoute" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    
                       <MyFolders>
                        <template v-slot="my_files">                                
                        </template>
                       </MyFolders> 
                    
                </div>
                <div v-if="isFolderContent" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    
                    <FileList>
                     <template v-slot="file_list">                                
                     </template>
                    </FileList>
                </div>
                <div v-if="isSurveyInstrument" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    
                    <SurveyInstrument>
                     <template v-slot="surveyInstrument">                                
                     </template>
                    </SurveyInstrument>
                </div>
                <div v-if="isComplianceReport" class="bg-gray-100  border-2 flex min-w-full h-full rounded-xl p-2 content-shadow font-montserrat text-gray-600">
                    
                    <ComplianceReport>
                     <template v-slot="complianceReport">                                
                     </template>
                    </ComplianceReport>
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
import MyFolders from '../Components/MyFolders.vue';
import Archive from '../Components/Archive.vue';
import Navigation from '../Components/Navigation.vue';

import AdminNavigation from "../Admin/AdminNavigation.vue";
import Area from '../Admin/Area.vue';
import Accounts from '../Admin/Accounts.vue';
import Register from '../Admin/Register.vue';
import FileList from '../Components/FileList.vue';
import SurveyInstrument from '../Components/SurveyInstrument.vue';
import ComplianceReport from '../Components/ComplianceReport.vue';
axios.defaults.withCredentials = true;

export default{
    name: 'AuthenticatedLayout',
    components:{
    Navigation, SearchForm, Profile, MyFolders, Archive,
    AdminNavigation, Area,
    Accounts, Register,FileList,SurveyInstrument,ComplianceReport
},
    data(){
        return {
            isVisible: true, 
            isAdmin: false,
            isRegular: false,

            
            
        }
    },
    
    methods:{
        
        
    },
    computed:{
        isMyFoldersRoute(){return this.$route.path === '/user';},
        isArchivesRoute(){return this.$route.path === '/user/archive';},
        isAreasRoute(){return this.$route.path === '/areas';},
        isAccountsRoute(){return this.$route.path === '/accounts'},
        isDefaultRoute(){return this.$route.path === '/user';},
        isRegisterRoute(){return this.$route.path === '/register'},
        isFolderContent(){return this.$route.name === 'FileList' },
        isSurveyInstrument(){return this.$route.name === 'SurveyInstrument'},
        isComplianceReport(){return this.$route.name === 'ComplianceReport'}
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


