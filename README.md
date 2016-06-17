# Sejam bem vindos!

## Qual a finalidade deste projeto?

Quando este projeto iniciou, foi colocado como meta os seguintes tópicos:
1. Ser um sistema onde teria o uso de mapas + informações (conceito de SIG) para N finalidades.
2. Ser um sistema orientado a serviço, ou seja, todo o server seria baseado em RESTFul para atender as demandas de fronts, sejam eles quais forem.
3. Ter módulo que permitissem o uso de dados existente em outro locais.
4. Possibilitar o uso da ferramenta Fusion Table do Google

## A Arquitetura utilziada

Baseado nesses pontos, foi planejado a seguinte arquitetura para esse projetos:

             UI 1          UI 2           UI 3
          
                             |
            
                      Pool JavaScript
          

                             |

                         API Server

        /              |             |             \

DataServer 1    DataServer 2    DataServer 1    FusionTable


Frente ao esboço de diagrama acima, foram construídos:
- __Pool JavaScript__: Uma bilbioteca própria que faz a gestão completa dos estados e ações que estão em atividade no front-end do usuários, seja em qual plataforma web esteja (desde que suporte a execução de JavaScrip, claro). Sobre esse projeto, uma mais detalhes em https://github.com/aleemerich/GeoTools-Plataform onde há o detalhamento dessa biblioteca.
- __API Server__: Aplicação Rails e MySQL (sem views) para que garantisse a segurança e o provimento de informações às inrtefaces. 
- __Datas Server__: Aplicação Rails que seria distribuída para ser instalada em qualquer servidor e que faria a integração de dados através de uma API RESTFul com qualquer banco de dados de cliente, sem a necessidade de se levar todo o sistem para dentro do ambiente do cliente, mas possibilitando o consumo dos dados por ser sempre feito de fonte fixa e conhecida, através de protocolo amplamente utilizado no mercado. 

## Até onde se chegou

- A camada "Pool JavaScript" foi desenvolvida em uma versão beta que já mostrou ser totalmente viável e estável. 
- O "API Server" também foi feito em uma versão beta e atendeu plenamente aos requisitos que eram esperado.
- O acoplamento com a ferramenta Fusion Table foi feito e se tornou o primeiro repositório de dados a ser utilizado na ferramenta.
- A aplicação para distribuição "Data Server" não chegou em uma fase final, ficando somente restrita a seleções, mas sem a possibilidade de se realizar toda a operação de CRUD como era planejado.
- Além de Rails, MySQL, JS Task Manager e JQuery, uma biblioteca chamada Open Layer (http://openlayers.org/) foi aplamente utilizada para propciar a visualização dos dados gráficos (mapas) na aplicação.
- Um dos motivos pelos quais os "Data Servers" não evoluiram como esperado foi o fato que os bancos aonde eles fossem acoplados deveriam conseguir realizar tarefas que envolvem inteligência geográfica (como seleção de dados por área). A codificação disso requeria um tempo que não houve para que se finalizasse todo o projeto. __Contudo, para aplicações que não lidem com objetos geográficos, a implementação desses serviços é de baixo custo programático__.

# Futuro

O objetivo de deixar aqui todos os fontes desse projeto é para, quem sabe, possa ajudar a outros desenvolvedores a evoluir, aproveitar ideias. debater conceitos sobre o que foi feito e, principalmente, finalizar o projeto como forma de criarmos uma ferramenta robusta e open source para o mercado que quer lidar com geotecnologias.

