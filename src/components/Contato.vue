<template>
    <v-container>
        <v-toolbar dark color="#3b5998">
            <v-toolbar-title class="white--text">Contato</v-toolbar-title>
        </v-toolbar>
        <div class="item elevation-5">
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
                <v-layout>
                    <v-flex xs12>    
                        <router-link to="/">
                        <v-btn  block class="text-capitalize font-weight-regular" color="#3b5998"  dark>Voltar</v-btn>
                        </router-link>
                    </v-flex>
                </v-layout>
            </v-container>
            </div>
    </v-container>
</template>

<style>
</style>

<script>
</script>