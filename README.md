# Plataforma para Geotecnologias

## Qual a finalidade deste projeto?

Quando este projeto iniciou, o projeto tinha como objetivo o conteúdo navegável da pasta __"protótipo"__ com todas as funcionalidades ali visíveis. Por isso, antes de entender qualquer coisa nesse projeto, você precisa baixar essa pasta e navegar por ela, tendo em mente que o sistema se divide em 2 ambientes ("Cliente" e "Administração"). Para navegar, não é necessário nenhuma instalação visto que são apenas arquivos HTML para se gerar um protótipo simples e nevagável.

Após fechar os conceitos e funcionalidades vistas no protótipo, passou-se então a tecnologia, onde foi colocado como meta os seguintes tópicos:

1. Ser um sistema onde teria o uso de mapas + informações (conceito de SIG) para N finalidades.
2. Ser um sistema orientado a serviço, ou seja, todo o server seria baseado em RESTFul para atender as demandas de fronts, sejam eles quais forem.
3. Ter módulo que permitissem o uso de dados existente em outro locais.
4. Possibilitar o uso da ferramenta Fusion Table do Google

## A Arquitetura utilizada

Baseado nesses pontos, foi planejado a seguinte arquitetura para esse projetos:

             UI 1          UI 2           UI 3
          
                             |
            
                      Pool JavaScript
          

                             |

                         API Server
 
            /                |                |            \

      DataServer 1     DataServer 2     DataServer 1      FusionTable



Frente ao esboço de diagrama acima, foram construídos:
- __Pool JavaScript__: Uma bilbioteca própria que faz a gestão completa dos estados e ações que estão em atividade no front-end do usuários, seja em qual plataforma web esteja (desde que suporte a execução de JavaScrip, claro). Sobre esse projeto, uma mais detalhes em https://github.com/aleemerich/JS-TaskManager onde há o detalhamento dessa biblioteca.
- __API Server__: Aplicação Rails e MySQL (sem views) para que garantisse a segurança e o provimento de informações às inrtefaces. 
- __Datas Server__: Aplicação Rails que seria distribuída para ser instalada em qualquer servidor e que faria a integração de dados através de uma API RESTFul com qualquer banco de dados de cliente, sem a necessidade de se levar todo o sistem para dentro do ambiente do cliente, mas possibilitando o consumo dos dados por ser sempre feito de fonte fixa e conhecida, através de protocolo amplamente utilizado no mercado. Esses  serviços faziam suas validações no "API Server" com relação a autenticação e segurança.

##  Como utilizar

A primeira coisa a se fazer é especificar o local onde a aplicação "API Server" será instalada e utilizada. Esta aplicação precisa suportar os seguintes requisitos:
- __Ruby on Rails 3.0__
- __MySQL__ (scrip de construção do banco estãoo na pasta DOC).

Por padrão, essa aplicação tem embutida o "[JS Task Maneger](https://github.com/aleemerich/JS-TaskManager)" como principal ferramenta de mensageria e controle do front-end. Essa biblioteca está localizada dentro da pasta de uma das pastas contidas em "Public -> JS" com o nome de "Arich". É de vital importância que você entenda o funcionamento desta bibliteca para que consiga fazer o sistema funcionar adequadamente, dado que ela é responsável, dentre outras coisas, pela criação de todo layout da aplicação (que deve estar na tabela "template" do banco de dados).

Uma vez instalado a aplicação, será necessário alimentar os Scripts e Secript_Detais para que a bilbioteca "[JS Task Maneger](https://github.com/aleemerich/JS-TaskManager)" passe a funcionar e você consiga efetivamente ver algo aconteendo em seu navegador. Isso se inicia acessando o arquivo "index.html" para acesso a área do cliente ou "index_adm.html" para acesso a área de administração do site, ambos na pasta "public" da aplicação.

O fluxo macro de funcionamento do "API Server" + "[JS Task Maneger](https://github.com/aleemerich/JS-TaskManager)" é:

1. O usuário acesso o index.html para iniciar a carga através do arquivo "start.js" 
2. Carregam-se todos os JS e CSS necessários e o JavaScript passa então a executar as tarefas (inicialmente no arquivo "start.js" e depois no "main.js", onde há o carregamento das configurações principais então a operação se inicia);
3. Neste ponto, uma tela de autenticação é apresentada ao usuário, que deve se autenticar e entrar no ambiente desejado.
4. Uma vez dentro do ambiente (seja ele "client" ou "admin"), todas as operações são realizadas confor a orquestração do "[JS Task Maneger](https://github.com/aleemerich/JS-TaskManager)"

Lembrando que este sistema foi projetado para ser um sistema de informaçãoes geográficas (SIG), portanto a maioria das estruturas que serão encontrada tem haver com essa naturesa. Sendo assim, para que você consiga inserir um layer padrão, você precisa:

a. Criar um fonte de dados (Data Table) que aceitará o cadastro de tabelas Google Fusion Tables
b. Criar um layer de dados, com as informações oriundas dessa tabela cadastradas
c. Escolher quais empreasas devem ter acesso a esses dados.

Nessa versão beta, o sistema apenas:
- Exibe dados de layers cadastrados e controla isso por usuário
- Exibe como "pano de fundo" mapas do Google ou de outras fontes de dados
- Permite a seleção de entidade dos layer cadastrados para que se veja seus atributos.

## Até onde se chegou

- A camada "Pool JavaScript" foi desenvolvida em uma versão beta que já mostrou ser totalmente viável e estável. 
- O "API Server" também foi feito em uma versão beta e atendeu plenamente aos requisitos que eram esperado.
- O acoplamento com a ferramenta Fusion Table foi feito e se tornou o primeiro (e único) repositório de dados a ser utilizado na ferramenta.
- A aplicação para distribuição "Data Server" não chegou em uma fase final, ficando somente restrita a seleções, mas sem a possibilidade de se realizar toda a operação de CRUD como era planejado.
- Além de Rails, MySQL, JS Task Manager e JQuery, uma biblioteca chamada _Open Layer_ (http://openlayers.org/) foi aplamente utilizada para propciar a visualização dos dados gráficos (mapas) na aplicação.
- Um dos motivos pelos quais os "Data Servers" não evoluiram como esperado foi o fato que os bancos aonde eles fossem acoplados deveriam conseguir realizar tarefas que envolvem inteligência geográfica (como seleção de dados por área). A codificação disso requeria um tempo que não houve para que se finalizasse todo o projeto. __Contudo, para aplicações que não lidem com objetos geográficos, a implementação desses serviços é de baixo custo programático__.

## Futuro

O objetivo de deixar aqui todos os fontes desse projeto é para poder ajudar a outros desenvolvedores a evoluir, aproveitar ideias, debater conceitos sobre o que foi feito e, principalmente, finalizar o projeto como forma de criarmos uma ferramenta robusta e open source para o mercado que quer lidar com geotecnologias.

