<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nome"
            :rules="nomeRules"
            label="Nome"
            required
        ></v-text-field>
        <v-text-field
            v-model="anoInicio"
            :rules="anoInicioRules"
            label="Ano de Início"
            mask="####"
            required
        ></v-text-field>
        <v-text-field
            v-model="anoTermino"
            :rules="anoTerminoRules"
            label="Ano de Término"
            mask="####"
            required
        ></v-text-field>
        <v-textarea
            name="name1"
            v-model="resumo"
            label="Resumo"
            hint="Hint text"
        ></v-textarea>
        <v-data-table
            :headers="headersAlunos"
            :items="alunos"
            class="elevation-1"
        >
            <template v-slot:items="props1">
            <td>{{ props1.item.nome }}</td>
            <td>{{ props1.item.matricula}}</td>
        </template>
        </v-data-table>
        <!-- TODO inserir tabela com alunos -->
        <v-btn color="success" @click="salvar()">Salvar </v-btn>
        <v-btn color="error"  @click="fecharDialogo()">Voltar </v-btn>
    </v-form>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>
export default {
    props: ['idprojeto', 'novo'],
    data: () => ({
        headersAlunos: [
        { text: 'Nome', value: 'nome', align: 'center', sortable: false },
        { text: 'Matricula', value: 'matricula', sortable: false }
        ],
        valid: false,
        nome: '',
        anoInicio: '',
        anoTermino: '',
        resumo: '',
        alunos: Object,
        nomeRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        anoInicioRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        anoTerminoRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        projeto: Object
    }),
    created() {
        if(!this.novo) {
            this.$http.secured.get(`/api/v1/projetos/${this.idprojeto}`)
                .then(response =>{
                    this.projeto = response.data.data
                    this.nome = this.projeto.nomeProjeto
                    this.anoInicio = this.projeto.inicio
                    this.anoTermino = this.projeto.termino
                    this.resumo = this.projeto.resumo
                    this.alunos = response.data.alunos
                    }
                )
                .catch(error => this.setError(error, 'Nao consegue achar projeto'))
        }
    },
    methods: {
        salvar() {
            this.$emit('salvar')
            if(this.novo) {
                this.$http.secured.post('/api/v1/projetos/', {
                    nomeProjeto: this.nome,
                    inicio: this.anoInicio,
                    termino: this.anoTermino,
                    resumo: this.resumo
                })
            } else {
                this.$http.secured.patch(`/api/v1/projetos/${this.projeto.id}`, {
                    nomeProjeto: this.nome,
                    inicio: this.anoInicio,
                    termino: this.anoTermino,
                    resumo: this.resumo
                })
            }
        },
        fecharDialogo() {
            this.$emit('fechar')
        }
    }
}
</script>
