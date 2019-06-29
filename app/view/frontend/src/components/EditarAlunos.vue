<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nomeCompleto"
            :rules="nomeCompletoRules"
            label="Nome Completo"
            required
        ></v-text-field>
        <v-text-field
            v-model="matricula"
            :rules="matriculaRules"
            label="Num de Matrícula"
            required
        ></v-text-field>
        <v-text-field
            v-model="curso"
            :rules="cursoRules"
            label="Curso do Aluno"
            required
        ></v-text-field>
        <v-select
            v-model="categoria"
            :items="categorias"
            label="Categoria"
        ></v-select>
        <v-btn color="success" @click="salvarAluno">Salvar </v-btn>
        <v-btn color="error"  @click="fechaDialogo">Voltar </v-btn>
    </v-form>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>
export default {
    props: ['idaluno','novo'],
    data: () => ({
        aluno: Object,
        valid: false,
        nomeCompleto: '',
        matricula: '',
        categoria:'',
        curso: '',
        nomeCompletoRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        matriculaRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        cursoRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        categorias: ['Graduação', 'Pós-graduação']
    }),
    created() {
        if(!this.novo) {
            this.$http.secured.get(`/api/v1/alunos/${this.idaluno}`)
                .then(response =>{
                    this.aluno = response.data.data
                    this.nomeCompleto = this.aluno.nome
                    this.matricula = this.aluno.matricula
                    this.curso = this.aluno.curso
                    this.categoria = this.aluno.categoria
                    }
                )
                .catch(error => this.setError(error, 'Nao consegue achar aluno'))

        }
    },
    methods: {
        fechaDialogo() {
            this.$emit('fechar')
        },
        salvarAluno() {
            this.$emit('salvar')
            if(this.novo) {
                this.$http.secured.post('/api/v1/alunos/', {
                    nome: this.nomeCompleto,
                    matricula: this.matricula,
                    curso: this.curso,
                    categoria: this.categoria
                })
            } else {
                this.$http.secured.patch(`/api/v1/alunos/${this.aluno.id}`, {
                    nome: this.nomeCompleto,
                    matricula: this.matricula,
                    curso: this.curso,
                    categoria: this.categoria
                })
            }

        }
    }
}
</script>
