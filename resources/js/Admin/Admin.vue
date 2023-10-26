<template lang="">
    <div>
        Admin
        <div>
            <button class=" border-black border" @click.prevent="logout">Logout</button>
        </div>
        
    </div>
</template>

<script>
import axios from 'axios'
axios.defaults.withCredentials = true;
export default {
  data(){
      return{
          user: null
      }
  },
  methods:{
      logout(){
          axios.post('/api/logout').then(()=>{
              this.$router.push({ name: "Home"})
          })
      }
  },
  mounted(){
      axios.get('/api/user').then((res)=>{
        axios.get('/api/check-token')
  .then(response => {
            // Token exists, you can proceed with your logic
            console.log(response.data.message);
            // Continue with your desired logic for a valid token
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