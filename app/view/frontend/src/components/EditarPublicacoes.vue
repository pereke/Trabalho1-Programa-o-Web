<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nome"
            :rules="nomeRules"
            label="Nome"
            required
        ></v-text-field>
        <v-text-field
            v-model="data"
            :rules="dataRules"
            label="Data"
            required
        ></v-text-field>
        <v-text-field
            v-model="categoria"
            :rules="categoriaRules"
            label="Categoria"
            required
        ></v-text-field>
        <v-text-field
            v-model="arquivoBib"
            :rules="arquivoBibRules"
            label="Arquivo Bibtex"
            required
        ></v-text-field>

        <!-- TODO inserir bibtex -->
        <v-btn color="success" @click="salvar()">Salvar </v-btn>
        <v-btn color="error"  @click="fecharDialogo()">Voltar </v-btn>
    </v-form>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>
export default {
    props: ['idpublicacao','novo'],
    data: () => ({
        publicacao: Object,
        valid: false,
        nome: '',
        data: '',
        categoria: '',
        arquivoBib: '',
        nomeRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        dataRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        categoriaRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        dataRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        arquivoBibRules: [
            v => !!v || 'Preenchimento necessário'
        ]

    }),
    created() {
        if(!this.novo) {
            this.$http.secured.get(`/api/v1/publicacaos/${this.idpublicacao}`)
                .then(response =>{
                    this.publicacao = response.data.data
                    this.nome = this.publicacao.nomePublicacao
                    this.data = this.publicacao.data
                    this.categoria = this.publicacao.categoria
                    this.arquivoBib = this.publicacao.arquivoBib
                    }
                )
                .catch(error => this.setError(error, 'Nao consegue achar publicacao'))
        }
    },
    methods: {
        salvar() {
            this.$emit('salvar')
            if(this.novo) {
                this.$http.secured.post('/api/v1/publicacaos/', {
                    nomePublicacao: this.nome,
                    data: this.data,
                    categoria: this.categoria,
                    arquivoBib: this.arquivoBib
                })
            } else {
                this.$http.secured.patch(`/api/v1/publicacaos/${this.publicacao.id}`, {
                    nomePublicacao: this.nome,
                    data: this.data,
                    categoria: this.categoria,
                    arquivoBib: this.arquivoBib
                })
            }

        },
        fecharDialogo() {
            this.$emit('fechar')
        }
    }
}
</script>
