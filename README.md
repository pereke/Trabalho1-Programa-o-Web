# Trabalho1-Programação-Web
## Site para um professor gerenciar seu trabalho

O Presente projeto tem por objetivo a criação de um sistema WEB para um docente/pesquisador gerenciar suas atividades. Possui ferramentas para cadastro, listagem e manutenção de projetos, alunos, disciplinas, publicações e informações pessoais.

## Tecnologias Utilizadas
**Front-End**

**Vue**: Vue é um **framework progressivo** para a construção de interfaces de usuário. Ao contrário de outros frameworks monolíticos, Vue foi projetado desde sua concepção para ser adotável incrementalmente. A biblioteca principal é focada exclusivamente na camada visual (view layer), sendo fácil adotar e integrar com outras bibliotecas ou projetos existentes. Por outro lado, Vue também é perfeitamente capaz de dar poder a sofisticadas Single-Page Applications quando usado em conjunto com **ferramentas modernas** e **bibliotecas de apoio**. fonte: <https://br.vuejs.org/v2/guide/index.html>

**Back-End**

**Ruby on Rails**:Rails é uma estrutura de desenvolvimento de aplicativos da web escrita na linguagem de programação Ruby. Foi projetado para facilitar a programação de aplicativos da WEB, fazendo suposições sobre o que todo desenvolvedor precisa para começar. Permite que você escreva menos código enquanto realiza mais do que muitas outras linguagens e frameworks. Desenvolvedores experientes do Rails também relatam que isso torna o desenvolvimento de aplicativos da Web mais divertido. fonte: <https://guides.rubyonrails.org/getting_started.html>. O grupo decidiu pela linguagem e pelo Framework pois, além de um conhecimento novo a ser adquirido, o Ruby on Rails é um framework que facilita a criação dos modelos e persistência dos dados.

##  Política de uso do git

1. **Commit**: Commits devem representar funcionalidades descritas através dos *issues* organizadas no backlog. Cada commit pode ser divido em tres subgrupos de forma a padronizar seu uso: 
* **Conclusão de uma *issue***: A mensagem do commit deve possuir  uma das seguintes  palavras chaves *close*, *closes*, *closed*, *resolve*, *resolves*, *resolved*  seguido do hastag e número da issue correspondente. 
* **Fix de uma funcionalidade**: A mensagem  do commit deve possuir uma das seguintes palavras chaves *fix*, *fixes*, *fixed* seguido do hastag e número da issue correspondente.
* **Conclusão parcial de uma *issue***: A mensagem  do commit deve ser constituida da plavra chave *parcial* seguida do hastag e o número da issue correspondente.

2. **Branch**: Existem dois tipos de branches sem citar a master. Branch de teste, que representa a branch em que as funcionalidades commitadas passam por testes, formalizando conclusões sobre a necessidade de correções,  se a funcionalidade desenvolvida acrescenta algo ao sistema ou se está de acordo com os requesistos documentados no backlog. Branch da iteracão, que possui um backup da master, é nela em que as funcionalidades criadas e testadas são integradas ao restante do sistema, observando qualquer incoerência ou conflito com o que já foi desenvolvido e suficientemente testado. 

3. **Master**: Na master estará localizado a ultima versão estável do sistema. A merge é protegida, portanto, com exceção do dono do projeto, commits diretamente na merge são bloqueados e devem passar por uma revisão de código por parte do dono do projeto. A master armazena o código que será referenciando na baseline do sistema.

## Instalação

1. Instale o ruby 2.6.2 na sua máquina. Utilizando o rbenv, o comando é:

`$ rbenv install 2.6.2`
`$ rbenv global 2.6.2`

2. Baixe e instale o yarn:

<https://yarnpkg.com/en/>

3. Adicione o bundler utilizando o gem:

`$ gem install bundler`

4. Faça o download do projeto e entre em seu diretório:

`$ git clone https://github.com/pereke/Trabalho1-Programacao-Web` 
`$ cd Trabalho1-Programacao-Web`

5. Faça o download dos pacotes necessários utlizando o yarn:
`$ yarn install`

6. Faça o download das gems utilizando o bundler:
`$ bundle install`

7. Crie e migre o banco de dados:
`$ bin/rails db:create db:migrate`

## Execução

Para executar, entre no diretório do projeto e execute:
`$ bin/rails server`
