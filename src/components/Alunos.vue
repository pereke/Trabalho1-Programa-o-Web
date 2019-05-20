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
                    <EditarAlunos />
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