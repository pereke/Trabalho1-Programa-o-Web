<template>
    <v-layout wrap>
        <v-flex xs12>
            <v-data-table
                :headers="headers"
                :items="aulas"
                class="elevation-1"
            >
                <template v-slot:items="props">
                <td>{{ props.item.nomeAula }}</td>
                <td class="text-xs-left">{{ props.item.categoria}}</td>
                <td class="justify-center layout px-0">
                    <v-dialog v-model="dialog2">
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" icon>
                                <v-icon small class="mr-2">edit</v-icon>
                            </v-btn>
                        </template>
                        <v-card>
                            <v-card-title
                                class="headline grey lighten-2"
                                primary-title
                            > Editar Aula
                            </v-card-title>
                            <v-card-text>
                                <EditarAulas @fechar="fecharEditarAula()" @salvar="salvarEditarAula()"/>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on="deletarProjetoPesquisa">
                        <v-icon small>delete</v-icon>
                    </v-btn>
                </td>
                </template>
            </v-data-table>
        </v-flex>
        <v-flex xs12>
        <v-container px-5>
            <v-dialog v-model="dialog">

            <template v-slot:activator="{ on }">
                <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Adicionar Aula</v-btn>
            </template>

            <v-card>
                <v-card-title
                    class="headline grey lighten-2"
                    primary-title
                > Adicionar Aula
                </v-card-title>
                <v-card-text>
                    <EditarAulas @fechar="fecharAdicionarAula()" @salvar="salvarAdicionarAula()" />
                </v-card-text>
            </v-card>
            </v-dialog>
        </v-container>
        </v-flex>
    </v-layout>

</template>


<style>
</style>

<script>
    import EditarAulas from './EditarAulas.vue'
    export default {
        components: {
            EditarAulas
        },
        data () {
            return {
                dialog: false,
                dialog2: false,
                headers: [
                { text: 'Nome da Aula', value: 'nomeAula', align: 'center',  sortable: false },
                { text: 'Categoria', value: 'categoria',  sortable: false },
                { text: 'Ações', value: 'nomeAula', sortable: false, align: 'center' },
                ],
                aulas: []
            }
        },
        created() {
            this.$http.secured.get('/api/v1/aulas')
            .then(response => { this.aulas = response.data.data })
            .catch(error => this.setError(error, 'Algo deu errado!'))
        },
        methods: {
            setError (error, text) {
                this.error = (error.response && error.response.data && error.response.data.error) || text
            },
            fecharEditarAula() {
                this.dialog2 = false
            },
            fecharAdicionarAula() {
                this.dialog = false
            },
            salvarEditarAula() {
                // TODO métodos de edição de Aula
                this.dialog2 = false
            },
            salvarAdicionarAula() {
                // TODO métodos de adição de Aula
                this.dialog = false
            },
            deletarAula() {
                // TODO deletar aula
            }
        }
    }
</script>
