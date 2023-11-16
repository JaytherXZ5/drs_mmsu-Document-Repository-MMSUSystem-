<template>
    <slot name="register">
    <div class="flex flex-wrap w-full justify-center items-center">
      <div class="flex flex-wrap max-w-xl">
        <div class="p-2 text-2xl text-gray-800 font-semibold"><h1>Register an account</h1></div>
        <div class="p-2 w-full">
          <label class="w-full" for="name">Name</label>
          <input class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Name" type="text" v-model="form.name">
        </div>
        <div class="p-2 w-full">
            <label for="userType">Select User Type:</label>
                <select v-model="form.user_role_id" id="userType" name="user_role_id" required>
                    <option v-for="userRole in userRoles" :key="userRole.id" :value="userRole.id">
                        {{ userRole.role }}
                    </option>
                </select>

            <label for="institution">Select Institution:</label>
                <select v-model="form.institution_id" id="institution" name="institution_id" required>
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">
                        {{ institution.name }}
                    </option>
                </select>
        </div>
        <div class="p-2 w-full">
          <label for="email">Your e-mail</label>
          <input class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Email" type="email" v-model="form.email">
        </div>
        <div class="p-2 w-full">
          <label for="password">Password</label>
          <input class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Password" type="password" v-model="form.password" name="password">
        </div>
        <div class="p-2 w-full">
          <label for="confirm_password">Confirm Password</label>
          <input class="w-full bg-gray-100 rounded border border-gray-400 focus:outline-none focus:border-indigo-500 text-base px-4 py-2" placeholder="Confirm Password" type="password" v-model="form.password_confirmation" name="password_confirmation">
        </div>

        <div class="p-2 w-full mt-4">
          <div v-if="errors.length" class="text-red-500">
            <ul>
              <li v-for="error in errors">{{ error }}</li>
            </ul>
          </div>
  
          <button @click.prevent="saveForm" type="submit" class="flex text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Register</button>
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
          this.$router.push({ name: 'Login' });
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
  