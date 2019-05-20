<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nome"
            :rules="nomeRules"
            label="Nome"
            required
        ></v-text-field>
        <v-text-field
            v-model="data"
            :rules="dataRules"
            label="Data"
            required
        ></v-text-field>
        <v-text-field
            v-model="categoria"
            :rules="categoriaRules"
            label="Categoria"
            required
        ></v-text-field>
        <!-- TODO inserir bibtex -->
        <v-btn color="success">Salvar </v-btn>
        <v-btn color="error"  >Voltar </v-btn>
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
        dataRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        categoriaRules: [
            v => !!v || 'Preenchimento necessário'
        ]
    })
}
</script>