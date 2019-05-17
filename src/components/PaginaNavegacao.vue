<template>
    <v-flex>
        <div class="text-xs-center">
            <v-container>
                <Menu /><br/>
                <Perfil />    
            </v-container>
        </div>
    </v-flex>
</template>

<style>
</style>

<script>
    import Menu from './Menu.vue'
    import Perfil from './Perfil.vue'
    // TODO Importar os outros
    export default {
        name: 'App',
        components: {
            Menu,
            Perfil
        }
    }
</script>
