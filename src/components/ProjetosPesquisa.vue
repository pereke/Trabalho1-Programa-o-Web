<template>
    <v-layout>
        <v-data-table
            :headers="headers"
            :items="projetos_pesquisa"
            class="elevation-1"
        >
            <template v-slot:items="props">
            <td>{{ props.item.nome }}</td>
            <td class="text-xs-left">{{ props.item.anoInicio}}</td>
            <td class="text-xs-left">{{ props.item.anoTermino }}</td>
            <td class="text-xs-left">{{ props.item.documento }}</td>
            <td class="text-xs-left">{{ props.item.editar }}</td>
            <td class="text-xs-left">{{ props.item.excluir }}</td>
            </template>
        </v-data-table>
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
                    <EditarProjetosPesquisa />
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
        dialog: false,
        components: {
            EditarProjetosPesquisa
        },
        data () {
        return {
            headers: [
            { text: 'Nome', value: 'nome' },
            { text: 'Ano de Início', value: 'anoInicio' },
            { text: 'Ano de Término', value: 'anoTermino' },
            { text: 'Documento', value: 'documento' },
            { text: 'editar', value: 'editar' },
            { text: 'Excluir ', value: 'excluir' }
            ],
            projetos_pesquisa: [
            {
                nome: 'Ação dos Ratos nas Plantas',
                anoInicio: '18/05/09',
                anoTermino: '18/05/10',
                documento: '<v-btn>Documento</v-btn>',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Ação dos Ratos nos HDs',
                anoInicio: '13/07/09',
                anoTermino: '13/07/10',
                documento: '<v-btn>Doc</v-btn>',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            }
            ]
        }
        }
    }
</script>