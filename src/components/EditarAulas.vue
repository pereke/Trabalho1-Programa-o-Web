<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nome"
            :rules="nomeRules"
            label="Nome"
            required
        ></v-text-field>
        <v-text-field
            v-model="categoria"
            :rules="categoriaRules"
            label="Categoria"
            required
        ></v-text-field>
        <v-text-field
            v-model="qtSemana"
            :rules="qtSemanaRules"
            label="Quantidade por semana"
            required
        ></v-text-field>
        <!-- TODO inserir tabela com materiais didaticos -->
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
        categoria: '',
        qtSemana: '',
        nomeRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        categoriaRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        qtSemanaRules: [
            v => !!v || 'Preenchimento necessário'
        ],
    })
}
</script>