<template>
    <v-layout>
        <v-data-table sm12
            :headers="headers"
            :items="desserts"
            class="elevation-1"
        >
            <template v-slot:items="props">
            <td>{{ props.item.nome }}</td>
            <td class="text-xs-left">{{ props.item.matricula}}</td>
            <td class="text-xs-left">{{ props.item.curso }}</td>
            <td class="text-xs-left">{{ props.item.categoria }}</td>
            <td class="text-xs-left">{{ props.item.editar }}</td>
            <td class="text-xs-left">{{ props.item.excluir }}</td>
            </template>
        </v-data-table>
        <v-container>
            <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark> Adicionar Alunos </v-btn>
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
            { text: 'Nome', value: 'nome' },
            { text: 'Matricula', value: 'matricula' },
            { text: 'Curso', value: 'curso' },
            { text: 'Categoria', value: 'categoria' },
            { text: 'Editar', value: 'editar' },
            { text: 'Excluir', value: 'excluir' }
            ],
            desserts: [
            {
                nome: 'Gabriel',
                matricula: 21611342,
                curso: 'CC',
                categoria: 'fp2',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Itlão',
                matricula: 21611421,
                curso: 'CC',
                categoria: 'IALG',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Pereke',
                matricula: 21611482,
                curso: 'CC',
                categoria: 'ED',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            }
            ]
        }
        }
    }
</script>