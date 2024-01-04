<template>
    <div class="background " >
    <div class="bg-gray-100  flex-1 gap-2  h-20 flex flex-row items-center  border-b-2 shadow-b " >
            <div class="flex flex-row items-center gap-2 w-full h-full rounded-2xl ml-10 ">
                <img class="h-[70%]" src="../../images/mmsu-logo.png" alt="">
                <h1 class="font-serif w-[500px] text-xl text-gray-600"> MARIANO MARCOS STATE UNIVERSITY</h1>
            </div>
            <div class="flex items-center px-2 w-[150%] h-full ">
                
            </div>
            <div class=" w-full h-full gap-2 p-1 flex flex-row items-center truncate rounded-xl">
                <h1 class="font-serif w-[500px] text-xl text-gray-600">DOCUMENT REPOSITORY SYSTEM</h1>
            </div>
        </div>
    <div class="absolute top-[250px] left-[450px] z-10 bg-gray-100 rounded-lg border-t-[3px] py-5 border-b-[3px] border-r-[3px] border-green-600 shadow-lg ">
       <div class="flex flex-wrap max-w-xl h-full px-10 py-[10px] ">
        <div class="border ml-2"></div>
           <div class="p-1 text-container typewrite text-2xl font-montserrat border text-lime-700">
                <h1 class="text-login">LOGIN TO YOUR ACCOUNT</h1></div>
            <div class="p-2 pt-0 mt-4  w-full">
            
                <input @keyup.enter="handleEnterKey" class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none px-4 py-2" placeholder="Email or Username" type="" v-model="form.login" required>
            </div>
            <div class="p-2 pt-0  w-full">
                <input @keyup.enter="handleEnterKey" class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none  text-base px-4 py-2" placeholder="Password" type="password" required v-model="form.password" name="password">
            </div>
           <div class="p-2 w-full ">
               <button @click.prevent="loginUser" type="submit" class="cursor-pointer content-shadow flex text-white bg-green-800  border-2 py-2 px-8 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Login</button>
           </div>
           <div v-if="error" class="notification absolute z-10 top-[100px] left-[100px] bg-gray-100 rounded-lg w-[500px] h-20 shadow-lg">
              <div class="icon-container gap-5 flex w-full h-full flex-row px-6 items-center" >
                <lord-icon
                  src="https://cdn.lordicon.com/keaiyjcx.json"
                  trigger="in"
                  delay="100"
                  state="in-error"
                  colors="primary:#ff0000"
                  style="width: 50px; height: 50px;"
                ></lord-icon>
                <h1 class="font-montserrat text-green-700">{{ error }}</h1>
              </div>
            </div>
       </div> 
   </div>
   
    <div class="container flex flex-row">
                
                <div class="folder">
                    <div class="folder-inside text-end pr-10">
                        

                    </div> 
                            <div class="folder-inside-inner text-center absolute flex items-start pt-1 pl-2 gap-2">
                                    <img class="h-10 place-items-start flex flex-row border-white" src="..//..//images/mmsu-logo.png" alt="" srcset=""> 
                                    <h1 class="font-serif mt-2 text-lg">MARIANO MARCOS STATE UNIVERSITY</h1>
                                    
                                </div>
                                
                </div>

  
            </div>

        </div>
        
</template>

<style>


      .background {
    background-image: url('../../images/MMSU_facade.jpg'); 
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    width: 100%;
    height: 100vh;

    }


    .text-container {display: inline-block;}

    .text-login{
        font-size: 1.4em;
        letter-spacing: 1px;
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        border-right: 5px solid;
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        animation:
            typing 3s steps(21),
            cursor .4s step-end infinite alternate;
    }

    @keyframes cursor{
        50% {border-color:transparent}
    }
    @keyframes typing{
        from {width:0}
    }

</style>

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
           errors: [],
           error:''
       }
   },
   methods:{
    showNotification(message) {
        this.error = message;
        setTimeout(() => {
          this.error = '';
        }, 1000); 
      },
    handleEnterKey() {
      
      this.loginUser();
    },
       async loginUser(){

           await axios.post('/api/login', this.form).then((res) =>{
                    this.$router.push({name: 'AuthenticatedLayout'});
             
            }).catch((error) =>{

                this.showNotification(error.response.data.message)
           });
           
        }
   },
   mounted() {
        
   },
}
</script>