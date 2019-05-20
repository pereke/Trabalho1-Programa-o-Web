<template>
    <v-layout>
        <v-data-table
            :headers="headers"
            :items="publicacoes"
            class="elevation-1"
        >
            <template v-slot:items="props">
            <td>{{ props.item.nome }}</td>
            <td class="text-xs-left">{{ props.item.data}}</td>
            <td class="text-xs-left">{{ props.item.categoria }}</td>
            <td class="text-xs-left">{{ props.item.arquivoBib }}</td>
            <td class="text-xs-left">{{ props.item.editar }}</td>
            <td class="text-xs-left">{{ props.item.excluir }}</td>
            </template>
        </v-data-table>
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
                    <EditarPublicacoes />
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
            headers: [
            { text: 'Nome da Publicação', value: 'nome' },
            { text: 'Data', value: 'data' },
            { text: 'Categoria', value: 'categoria' },
            { text: 'Arquivo Bibtex', value: 'arquivoBib' },
            { text: 'Editar', value: 'editar' },
            { text: 'Excluir', value: 'excluir' }
            ],
            publicacoes: [
            {
                nome: 'Desfragmentar arquivos ajuda o Windows',
                data: '12/12/14',
                categoria: 'Periódico',
                arquivoBib: '<v-btn>ArquivoBib</v-btn>',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Derrentendo seu HD',
                data: '20/05/18',
                categoria: 'Resumo',
                arquivoBib: '<v-btn>ArquivoBib</v-btn>',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            }
            ]
        }
        }
    }
</script>