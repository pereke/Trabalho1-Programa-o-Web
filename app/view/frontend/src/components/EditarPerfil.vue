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
           v-model="grupoPesquisa"
           label = "Grupo de Pesquisa"
           >
       </v-text-field>
       <v-textarea
            name="formacao"
            v-model="formacao"
            label="Formação"
       ></v-textarea>
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
            },
            id: String,
            password: '',
            email: String,
            nomeCompleto: String,
            grupoPesquisa: String,
            sala: String,
            telefone: String,
            formacao: String,
            professor: Object
        }),
        created() {
            this.$http.secured.get('/api/v1/professors')
                .then(response => {
                    this.professor = response.data.data[0]
                    this.id = this.professor.id
                    this.email = this.professor.email
                    this.nomeCompleto = this.professor.nomeProfessor
                    this.sala = this.professor.sala
                    this.telefone = this.professor.telefone
                    this.formacao = this.professor.formacao
                    this.grupoPesquisa = this.professor.grupoPesquisa
                })
                .catch(error => this.setError(error, 'Algo deu errado!'))

        },
        methods: {
        fechaDialogo() {
            this.$emit('fechar')
        },
        salvarPerfil() {
            this.$emit('salvar'),
            this.$http.secured.patch(`/api/v1/professors/${this.id}`, {

                        nomeProfessor: this.nomeCompleto,
                        email: this.email,
                        sala: this.sala,
                        telefone: this.telefone,
                        formacao: this.formacao,
                        password: this.password,
                        grupoPesquisa: this.grupoPesquisa

                }
            )
        },
        setError (error, text) {
            this.error = (error.response && error.response.data && error.response.data.error) || text
        }
    }
    }
</script>
