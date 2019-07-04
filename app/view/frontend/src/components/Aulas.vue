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
                <td class="text-xs-center">
                    <v-icon small>insert_drive_file</v-icon>
                </td>
                <td class="justify-center layout px-0">
                    <v-dialog v-model="dialogNote[props.item.id]" :key="props.item.id">
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
                                <app-editar-aulas
                                    v-bind:key="props.item.id"
                                    v-bind:idaula="props.item.id"
                                    v-bind:novo="false"
                                    @fechar="fecharEditarAula(props.item)"
                                    @salvar="fecharEditarAula(props.item)"
                                    >
                                </app-editar-aulas>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on:click="deletarAula(props.item)">
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
                    <app-editar-aulas
                    v-bind:novo="true"
                    @fechar="fecharAdicionarAula()"
                    @salvar="fecharAdicionarAula()" />
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
            appEditarAulas: EditarAulas
        },
        data () {
            return {
                dialog: false,
                dialogNote: {},
                headers: [
                { text: 'Nome da Aula', value: 'nomeAula', align: 'center',  sortable: false },
                { text: 'Categoria', value: 'categoria',  sortable: false },
                { text: 'Material didático', value: 'matDidatico', align: 'center',  sortable: false },
                { text: 'Ações', value: 'acoes', sortable: false, align: 'center' },
                ],
                aulas: []
            }
        },
        created() {
            this.atualizarTabela()
        },
        methods: {
            setError (error, text) {
                this.error = (error.response && error.response.data && error.response.data.error) || text
            },
            atualizarTabela() {
                this.$http.secured.get('/api/v1/aulas')
                    .then(response => { this.aulas = response.data.data })
                    .catch(error => this.setError(error, 'Algo deu errado!'))
            },
            fecharEditarAula(aula) {
                this.dialogNote[aula.id] = false
                this.atualizarTabela()
            },
            fecharAdicionarAula() {
                this.dialog = false
                this.atualizarTabela()
            },
            deletarAula(aula) {
                this.$http.secured.delete(`/api/v1/aulas/${aula.id}`)
                    .then(this.aulas.splice(this.aulas.indexOf(aula), 1))
                    .catch(error => this.setError(error, 'Nao consegue deletar aula'))
            }
        }
    }
</script>
