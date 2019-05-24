<template>
    <v-container>
        <v-container>
            <v-layout>
                <v-flex xs4>
                    <v-container px-5>
                        <v-card>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Professor:  Rafael Durelli</label><br>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">E-mail: durelli@ufla.br</label><br>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Telefone: (35) 9 9943-5476</label>  
                        </v-card>
                    </v-container>
                </v-flex>
                <v-flex xs8>
                    <v-container px-5>
                        <label class="grey--text text--darken-3 font-weight-regular" style="font-size:20px;">Formação: </label>
                            <v-card>
                                <v-card-title primary-title>
                                <div>
                                Lorem ipsum sagittis ullamcorper iaculis viverra magna nam hac ipsum, fermentum lacus fermentum proin erat convallis class ut, bibendum rhoncus donec nulla class aliquam vitae lorem. placerat magna varius mauris faucibus sem sodales aliquet porttitor aptent eros hendrerit eu erat donec, odio dictumst aenean luctus litora condimentum pretium rhoncus aptent accumsan donec litora praesent. volutpat porttitor netus ad feugiat porta tortor a, aenean platea imperdiet amet rhoncus nullam cubilia, at quam praesent eros vulputate proin. aptent neque eget porttitor faucibus feugiat a sagittis elit bibendum, tincidunt ultrices ad ipsum congue dolor per placerat pharetra, ad posuere lacus fringilla dolor rutrum cursus nunc. 
                                </div>
                                </v-card-title>
                            </v-card>
                    </v-container>
                </v-flex>
            </v-layout>
        </v-container>
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
    </v-container>
    
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