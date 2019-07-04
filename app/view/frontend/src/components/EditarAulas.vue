<template>
    <v-form v-model="valid">
        <v-text-field
            v-model="nome"
            :rules="nomeRules"
            label="Nome"
            required
        ></v-text-field>
        <v-select
            v-model="categoria"
            :items="categoriaItems"
            label="Categoria"
            required
        ></v-select>
        <v-text-field
            v-model="qtSemana"
            :rules="qtSemanaRules"
            label="Quantidade por semana"
            required
        ></v-text-field>
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
    props: ['idaula', 'novo'],
    data: () => ({
        aula: Object,
        materialDidatico: '',
        valid: false,
        nome: '',
        categoria: '',
        qtSemana: '',
        nomeRules: [
            v => !!v || 'Preenchimento necessário'
        ],
        categoriaItems: ['Graduação', 'Pós-Graduação'],
        qtSemanaRules: [
            v => !!v || 'Preenchimento necessário'
        ],
    }),
    created() {
        if(!this.novo) {
            this.$http.secured.get(`/api/v1/aulas/${this.idaula}`)
                .then(response =>{
                    this.aula = response.data.data
                    this.nome = this.aula.nomeAula
                    this.categoria = this.aula.categoria
                    this.qtSemana = this.aula.quantidade
                    this.materialDidatico = this.aula.materialDidatico
                    }
                )
                .catch(error => this.setError(error, 'Nao consegue achar aula'))

        }
    },
    methods: {
        salvar() {
            //let formData = new FormData()
            this.$emit('salvar')
            if(this.novo) {
                this.$http.secured.post('/api/v1/aulas/', {
                    nomeAula: this.nome,
                    quantidade: this.qtSemana,
                    categoria: this.categoria,
                    materialDidatico: this.materialDidatico
                })
            } else {
                this.$http.secured.patch(`/api/v1/aulas/${this.aula.id}`, {
                    nomeAula: this.nome,
                    quantidade: this.qtSemana,
                    categoria: this.categoria,
                    materialDidatico: this.materialDidatico
                })
            }
        },
        uploadFile() {
            this.materialDidatico = this.$refs.inputFile.files[0];
        },
        fecharDialogo() {
            this.$emit('fechar')
        }
    }
}
</script>
