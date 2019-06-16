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
            required
        ></v-text-field>
        <v-text-field
            v-model="anoTermino"
            :rules="anoTerminoRules"
            label="Ano de Término"
            required
        ></v-text-field>
        <v-text-field
            v-model="resumo"
            :rules="resumoRules"
            label="Resumo"
            required
        ></v-text-field>
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
    data: () => ({
        valid: false,
        nome: '',
        anoInicio: '',
        anoTermino: '',
        resumo: '',
        nomeRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        anoInicioRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        anoTerminoRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        resumoRules: [
            v => !!v || 'Preenchimento necessário'
        ],
    }),
    methods: {
        salvar() {
            this.$emit('salvar')
        },
        fecharDialogo() {
            this.$emit('fechar')
        }
    }
}
</script>