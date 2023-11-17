<template>
    <slot name="register">
    <div class="flex flex-row w-full justify-start pl-6 items-center bg-gray-100">
      <div class="flex flex-col w-[60%  ] font-montserrat">
        <div class=" text-2xl text-gray-600 font-montserrat"><h1>REGISTER AN ACCOUNT</h1></div>
        <div class="p-2 w-full">
          <label class="w-full" for="name">NAME</label>
          <input class="w-full bg-gray-100 rounded-lg shadow-inset border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Name" type="text" v-model="form.name">
        </div>
        <div class="p-2 mt-1 mx-2 border-2 rounded-lg shadow-lg w-[100%-10px] ">
            <label for="userType">User Role:</label>
                <select class=" ml-2 rounded-lg shadow-inset h-8" v-model="form.user_role_id" id="userType" name="user_role_id" required>
                    
                    <option v-for="userRole in userRoles" :key="userRole.id" :value="userRole.id">
                        {{ userRole.role }}
                    </option>
                </select>

            <label class="ml-4" for="institution">Institution:</label>
                
                <select class=" ml-2 rounded-lg shadow-inset h-8" v-model="form.institution_id" id="institution" name="institution_id" required>
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">
                        {{ institution.name }}
                    </option>
                </select>
        </div>
        <div class="p-2 pt-0 mt-4 border-t-2 w-full">
          <label for="email">Email</label>
          <input class="w-full bg-gray-100 rounded-lg shadow-inset border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Email" type="email" v-model="form.email">
        </div>
        <div class="p-2 pt-0 border-t-2 w-full">
          <label for="password">Password</label>
          <input class="w-full bg-gray-100 rounded-lg shadow-inset border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Password" type="password" v-model="form.password" name="password">
        </div>
        <div class="p-2 pt-0 border-t-2 w-full">
          <label for="confirm_password">Confirm Password</label>
          <input class="w-full bg-gray-100 rounded-lg shadow-inset border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Confirm Password" type="password" v-model="form.password_confirmation" name="password_confirmation">
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

      <div class="ml-12 flex border w-[60%] h-full">
          <div class="flex border-gray-300 w-full justify-center items-start h-full">
             <div class="bg-white border-2 w-[30%] h-[34%] mt-4 shadow-inset rounded-full">
                  <img src="../../images/profile.png" alt="" srcset="">
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
          password_confirmation: '',
          user_role_id: null,
          institution_id: null,
        },
        errors: [],
        userRoles: [], // To be fetched from the API
        institutions: [], // To be fetched from the API
      };
    },
    methods: {
      async saveForm() {
        try {
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
      async fetchInstitutions() {
        try {
          const response = await axios.get('/api/institutions');
          this.institutions = response.data;
        } catch (error) {
          console.error('Error fetching institutions:', error);
        }
      },
    },
    mounted() {
      this.fetchUserRoles();
      this.fetchInstitutions();
    },
  };
  </script>
  
  <style>
  /* Add your component styling here */
  </style>
  