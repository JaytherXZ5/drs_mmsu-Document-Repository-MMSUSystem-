<template>

    

  <div>
      Dashboard <br>
      <div v-if="user">
      Name: {{user.name}} <br>
      Email: {{user.email}}<br><br>
      <button @click.prevent="logout">Logout</button>
      </div>

  </div>
</template>
<script>

import axios from 'axios'
axios.defaults.withCredentials = true;
export default {
  data(){
      return{
          user: ""
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
                    
                    console.log(response.data.message);
                    axios.get('/api/isAdmin').then((resp)=>{
                if(resp.data.message == 'admin'){
                    this.$router.push({name: 'Admin'});
                }else{
                    this.$router.push({name: 'Dashboard'});
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