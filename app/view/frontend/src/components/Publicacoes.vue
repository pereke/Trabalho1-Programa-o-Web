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
                            > Editar Publicação
                            </v-card-title>
                            <v-card-text>
                                <EditarPublicacoes @fechar="fecharEditarPublicacao()" @salvar="salvarEditarPublicacao()"/>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-btn icon v-on="deletarPublicacao">
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
                    <EditarPublicacoes @fechar="fecharAdicionarPublicacao()" @salvar="salvarAdicionarPublicacao()" />
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
            EditarPublicacoes
        },
        data () {
            return {
                dialog: false,
                dialog2: false,
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
            
            this.$http.secured.get('/api/v1/publicacaos')
            .then(response => { this.publicacoes = response.data.data })
            .catch(error => this.setError(error, 'Algo deu errado!'))
        },
        methods: {
            setError (error, text) {
                this.error = (error.response && error.response.data && error.response.data.error) || text
            },
            fecharEditarPublicacao() {
                this.dialog2 = false
            },
            fecharAdicionarPublicacao() {
                this.dialog = false
            },
            salvarEditarPublicacao() {
                // TODO métodos de edição de publicacao
                this.dialog2 = false
            },
            salvarAdicionarPublicacao() {
                // TODO métodos de adição de publicacao
                this.dialog = false
            },
            deletarPublicacao() {
                // TODO deletar publicacao
            }
        }
    }
</script>
