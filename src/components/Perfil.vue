<template>
    <v-layout row wrap justify-center style="height: 70%;">
        <v-flex xs4>
            <v-container >
                <span class="display-1 black--text"> Bem vindo,Rafael Durelli</span>
                <br>
                <span class="display-1 black--text">Durelli@ufla.br</span>
                <br>
                <span class="display-1 black--text">35 999435476</span>
            </v-container>
        </v-flex>
        <v-flex sm12 md4 lg6 xs8>
            <v-container px-5>
                <label style="font-size:30px;">Formação: </label>
                <span style="white-space:pre-wrap; font-size:20px;">
                    * Professor de WEB
                    * Professor de Compliadores
                    * Canelada Master
                </span>
            </v-container>
        </v-flex>
        <v-flex xs12>
            <v-container px-5>
                <v-dialog v-model="dialog">
                
                <template v-slot:activator="{ on }">
                    <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark v-on="on" >Editar Informações</v-btn>
                </template>

                <v-card>
                    <v-card-title
                        class="headline grey lighten-2"
                        primary-title
                    > Editar Informações de Perfil
                    </v-card-title>
                    <v-card-text>
                        <EditarPerfil />
                    </v-card-text>
                </v-card>
                </v-dialog>
            </v-container>
        </v-flex>
    </v-layout>

    
</template>

<style>
</style>

<script>
    import EditarPerfil from './EditarPerfil.vue'

    export default {
        name: "App",
        components: {
            EditarPerfil
        },
        data() {
            return {
                dialog: false
            }
        }
    }
</script>