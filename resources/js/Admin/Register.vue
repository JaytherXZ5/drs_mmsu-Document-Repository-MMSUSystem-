<template>
    <slot name="register">
    <div class="flex flex-row w-full justify-start pl-6 items-center bg-gray-100">
      <div class="flex flex-col w-[55%] font-montserrat">
        <div class=" text-2xl text-gray-600 font-montserrat"><h1 class="">REGISTER AN ACCOUNT</h1></div>
        <div class="p-2 w-full">
          
          <input class="w-full bg-gray-100 rounded-lg hover:ring-2 hover:ring-green-400 hover:border-white border-2 border-gray-300   focus:outline-none text-base px-4 py-2" placeholder="Name" type="text" v-model="form.name">
        </div>
        <div class="p-2 mt-1 mx-2 border-2 rounded-lg w-[100%-10px] flex flex-col">
            
<!--User type-->
                <!--<label for="userType">Institution:</label>
                <select class=" bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none" v-model="form.institution_id" id="institution" name="institution_id" required>
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">
                        {{ institution.name }}
                    </option>
                </select>-->

                <label class="ml-4">Select Role:</label>
                <select name="" v-model="selectedRole" @change="handleRoleChange(selectedRole)" class=" bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                  <option v-for="role in roles"  :key="role.id" :value="role.id">
                        {{ role.name }}
                    </option>
                </select>

<!--Institution-->
                <div v-if="isInstitution">
                  <label class="ml-2" for="institution">Select Office:</label>
                  <select v-model="form.institution_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="institution in institutions" :key="institution.id" :value="institution.id">{{ institution.name }}</option>
                  </select>
                </div>

                <div v-if="isProgram">
                  <label class="ml-2" for="institution">Select Program:</label>
                  <select v-model="form.degree_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="degree in degrees" :key="degree.id" :value="degree.id">{{ degree.degree }}</option>
                  </select>
                </div>

                <div v-if="isAdminOffice">
                  <label class="ml-2" for="institution">Select Admin Office:</label>
                  <select v-model="form.administrative_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="admin in administrative" :key="admin.id" :value="admin.id">{{ admin.name }}</option>
                  </select>
                </div>

                <div v-if="isPsv">
                  <label class="ml-2" for="institution">Select PSV AREA:</label>
                  <select v-model="form.psv_area_id" class=" w-[calc(100%-20px)] bg-gray-100 ml-2 rounded-lg h-8 hover:ring-2 hover:ring-green-400 border-2  focus:outline-none">
                    <option v-for="psv_area in psv_areas" :key="psv_area.id" :value="psv_area.id">{{ psv_area.area_name + " - " + psv_area.area_description}}</option>
                  </select>
                </div>




                
        </div>
        <div class="p-2 pt-0 mt-2  w-full">
          
          <input class="w-full bg-gray-100 rounded-lg border-2 hover:ring-2 hover:ring-green-400 hover:border-white border-gray-300 focus:outline-none px-4 py-2" placeholder="Email" type="email" v-model="form.email">
        </div>
        <div class="p-2 pt-0  w-full">
          
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

          role_id: 0,
          institution_id: 0,
          degree_id:0,
          user_type_id:0,
          administrative_id:0,
          psv_area_id:0
        },
        errors: [],
        institutions: [],
        degrees:[],
        administrative:[],
        psv_areas:[],
        roles:[],

        selectedUserType:null,

        isProgram: false,
        isInstitution:false,
        isAdminOffice: false,
        isPsv:false,
        selectedRole:null,
        


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

      async getRoles(){
        try{
          const response = await axios.get('api/roles');
          this.roles = response.data;
        }catch(error){
          console.error('Error fetching user roles:', error);
        }
      },

      async fetchAdminOffice() {
        try {
          const response = await axios.get('/api/admin-office');
          this.administrative = response.data;
        } catch (error) {
          console.error('Error fetching admin office:', error);
        }
      },

      async fetchPsvAreas() {
        try {
          const response = await axios.get('/api/psv_areas');
          this.psv_areas = response.data;
        } catch (error) {
          console.error('Error fetching admin office:', error);
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
      

    handleRoleChange(role){
      this.form.role_id = this.selectedRole
      console.log(this.form.role_id);

      if(role === 1){//admin office
        this.fetchAdminOffice();
        this.isAdminOffice = true;
        this.isInstitution = false;
        this.isProgram = false;
        this.isPsv = false;
      }else if(role === 2 || role === 4){ //program & program accreditor
        this.fetchDegrees();
        this.isProgram = true;
        this.isInstitution = false;
        this.isPsv = false;
        this.isAdminOffice = false;
      }else if(role === 3 || role === 5){ //institution & institution accreditor
        this.fetchInstitutions();
        this.isInstitution = true;
        this.isProgram = false;
        this.isAdminOffice = false;
        this.isPsv = false;
      }else if(role === 6 || role === 7){ // psv & psv accreditor
        this.fetchPsvAreas();
        this.isPsv = true;
        this.isInstitution = false;
        this.isProgram = false;
        this.isAdminOffice = false;
      }else if(role === 0){
        this.isPsv = false;
        this.isInstitution = false;
        this.isProgram = false;
        this.isAdminOffice = false;
      }

    }



    },
    mounted() {
      this.getRoles();
     
    },
  };
  </script>
  
  <style>
  /* Add your component styling here */
  </style>
  