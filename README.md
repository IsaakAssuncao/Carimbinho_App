# Carimbinho_App
Repositório do aplicativo Carimbinho 

Desenvolvido em DART + Flutter


## Flutter Modular

- **[O que é o Flutter Modular?](#o-que-é-o-flutter-modular)**
- **[Estrutura Modular](#estrutura-modular)**  
- **[Pilares do Modular](#pilares-do-modular)**  
  - [Exemplos](#exemplos)
  
- **[Começando com o Modular](#getting-started-with-modular)**
  - [Instalação](#instalação)
  - [Usando em um novo projeto](#usando-em-um-novo-projeto)
  - [Adicionando Rotas](#adicionando-rotas)
  - [Rotas dinâmicas](#rotas-dinâmicas)
  - [Proteção de Rotas](#proteção-de-rotas)
  - [Animação para Transição de Rota](#animação-para-transição-de-rota)
  - [Agrupando rotas](#agrupando-rotas)
  - [Rotas na url com Flutter Web](#rotas-na-url-com-flutter-web)
  - [Injeção de dependências](#injeção-de-dependências)
  - [Recuperando na view usando injeção](#recuperando-na-view-usando-injeção)

- **[Usando Modular widgets para recuperar suas classes](#usando-Modular-widgets-para-recuperar-suas-classes)**
  - [ModularState](#modularstate)
  - [Consumindo uma Classe ChangeNotifier](#consumindo-uma-classe-changenotifier)
  - [Criando Módulos Filhos](#criando-módulos-filhos)
  - [WidgetModule](#widgetmodule)
  - [RouterOutlet](#routeroutlet)
  - [Lazy Loading](#lazy-loading)
  - [Testes Unitários](#testes-unitários)
  - [DebugMode](#debugmode)

- **[Roadmap](#roadmap)**
- **[Funcionalidades e Bugs](#funcionalidades-e-bugs)**

## O que é o Flutter Modular?

Quando um projeto vai ficando grande e complexo, acabamos juntando muitos arquivos em um só lugar, isso dificulta a manutenção do código e também o reaproveitamento.
O Modular nos trás várias soluções adaptadas para o Flutter como Injeção de Dependências, Controle de Rotas e o Sistema de "Singleton Descartáveis" que é quando o provedor do código se encarrega de "chamar" o dispose automaticamente e limpar a injeção (prática muito comum no package bloc_pattern).
O Modular vem preparado para adaptar qualquer gerência de estado ao seu sistema de Injeção de Dependências inteligente, gerenciando a memória do seu aplicativo.

## Estrutura Modular

O Modular nos traz uma estrutura que permite gerenciar a injeção de dependencias e rotas em apenas um arquivo por módulo, permitindo organizar nossos arquivos a partir desta idéia. Quando todos as paginas, controllers, blocs (e etc..) estiverem em uma pasta e reconhecidos por esse arquivo principal, a isso damos o nome de módulo, pois nos propocionará fácil manutenabilidade e principalmente o desacoplamento TOTAL do código para reaproveitamento em outros projetos.

## Pilares do Modular

Aqui estão nossos focos principais com o package.

- Gerência Automática de Memória.
- Injeção de Dependências.
- Controle de Rotas Dinâmicas.
- Modularização de Código.

## Exemplos

- [Github Search](https://github.com/Flutterando/github_search)
