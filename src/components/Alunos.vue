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
                            > Editar Aluno
                            </v-card-title>
                            <v-card-text>
                                <EditarAlunos @fechar="fecharEditarAluno()" @salvar="salvarEditarAluno()"/>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on="deletarAluno">
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
                        <EditarAlunos @fechar="fecharAdicionarAluno()" @salvar="salvarAdicionarAluno()"/>
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
            EditarAlunos
        },
        data () {
            return {
                dialog: false,
                dialog2: false,
                headers: [
                { text: 'Nome', value: 'nome', align: 'center', sortable: false },
                { text: 'Matricula', value: 'matricula', sortable: false },
                { text: 'Curso', value: 'curso', sortable: false},
                { text: 'Categoria', value: 'categoria', sortable: false },
                { text: 'Ações', value: 'nome', sortable: false },
                ],
                alunos: [
                {
                    nome: 'Gabriel',
                    matricula: 21611342,
                    curso: 'Ciência da Computação',
                    categoria: 'Graduação'
                },
                {
                    nome: 'Itlão',
                    matricula: 21611421,
                    curso: 'Ciência da Computação',
                    categoria: 'Graduação'
                },
                {
                    nome: 'Pereke',
                    matricula: 21611482,
                    curso: 'Sistemas de Informação',
                    categoria: 'Pós-Graduação'
                }
                ]
            }
        },
        methods: {
            fecharEditarAluno() {
                this.dialog2 = false
            },
            fecharAdicionarAluno() {
                this.dialog = false
            },
            salvarEditarAluno() {
                // TODO métodos de edição de aluno  
                this.dialog2 = false
            },
            salvarAdicionarAluno() {
                // TODO métodos de adição de aluno
                this.dialog = false
            },
            deletarAluno() {
                // TODO deletar aluno
            }
        }
    }
</script>