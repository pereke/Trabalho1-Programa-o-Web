<template>
    <v-layout style="height: 100%;" row wrap class="backgroundImage">
        <v-flex hidden-xs-only sm6 md8 lg9> 
          <v-container>
            <v-icon style="font-size: 100px;" color="white">school</v-icon>
            <span class="display-1 white--text">SYSTEMNAME</span>
          </v-container>
        </v-flex>
      <v-flex sm6 md4 lg3>
        <v-layout column wrap class="white" style="height:100%;">
          <v-flex xs2></v-flex> <!-- opção utilizada em detrimento que offset não funciona quando o layout está definido como column-->
          <v-flex xs6>
            <v-container class="px-5">
                <h1 class="headline mb-2 grey--text text--darken-3 font-weight-regular">Login</h1>
                <p class="mb-5 body-2 grey--text text--darken-1 font-weight-regular" >Entre com seu login e senha cadastrado</p>
                
                <v-form ref="formLogin">
                  <v-text-field
                    label="E-mail"
                    solo
                    v-model="email"
                    :rules="[rules.required, rules.email]">
                  </v-text-field>
                  <v-text-field 
                    label="Senha"
                    solo
                    v-model="password"
                    :append-icon="showPassword ? 'visibility' : 'visibility_off'"
                    :type="showPassword ? 'text' : 'password'"
                    :rules="[rules.required]"
                    @click:append="showPassword = !showPassword">
                  </v-text-field>
                  
                  <v-btn
                  class="text-capitalize font-weight-regular" color="blue lighten-2" block  dark mb-3 @click="submit()">
                  Login
                  </v-btn>
                  </v-form>
                <router-link to="/contato">
                  <v-btn class="text-capitalize font-weight-regular" color="#3b5998" block  dark>Contato</v-btn>
                </router-link>
            </v-container>
          </v-flex>
        </v-layout>
      </v-flex>
    </v-layout>

</template>

<style>

  .backgroundImage {
    background-image: url("../assets/eyeglasses-1245879_1920.jpg");
    background-repeat: repeat;
  }

</style>

<script>

  export default {
    data() {
      return{
        email: '',
        password: '',
        showPassword: false,
        rules: {
          required: value => !!value || 'Campo obrigatório.',
          email: value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            return pattern.test(value) || 'E-mail inválido.'
          }
        }
      }
    },

    methods:{
      submit(){
        if(this.$refs.formLogin.validate()){
          alert('Dados login enviados.')
        }
      }
    }
  }
  
</script>
