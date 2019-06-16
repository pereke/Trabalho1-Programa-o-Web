<template>
    <v-flex>
        <div class="text-xs-center">
            <v-container px10>
            <v-card>
                <Menu @mudarPagina="atualizarPagina"/><br/>
                <v-container px5>
                    <component v-bind:is="paginaAtual"></component>
                </v-container> 
            </v-card>
            </v-container>
        </div>
    </v-flex>
</template>

<style>
</style>

<script>
    import Menu from './Menu.vue'
    import Perfil from './Perfil.vue'
    import Alunos from './Alunos.vue'
    import ProjetosPesquisa from './ProjetosPesquisa.vue'
    import Aulas from './Aulas.vue'
    import Publicacoes from './Publicacoes.vue'

    // TODO Importar os outros
    export default {
        name: 'App',
        components: {
            Menu,
            Perfil,
            Alunos,
            ProjetosPesquisa,
            Aulas,
            Publicacoes
        },
        data () {
            return {
                paginaAtual: Perfil
            }
        },
        methods: {
            atualizarPagina(novaPagina) {
                if(novaPagina == 'perfil') {
                    this.paginaAtual = Perfil
                }
                else if (novaPagina == 'alunos') {
                    this.paginaAtual = Alunos
                }
                else if (novaPagina == 'projetosPesquisa') {
                    this.paginaAtual = ProjetosPesquisa
                }

                else if (novaPagina == 'aulas') {
                    this.paginaAtual = Aulas
                }
                else if (novaPagina == 'publicacoes') {
                    this.paginaAtual = Publicacoes
                }
            }
        }
    }
</script>
