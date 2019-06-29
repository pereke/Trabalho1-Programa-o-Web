<template>
    <v-layout wrap>
        <v-flex xs12>
            <v-data-table
                :headers="headers"
                :items="projetos_pesquisa"
                class="elevation-1"
            >
                <template v-slot:items="props">
                <td>{{ props.item.nomeProjeto }}</td>
                <td class="text-xs-left">{{ props.item.inicio}}</td>
                <td class="text-xs-left">{{ props.item.termino }}</td>
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
                            > Editar Projeto de Pequisa
                            </v-card-title>
                            <v-card-text>
                                <app-editar-projetos-pesquisa
                                    v-bind:key="props.item.id"
                                    v-bind:idprojeto="props.item.id"
                                    v-bind:novo="false"
                                    @fechar="fecharEditarProjetoPesquisa(props.item)"
                                    @salvar="fecharEditarProjetoPesquisa(props.item)">
                                </app-editar-projetos-pesquisa>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on:click="deletarProjetoPesquisa(props.item)">
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
            appEditarProjetosPesquisa: EditarProjetosPesquisa
        },
        data () {
            return {
                dialog: false,
                dialogNote: {},
                headers: [
                { text: 'Nome', value: 'nome',  sortable: false, align: 'center' },
                { text: 'Ano de Início', value: 'anoInicio',  sortable: false },
                { text: 'Ano de Término', value: 'anoTermino',  sortable: false },
                { text: 'Documento', value: 'documento',  sortable: false, align: 'center' },
                { text: 'Ações', value: 'nome', sortable: false}
                ],
                projetos_pesquisa: []
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
                this.$http.secured.get('/api/v1/projetos')
                .then(response => { this.projetos_pesquisa = response.data.data })
                .catch(error => this.setError(error, 'Algo deu errado!'))
            },
            fecharEditarProjetoPesquisa(projeto) {
                this.dialogNote[projeto.id] = false
                this.atualizarTabela()
            },
            fecharAdicionarProjetoPesquisa(projeto) {
                this.dialogNote[projeto.id] = false
            },
            deletarProjetoPesquisa(projeto) {
                this.$http.secured.delete(`/api/v1/projetos/${projeto.id}`)
                .then(this.projetos_pesquisa.splice(this.projetos_pesquisa.indexOf(projeto), 1))
                .catch(error => this.setError(error, 'Nao consegue deletar projeto'))
            }
        }
    }
</script>
