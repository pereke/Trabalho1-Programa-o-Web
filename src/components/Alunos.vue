<template>
    <v-layout>
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
            <td class="text-xs-left">{{ props.item.editar }}</td>
            <td class="text-xs-left">{{ props.item.excluir }}</td>
            </template>
        </v-data-table>
        <v-container>
            <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark> Adicionar Aluno </v-btn>
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
            alunos: [
            {
                nome: 'Gabriel',
                matricula: 21611342,
                curso: 'Ciência da Computação',
                categoria: 'Graduação',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Itlão',
                matricula: 21611421,
                curso: 'Ciência da Computação',
                categoria: 'Graduação',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            },
            {
                nome: 'Pereke',
                matricula: 21611482,
                curso: 'Sistemas de Informação',
                categoria: 'Pós-Graduação',
                editar: '<v-btn>Editar</v-btn>',
                excluir: '<v-btn>Excluir</v-btn>'
            }
            ]
        }
        }
    }
</script>