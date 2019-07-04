<template>
    <v-container>
        <v-container>
            <v-layout>
                <v-flex xs4>
                    <v-container px-5>
                        <v-card>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Professor:  {{ professor.nomeProfessor }}</label><br>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">E-mail: {{ professor.email }}</label><br>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Telefone: {{ professor.telefone }}</label><br>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Sala: {{ professor.sala }}</label>
                        </v-card>
                    </v-container>
                </v-flex>
                <v-flex xs8>
                    <v-container px-5>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Formação: </label>
                            <v-card>
                                <v-card-title primary-title>
                                <div>
                                {{ professor.formacao }}
                                </div>
                                </v-card-title>
                            </v-card>
                    </v-container>
                </v-flex>
            </v-layout>
        </v-container>
        <v-container px-5>
            <v-dialog v-model="dialog">

            <template v-slot:activator="{ on }">
                <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Editar Informações</v-btn>
            </template>

            <v-card>
                <v-card-title
                    class="headline grey lighten-2"
                    primary-title
                > Editar Informações de Perfil
                </v-card-title>
                <v-card-text>
                    <EditarPerfil @fechar="fechar()" @salvar="fechar()"/>
                </v-card-text>
            </v-card>
            </v-dialog>
        </v-container>
    </v-container>

</template>

<style>
</style>

<script>
    import EditarPerfil from './EditarPerfil.vue'

    export default {
        name: "App",
        components: {
            EditarPerfil
        },
        data() {
            return {
                professor: Object,
                dialog: false
            }
        },
        created() {
            this.atualizarTabela()
        },
        methods: {
            setError (error, text) {
                this.error = (error.response && error.response.data && error.response.data.error) || text
            },
            fechar() {
                this.dialog = false
            },
            atualizarTabela() {
                this.$http.secured.get('/api/v1/professors')
                .then(response => { this.professor = response.data.data[0] })
                .catch(error => this.setError(error, 'Algo deu errado!'))
            }
        }
    }
</script>
