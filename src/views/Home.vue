<template>
    <v-layout style="height: 100%;" row wrap class="imgFundo">
      <v-flex hidden-xs-only sm6 lg9> 
        <v-container>
        </v-container>
      </v-flex>
      <v-flex sm6 lg3 class="white">
        <v-container class="px-5 mt-9" >
            <h1 class="headline mb-2 grey--text text--darken-3 font-weight-regular">Login</h1>
            <p class="mb-5 body-2 grey--text text--darken-1 font-weight-regular" >Entre com seu login e senha cadastrado</p>
            <v-text-field
              label="E-mail"
              outline
              v-model="email"
              :rules="[rules.required, rules.email]">
            </v-text-field>
            <v-text-field 
              label="Senha"
              outline
              v-model="password"
              :append-icon="showPassword ? 'visibility' : 'visibility_off'"
              :type="showPassword ? 'text' : 'password'"
              :rules="[rules.required]"
              @click:append="showPassword = !showPassword">
            </v-text-field>
            
            <v-btn
            class="text-capitalize font-weight-regular" color="blue lighten-2" block  dark mb-3>
            Login
            </v-btn>
            <v-btn class="text-capitalize font-weight-regular" color="orange lighten-1" block  dark>Contato</v-btn>

        </v-container>
      </v-flex>
    </v-layout>

</template>

<style>
  .mt-9{
    margin-top: 144px !important;
  }

  .v-input__slot {
    border:1px solid #E0E0E0 !important;
  }

  .imgFundo {
    /*background-image: url("../assets/imagem_home.jpg");*/
    /*background-color:blueviolet;*/
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
    }
  }
  
</script>
