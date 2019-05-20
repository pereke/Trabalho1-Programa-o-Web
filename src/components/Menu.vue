<template>
    <v-container>
        <v-toolbar>
            <v-toolbar-title>Navegação</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items class="hidden-sm-and-down">
            <v-btn-toggle v-model="toggle_exclusive">
                <v-btn @click="mudaPagina('perfil')" flat>Perfil</v-btn>
                <v-btn @click="mudaPagina('alunos')" flat>Alunos</v-btn>
                <v-btn @click="mudaPagina('projetosPesquisa')" flat>Projetos de pesquisa</v-btn>
                <v-btn @click="mudaPagina('aulas')" flat>Aulas</v-btn>
                <v-btn @click="mudaPagina('publicacoes')" flat>Publicações</v-btn>
            </v-btn-toggle>
            <router-link to="/">
                <v-btn flat color="red">Sair</v-btn>
            </router-link>
            </v-toolbar-items>
        </v-toolbar>
    </v-container>
</template>



<style>
</style>

<script>
export default {
    methods: {
        mudaPagina(novaPagina) {
            this.$emit('mudarPagina', novaPagina)
        }
    }
}
</script>