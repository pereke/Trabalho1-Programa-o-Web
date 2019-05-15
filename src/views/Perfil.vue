<template>
    <v-layout row wrap justify-center style="height: 70%;">
        <v-flex xs12 > 
            <v-container >
                <v-icon style="font-size: 100px;" color="black">email</v-icon>
                <span class="display-2 black--text">Contato</span>
            </v-container>
        </v-flex>
        <v-flex xs4>
            <v-container >
                <span class="display-1 black--text">Rafael Durelli</span>
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
                
                <router-link to="/">
                
                <v-btn class="text-capitalize font-weight-regular" color="#3b5998"  dark >Editar Informações</v-btn>

                </router-link>
            </v-container>
        </v-flex>
    </v-layout>

    
</template>

<style>
</style>

<script>
</script>