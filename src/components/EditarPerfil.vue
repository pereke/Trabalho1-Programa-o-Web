<template>
   <v-form v-model="valid">
       <v-text-field
            v-model="email"
            :rules="emailRules"
            label="E-mail"
            required
       ></v-text-field>
       <v-text-field
            v-model="password"
            label="Nova Senha"
            :append-icon="showPassword ? 'visibility' : 'visibility_off'"
            :type="showPassword ? 'text' : 'password'"
            :rules="[rules.required]"
            @click:append="showPassword = !showPassword"
        ></v-text-field>
        <v-text-field
            v-model="password"
            label="Confirmar Nova Senha"
            :append-icon="showPassword ? 'visibility' : 'visibility_off'"
            :type="showPassword ? 'text' : 'password'"
            :rules="[rules.required]"
            @click:append="showPassword = !showPassword"
        ></v-text-field>
        <v-text-field
            v-model="nomeCompleto"
            :rules="nomeCompletoRules"
            label="Nome Completo"
            required
       ></v-text-field>
       <v-text-field
            v-model="sala"
            :rules="salaRules"
            label="Sala"
            required
       ></v-text-field>
       <v-text-field
            v-model="telefone"
            :rules="telefoneRules"
            label="Telefone"
            required
       ></v-text-field>
       <v-text-field
            v-model="formacao"
            :rules="formacaoRules"
            label="Formação"
            required
       ></v-text-field>
       <v-btn color="success" @click="salvarPerfil">Salvar </v-btn>
       <v-btn color="error"  @click="fechaDialogo">Voltar </v-btn>
   </v-form>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>
    export default {
        data: () => ({
            showPassword: false,
            rules: {
                required: value => !!value || 'Campo obrigatório.',
                email: value => {
                const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                return pattern.test(value) || 'E-mail inválido.'
                }
            }
        }),
        methods: {
        fechaDialogo() {
            this.$emit('fechar')
        },
        salvarPerfil() {
            this.$emit('salvar')
        }
    }
    }
</script>