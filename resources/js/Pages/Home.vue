<template>


<div class="bg-gray-100 rounded-t-3xl flex-1 gap-2  h-20 flex flex-row items-center p-2 pt-4 border-b-2 shadow-b " >
            <div class="flex flex-row items-center gap-2 w-full h-full rounded-2xl ml-10 ">
                <img class="h-full" src="../../images/mmsu-logo.png" alt="">
                <h1 class="font-serif w-[500px] text-xl text-gray-600"> MARIANO MARCOS STATE UNIVERSITY</h1>
            </div>
            <div class="flex items-center px-2 w-[150%] h-full ">
                <SearchForm></SearchForm>
            </div>
            <div class=" w-full h-full gap-2 p-1 flex flex-row items-center truncate rounded-xl">

            </div>
        </div>
           
          <div class="container flex flex-row">
              
              <div class="folder">
                  <div class="folder-inside text-end pr-10">
                    
                      <router-link class="border px-4 rounded-md border-lime-600 bg-lime-600 text-white hover:text-lime-700 hover:bg-white transition-transform duration-500 hover:scale-150" to="/login" exact>LOGIN HERE</router-link><br><br>
                      <router-link class="border px-4 rounded-md border-lime-600 bg-lime-600 text-white hover:text-lime-700 hover:bg-white transition-transform duration-500 hover:scale-150" to="/register" exact>REGISTER HERE</router-link>
                  </div> 
                          <div class="folder-inside-inner text-center absolute flex items-start pt-1 pl-2 gap-2">
                                <img class="h-10 place-items-start flex flex-row border-white" src="..//..//images/mmsu-logo.png" alt="" srcset=""> 
                                <h1 class="font-serif mt-2 text-lg">MARIANO MARCOS STATE UNIVERSITY</h1>
                                
                            </div>
                            
              </div>
            <div class="">

            <div class=" absolute top-[300px] left-[800px] h-[300px] bg-gray-100 rounded-lg w-[500px]">
                <div class="w-full h-full  ">
                    <div class="border text-container p-5">
                        <h1 class=" text-[30px] font-montserrat text-lime-700 typewrite ">
                             Document Repository System
                        </h1>
                    </div>

                    <div class="border-2 mx-10 mr-10"></div>
                    <div class="border-2 ml-10 mr-12 mt-6"></div>
                    <div class="border-2 ml-10 mr-14 mt-6"></div>
                    <div class="border-2 ml-10 mr-16 mt-6"></div>
                    <div class="border-2 ml-10 mr-20 mt-6"></div>
                    <div class=" ml-10 mr-24 mt-6">
                        
                        <button @click="login" type="submit" class="content-shadow flex text-white bg-green-800  border-2 py-2 px-8 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Login</button>
                    </div>
                </div>
            </div>
          </div>
            
          </div>
          <div class="flex flex-col font-serif justify-center text-center text-9xl">
            
          </div> 


    
</template>

<script>

import axios from 'axios';

export default {
    components:{
       
    },
    methods:{
        login(){
            this.$router.push({name:'Login'})
        }
    }
}

</script>
<style>


 .folder{
    -webkit-perspective: 500px;
    perspective: 500px;
    width: 800px;
    height: 285px;
    background: #ffd480 ;
    position: absolute;
    top: 25%;
    left: 10%;
    -webkit-transform: translate(-50% -50%);
    transform: translate(-50% -50%);
    border-top-right-radius: 5px;
    cursor: pointer;
    -webkit-transition: all 300ms ease;
    transition: all 300ms ease;
    }
    /* this is for the folder's tab*/
  
    .folder::before{
    width: 300px;
    height: 20px;
    content: '';
    background: #ffd480 ;
    position: absolute;
    top: -20px;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
  }
  
  /*foldes front flap*/
  
  .folder::after{
    width: 800px;
    height: 500px;
    content: '';
    background: #ffcb66 ;
    position: absolute;
    top: 30px;
    box-shadow: 0 0 20px 2px rgba(0,0,0,0.3);
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
  

  
    -webkit-transform: rotateX(-10deg);
    transform: rotateX(-10deg);
    -webkit-transition: all 400ms ease;
    transition: all 400ms ease;
  }
  
  .folder-inside{
    width: 520px;
    height: 300px;
    background: #ffffff ;
    position: absolute;
    top: 5%;
    left: 10%;
    box-shadow: 0 0 5px 5px rgba(0,0,0,0.05);
    
    border: 1px solid #ddd;
    -webkit-transition: all 200ms ease;
    transition: all 200ms ease;
  }

  .folder-inside::after{
    width: 720px;
    height: 300px;
    background: #ffffff ;
    position: absolute;
    top: 10%;
    left: 10%;
    box-shadow: 0 0 5px 5px rgba(0,0,0,0.05);
    -webkit-transform: rotate(-1deg);
    transform: rotate(-1deg);
    border: 1px solid #ddd;
    -webkit-transition: all 200ms ease;
    transition: all 200ms ease;
  }


 
  .folder-inside::before{
    content: '';
 
     background: -webkit-repeating-linear-gradient(90deg, #ffffff, #ffffff 20px, #333333 20px, #333333 40px);
      position: absolute;
      top: -40px;
      left: 65px;
      width: 200px;
      height: 290px;
      color: #343434;
      font-size: 60px;
      line-height: 150px;
      -webkit-transform: rotate(-90deg);
      transform: rotate(-90deg);
      opacity: 0.15;
  } 
  
  .folder-inside-inner {
    width: 480px;
    height: 200px;
    background: #ffffff;
    position: absolute;
    top: 4%;
    left: 40%;
    box-shadow: 0 0 5px 5px rgba(0, 0, 0, 0.05);
    
    border: 1px solid #ddd;
    transition: all 200ms ease;
  }
  

  
  .folder:hover{
    -webkit-transform: translate(-50% -52%);
    transform:  translate(-50% -52%);
  }
  .folder:hover::after{
    -webkit-transform: rotateX(-15deg);
    transform: rotateX(-15deg);
  }
  .folder:hover .folder-inside{
    -webkit-transform: rotate(-7deg) translateY(-15%);
    transform: rotate(-7deg) translateY(-15%);
  }
  .folder:hover .folder-inside-inner{
    -webkit-transform: translateY(-15%);
    transform: translateY(-15%);
  }

  
  .footer{
      position: fixed;
      left: 0;
      bottom: 0;
      width: 100%;
      background-color: green ;
      color: #ffffff;
      text-align: center;
      padding: 0px;
   }

</style>