<template>
    <v-layout>
        <v-data-table
            :headers="headers"
            :items="aulas"
            class="elevation-1"
        >
            <template v-slot:items="props">
            <td>{{ props.item.nomeAula }}</td>
            <td class="text-xs-left">{{ props.item.categoria}}</td>
            <td class="text-xs-left">{{ props.item.editar }}</td>
            <td class="text-xs-left">{{ props.item.excluir }}</td>
            </template>
        </v-data-table>
        <v-container>
            <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark> Adicionar Aula </v-btn>
        </v-container>
    </v-layout>
    
</template>


<style>
</style>

<script>

    export default {
        data () {
        return {
            headers: [
            { text: 'Nome da Aula', value: 'nomeAula' },
            { text: 'Categoria', value: 'categoria' },
            { text: 'Editar', value: 'editar' },
            { text: 'Excluir', value: 'excluir' }
            ],
            aulas: [
            {
                nomeAula: 'Hackeando o FaceBook I',
                categoria: 'Pós Graduação',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nomeAula: 'Formatando Computadores',
                categoria: 'Graduação',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            }
            ]
        }
        }
    }
</script>