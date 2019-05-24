<template>
    <v-layout wrap>
        <v-flex xs12>
            <v-data-table
                :headers="headers"
                :items="projetos_pesquisa"
                class="elevation-1"
            >
                <template v-slot:items="props">
                <td>{{ props.item.nome }}</td>
                <td class="text-xs-left">{{ props.item.anoInicio}}</td>
                <td class="text-xs-left">{{ props.item.anoTermino }}</td>
                <td class="text-xs-center">
                    <v-icon small>insert_drive_file</v-icon>
                </td>
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
                            > Editar Projeto de Pequisa
                            </v-card-title>
                            <v-card-text>
                                <EditarProjetosPesquisa @fechar="fecharEditarProjetoPesquisa()" @salvar="salvarEditarProjetoPesquisa()"/>
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
                <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Adicionar Projeto de Pesquisa</v-btn>
            </template>

            <v-card>
                <v-card-title
                    class="headline grey lighten-2"
                    primary-title
                > Adicionar Projeto de Pesquisa
                </v-card-title>
                <v-card-text>
                    <EditarProjetosPesquisa @fechar="fecharAdicionarProjetoPesquisa()" @salvar="salvarAdicionarProjetoPesquisa()" />
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
    import EditarProjetosPesquisa from './EditarProjetosPesquisa.vue'
    export default {
        components: {
            EditarProjetosPesquisa
        },
        data () {
            return {
                dialog: false,
                dialog2: false,
                headers: [
                { text: 'Nome', value: 'nome',  sortable: false, align: 'center' },
                { text: 'Ano de Início', value: 'anoInicio',  sortable: false },
                { text: 'Ano de Término', value: 'anoTermino',  sortable: false },
                { text: 'Documento', value: 'documento',  sortable: false, align: 'center' },
                { text: 'Ações', value: 'nome', sortable: false}
                ],
                projetos_pesquisa: [
                {
                    nome: 'Ação dos Ratos nas Plantas',
                    anoInicio: '18/05/09',
                    anoTermino: '18/05/10',
                    documento: '<v-btn>Documento</v-btn>',
                },
                {
                    nome: 'Ação dos Ratos nos HDs',
                    anoInicio: '13/07/09',
                    anoTermino: '13/07/10',
                    documento: '<v-btn>Doc</v-btn>',
                }
                ]
            }
        },
        methods: {
            fecharEditarProjetoPesquisa() {
                this.dialog2 = false
            },
            fecharAdicionarProjetoPesquisa() {
                this.dialog = false
            },
            salvarEditarProjetoPesquisa() {
                // TODO métodos de edição de projetopesquisa
                this.dialog2 = false
            },
            salvarAdicionarProjetoPesquisa() {
                // TODO métodos de adição de projetopesquisa
                this.dialog = false
            },
            deletarProjetoPesquisa() {
                // TODO deletar aluno
            }
        }
    }
</script>