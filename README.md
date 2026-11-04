# PIZZARIA ONLINE

## PROJETO INTEGRADOR — MODELAGEM DE DADOS

**Grupo 8 — Pizzaria 100% Online**

---

## 1. SOBRE O PROJETO

O projeto Pizzaria Online tem como objetivo desenvolver a modelagem e a implementação de um banco de dados para uma pizzaria que realiza suas operações totalmente pela internet.

O sistema foi pensado para organizar as informações relacionadas aos clientes, endereços, produtos, pedidos, pagamentos, entregas, cupons, ingredientes, estoque e promoções.

## 2. OBJETIVO

Desenvolver uma estrutura de banco de dados organizada, capaz de armazenar e relacionar as principais informações necessárias para o funcionamento de uma pizzaria online.

O projeto também busca aplicar os conhecimentos de modelagem de dados, normalização, criação de tabelas, relacionamentos, integridade e consultas SQL.

## 3. TECNOLOGIAS UTILIZADAS

- **MySQL:** criação e gerenciamento do banco de dados.
- **SQL:** definição das tabelas, relacionamentos, restrições e consultas.
- **MySQL Workbench:** ambiente utilizado para executar e consultar os comandos SQL.
- **GitHub:** armazenamento e organização dos arquivos do projeto.

## 4. ESTRUTURA DO BANCO DE DADOS

O banco de dados é composto por 12 tabelas:

1. Cliente
2. Endereco
3. Produto
4. Pedido
5. Item_Pedido
6. Pagamento
7. Entregador
8. Entrega
9. Cupom
10. Ingrediente
11. Estoque
12. Promocao

Cada tabela possui uma finalidade específica e relacionamentos definidos para manter a organização e a integridade das informações.

## 5. ORGANIZAÇÃO DOS ARQUIVOS

O projeto está organizado em pastas para facilitar a localização dos documentos, diagramas, scripts SQL e demais materiais desenvolvidos durante o trabalho.


Pizzaria-Online/
│
├── README.md
│
├── docs/
│   ├── requisitos/
│   ├── diagramas/
│   ├── dicionario-dados/
│   ├── normalizacao/
│   └── bi-e-ia/
│
├── sql/
│   ├── ddl/
│   │   └── estrutura_banco.sql
│   ├── dados/
│   │   └── dados_teste.sql
│   ├── consultas/
│   │   ├── consultas_gerenciais.sql
│   │   ├── consultas_auditoria.sql
│   │   └── consultas_gerenciais_e_auditoria.pdf
│   └── auditoria/
│       └── comandos_auditoria.sql
│
├── evidencias/
│
└── apresentacao/


Além desses arquivos, a pasta `docs/` contém a documentação geral do script SQL e os demais documentos do projeto.

## 6. DOCUMENTAÇÃO

A pasta `docs/` reúne os documentos relacionados ao desenvolvimento e à modelagem do projeto, incluindo:

- Requisitos funcionais e não funcionais.
- Regras de negócio e políticas.
- Problemas e necessidades identificados.
- Dicionário de dados.
- Normalização do banco de dados.
- Dependências funcionais e justificativas da modelagem.
- Documentação do script SQL.
- Documentação de BI e Inteligência Artificial.
- Diagrama Entidade-Relacionamento (DER).

## 7. ARQUIVOS SQL

A pasta `sql/` reúne os scripts utilizados na implementação e análise do banco de dados.

Sua organização está dividida em:

- **ddl/:** criação e estrutura das tabelas do banco de dados.
- **dados/:** inserção e atualização de registros para testes.
- **consultas/:** consultas gerenciais e de auditoria utilizadas para obter e analisar informações do banco.
- **auditoria/:** comandos de verificação e acompanhamento dos dados.

## 8. COMO EXECUTAR O BANCO DE DADOS

Para executar o projeto, é necessário ter o MySQL Server e o MySQL Workbench instalados.

Após abrir o MySQL Workbench e conectar ao servidor, os arquivos SQL devem ser executados na seguinte ordem:

**1. Criar a estrutura do banco**

Abrir e executar o arquivo:

`sql/ddl/estrutura_banco.sql`

Esse arquivo cria o banco de dados e suas respectivas tabelas.

**2. Inserir os dados de teste**

Abrir e executar:

`sql/dados/dados_teste.sql`

Esse arquivo insere os registros utilizados para testar o funcionamento do banco.

**3. Executar as consultas**

Abrir os arquivos:

- `sql/consultas/consultas_gerenciais.sql`
- `sql/consultas/consultas_auditoria.sql`

Esses arquivos apresentam consultas para análise dos pedidos, clientes, produtos, pagamentos e demais informações.

**4. Executar os comandos de auditoria**

Abrir e executar:

`sql/auditoria/comandos_auditoria.sql`

Esse arquivo contém verificações relacionadas aos registros e à integridade das informações.

As consultas podem ser executadas individualmente no MySQL Workbench para visualizar seus resultados.

**Observação:** a estrutura e os dados devem ser criados antes da execução das consultas gerenciais e de auditoria. Para executar novamente desde o início, considere que o banco já pode existir no servidor.

## 9. EVIDÊNCIAS

A pasta `evidencias/` reúne capturas de tela que demonstram a criação das tabelas, a inserção dos dados e a execução das consultas e verificações realizadas no MySQL Workbench.

## 10. INTEGRANTES

**Grupo 8 — Pizzaria Online**

1. Vinicius Queiroz
2. Arthur
3. Cristiano
4. Julio
5. João Gabriel
6. Giovanni
7. Heitor
8. Higor Santos
9. Kauan
10. Yasmin

## 11. CONSIDERAÇÕES FINAIS

O projeto demonstra a aplicação dos conceitos de modelagem de dados na construção de um banco de dados para uma pizzaria totalmente online.

A estrutura desenvolvida busca facilitar o armazenamento, o relacionamento, a consulta e a análise das informações, além de permitir futuras melhorias e integrações.

O desenvolvimento também proporcionou a aplicação prática dos conhecimentos adquiridos durante a disciplina de Modelagem de Dados.