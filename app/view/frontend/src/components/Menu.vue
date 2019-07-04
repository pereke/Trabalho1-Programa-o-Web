<template>
        <v-toolbar dark color="#3b5998" dense>
            <v-toolbar-title>NAVEGAÇÃO</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items  dark color="primary">
            <v-btn-toggle v-model="toggle_exclusive" class="transparent">
                <v-btn @click="mudaPagina('perfil')" flat>Perfil</v-btn>
                <v-btn @click="mudaPagina('alunos')" flat>Alunos</v-btn>
                <v-btn @click="mudaPagina('projetosPesquisa')" flat>Projetos de pesquisa</v-btn>
                <v-btn @click="mudaPagina('aulas')" flat>Aulas</v-btn>
                <v-btn @click="mudaPagina('publicacoes')" flat>Publicações</v-btn>
            </v-btn-toggle>
            <v-btn  @click= "signOut()" icon flat color="red">
            <v-icon>clear</v-icon>
            </v-btn>
            </v-toolbar-items>
        </v-toolbar>
</template>



<style>
</style>

<script>
export default {
    data() {
        return {
            toggle_exclusive: 0
        }
    },
    methods: {
        mudaPagina(novaPagina) {
            this.$emit('mudarPagina', novaPagina)
        },
        signOut() {
            this.$http.secured.delete('/signin')
            delete localStorage.csrf
            delete localStorage.signedIn
        }
    }
}
</script>
