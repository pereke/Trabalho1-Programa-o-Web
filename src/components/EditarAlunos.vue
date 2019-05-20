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
            :items="categorias"
            label="Categoria"
        ></v-select>
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
        nomeCompleto: '',
        matricula: '',
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
    })
}
</script>