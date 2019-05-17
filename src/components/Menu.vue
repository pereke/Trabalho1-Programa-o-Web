<template>
    <v-container>
        <v-toolbar>
            <v-toolbar-title>Title</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items class="hidden-sm-and-down">
            <v-btn-toggle v-model="toggle_exclusive">
                <v-btn flat>Perfil</v-btn>
                <v-btn flat>Alunos</v-btn>
                <v-btn flat>Projetos de pesquisa</v-btn>
                <v-btn flat>Aulas</v-btn>
                <v-btn flat>Publicações</v-btn>
            </v-btn-toggle>
            <v-btn flat color="red">Sair</v-btn>
            </v-toolbar-items>
        </v-toolbar>
    </v-container>
</template>



<style>
</style>

<script>
</script>