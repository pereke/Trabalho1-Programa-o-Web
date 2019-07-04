<template>
    <v-layout wrap>
        <v-flex xs12>
            <v-data-table
                :headers="headers"
                :items="publicacoes"
                class="elevation-1"
            >
                <template v-slot:items="props">
                <td>{{ props.item.nomePublicacao }}</td>
                <td class="text-xs-left">{{ props.item.data}}</td>
                <td class="text-xs-left">{{ props.item.categoria }}</td>
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
                            > Editar Publicação
                            </v-card-title>
                            <v-card-text>
                                <app-editar-publicacoes
                                    v-bind:key="props.item.id"
                                    v-bind:idpublicacao="props.item.id"
                                    v-bind:novo="false"
                                    @fechar="fecharEditarPublicacao(props.item)"
                                    @salvar="fecharEditarPublicacao(props.item)">
                                </app-editar-publicacoes>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on:click="deletarPublicacao(props.item)">
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
                <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Adicionar Publicação</v-btn>
            </template>

            <v-card>
                <v-card-title
                    class="headline grey lighten-2"
                    primary-title
                > Adicionar Publicação
                </v-card-title>
                <v-card-text>
                    <app-editar-publicacoes
                        v-bind:novo="true"
                        @fechar="fecharAdicionarPublicacao()"
                        @salvar="fecharAdicionarPublicacao()" >
                    </app-editar-publicacoes>
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
    import EditarPublicacoes from './EditarPublicacoes.vue'
    export default {
        components: {
            appEditarPublicacoes: EditarPublicacoes
        },
        data () {
            return {
                dialog: false,
                dialogNote: {},
                headers: [
                { text: 'Nome da Publicação', value: 'nome',  sortable: false, align: 'center' },
                { text: 'Data', value: 'data',  sortable: false },
                { text: 'Categoria', value: 'categoria',  sortable: false },
                { text: 'Arquivo Bibtex', value: 'arquivoBib',  sortable: false, align: 'center' },
                { text: 'Ações', value: 'nome', sortable: false}
                ],
                publicacoes: []
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
                this.$http.secured.get('/api/v1/publicacaos')
                    .then(response => { this.publicacoes = response.data.data })
                    .catch(error => this.setError(error, 'Algo deu errado!'))
            },
            fecharEditarPublicacao(publicacao) {
                this.dialogNote[publicacao.id] = false
                this.atualizarTabela()
            },
            fecharAdicionarPublicacao() {
                this.dialog = false
                this.atualizarTabela
            },
            deletarPublicacao(publicacao) {
                this.$http.secured.delete(`/api/v1/publicacaos/${publicacao.id}`)
                    .then(this.publicacoes.splice(this.publicacoes.indexOf(publicacao), 1))
                    .catch(error => this.setError(error, 'Nao consegue deletar publicacao'))
            }
        }
    }
</script>
