<template>
    <slot name="register">
    <div class="flex flex-row w-full justify-start pl-6 items-center bg-gray-100">
      <div class="flex flex-col w-[55%] font-montserrat">
        <div class=" text-2xl text-gray-600 font-montserrat"><h1>REGISTER AN ACCOUNT</h1></div>
        <div class="p-2 w-full">
          
          <input class="w-full bg-gray-100 rounded-lg hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-2" placeholder="Name" type="text" v-model="form.name">
        </div>
        <div class="p-2 mt-1 mx-2 border-2 rounded-lg w-[100%-10px] ">
            
<!--User type-->
                <!--<label for="userType">Institution:</label>
                <select class=" bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none" v-model="form.institution_id" id="institution" name="institution_id" required>
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">
                        {{ institution.name }}
                    </option>
                </select>-->

            <label class="ml-4">User Type:</label>

                <select v-model="selectedUserType" @change="handleUserTypeChange(selectedUserType)" class=" bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none"  required>
                    <option v-for="user_type in userTypes"  :key="user_type.id" :value="user_type.id">
                        {{ user_type.name }}
                    </option>
                </select>

                <label class="ml-4" for="userType">User Role:</label>
                <select class="bg-gray-100 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none ml-2 rounded-lg  h-8" v-model="form.user_role_id" id="userType" name="user_role_id" required>
                    
                    <option v-for="userRole in userRoles" :key="userRole.id" :value="userRole.id">
                        {{ userRole.role }}
                    </option>
                </select>
<!--Institution-->
                <div v-if="isInstitutionalType">
                  <label class="ml-2" for="institution">Select Institution:</label>
                  <select v-model="form.institution_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">{{ institution.name }}</option>
                  </select>
                </div>

                <div v-if="isProgramType">
                  <label class="ml-2" for="institution">Select Program:</label>
                  <select v-model="form.degree_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="degree in degrees" :key="degree.id" :value="degree.id">{{ degree.degree }}</option>
                  </select>
                </div>

                
        </div>
        <div class="p-2 pt-0 mt-4  w-full">
          
          <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none px-4 py-2" placeholder="Email" type="email" v-model="form.email">
        </div>
        <div class="p-2 pt-0 mt-4  w-full">
          
          <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none px-4 py-2" placeholder="Username" type="" v-model="form.username">
        </div>
        <div class="p-2 pt-0 w-full">
          <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none  text-base px-4 py-2" placeholder="Password" type="password" v-model="form.password" name="password">
        </div>
        <div class="p-2 pt-0 w-full">
         
          <input class="w-full bg-gray-100  border-2 rounded-lg hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none text-base px-4 py-2" placeholder="Confirm Password" type="password" v-model="form.password_confirmation" name="password_confirmation">
        </div>

        <div class="p-2 w-full mt-1">
          <div v-if="errors.length" class="text-red-500">
            <ul>
              <li v-for="error in errors">{{ error }}</li>
            </ul>
          </div>
  
          <button @click.prevent="saveForm" type="submit" class="content-shadow flex text-white bg-green-800  border-2 py-2 px-8 focus:outline-none hover:bg-white hover:border-2 hover:border-green-700 hover:text-green-800 rounded-lg  text-lg">Register</button>
        </div>
      </div>

      <div class="ml-2 flex border w-[60%] h-full">
          <div class="flex border-gray-300 w-full justify-center items-start h-full">
             <div class="bg-white border-2 w-[30%] h-[30%] mt-4 shadow-inset rounded-full">
                  <img class="w-full h-full" src="../../images/profile.png" alt="" srcset="">
                  <h1>upload profile dwdwdwd</h1>
             </div>
          </div>
      </div>
    </div>
</slot>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        form: {
          name: '',
          email: '',
          password: '',
          username: '',
          password_confirmation: '',
          user_role_id: null,
          institution_id: 0,
          degree_id:0,
          user_type_id:0,
        },
        errors: [],
        userRoles: [], 
        institutions: [],
        userTypes:[],
        degrees:[],
        selectedUserType:null,
        isProgramType: false,
        isInstitutionalType:false,
      };
    },
    methods: {
      async saveForm() {
        try {
          this.form.user_type_id = this.selectedUserType;
          const response = await axios.post('/api/register', this.form);
          // Redirect to the login page or handle success as needed
          this.$router.push({ name: 'Accounts' });
        } catch (error) {
          this.errors = error.response.data.errors;
        }
      },
      async fetchUserRoles() {
        try {
          const response = await axios.get('/api/user_roles');
          this.userRoles = response.data;
        } catch (error) {
          console.error('Error fetching user roles:', error);
        }
      },

      async fetchUserTypes() {
      
        try {
          const response = await axios.get('/api/user_types');
          this.userTypes = response.data;
        } catch (error) {
          console.error('Error fetching user types:', error);
        }
    },

      async fetchInstitutions() {
        try {
          const response = await axios.get('/api/institutions');
          this.institutions = response.data;
        } catch (error) {
          console.error('Error fetching institutions:', error);
        }
      },
      fetchDegrees() {
      axios.get('/api/degrees').then((response) => {
        this.degrees = response.data;
      });
    },
      handleUserTypeChange(user_type) {
      this.form.user_type_id = user_type;console.log(this.form.user_type_id)
      if (user_type === 1) {
        this.fetchInstitutions();
        this.isInstitutionalType = true;
        this.isProgramType = false;
        


      } else if (user_type === 2) {
        
        this.fetchDegrees();
        this.isInstitutionalType = false;
        this.isProgramType = true;
        console.log(this.form.user_type_id)
      }
      
    },
    },
    mounted() {
      this.fetchUserRoles();
      this.fetchUserTypes();
      
      
    },
  };
  </script>
  
  <style>
  /* Add your component styling here */
  </style>
  