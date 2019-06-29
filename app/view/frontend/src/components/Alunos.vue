<template>
    <v-layout wrap>
        <v-flex xs12>
            <v-data-table
                :headers="headers"
                :items="alunos"
                class="elevation-1"
            >
                <template v-slot:items="props">
                <td>{{ props.item.nome }}</td>
                <td class="text-xs-left">{{ props.item.matricula}}</td>
                <td class="text-xs-left">{{ props.item.curso }}</td>
                <td class="text-xs-left">{{ props.item.categoria }}</td>
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
                            > Editar Aluno
                            </v-card-title>
                            <v-card-text>
                                <app-editar-alunos v-bind:key="props.item.id"
                                    v-bind:idaluno="props.item.id"
                                    v-bind:novo="false"
                                    @fechar="fecharEditarAluno(props.item)"
                                    @salvar="fecharEditarAluno(props.item)">
                                </app-editar-alunos>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on:click="deletarAluno(props.item)">
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
                    <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Adicionar Aluno</v-btn>
                </template>
                <v-card>
                    <v-card-title
                        class="headline grey lighten-2"
                        primary-title
                    > Adicionar Aluno
                    </v-card-title>
                    <v-card-text>
                        <EditarAlunos @fechar="fecharAdicionarAluno()" @salvar="fecharAdicionarAluno()"/>
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

    import EditarAlunos from './EditarAlunos.vue'

    export default {
        name: "App",
        components: {
            appEditarAlunos: EditarAlunos
        },
        data () {
            return {
                dialog: false,
                dialogNote: {},
                headers: [
                { text: 'Nome', value: 'nome', align: 'center', sortable: false },
                { text: 'Matricula', value: 'matricula', sortable: false },
                { text: 'Curso', value: 'curso', sortable: false},
                { text: 'Categoria', value: 'categoria', sortable: false },
                { text: 'Ações', value: 'nome', sortable: false },
                ],
                alunos: [],
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
                this.$http.secured.get('/api/v1/alunos')
                    .then(response => { this.alunos = response.data.data })
                    .catch(error => this.setError(error, 'Algo deu errado!'))
            },
            fecharEditarAluno(aluno) {
                this.dialogNote[aluno.id] = false
                this.atualizarTabela()
            },
            fecharAdicionarAluno() {
                this.dialog = false
            },
            deletarAluno(aluno) {
                this.$http.secured.delete(`/api/v1/alunos/${aluno.id}`)
                .then(this.alunos.splice(this.alunos.indexOf(aluno), 1))
                .catch(error => this.setError(error, 'Nao consegue deletar aluno'))
            }
        }
    }
</script>
