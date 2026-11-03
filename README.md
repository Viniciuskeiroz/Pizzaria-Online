# Pizzaria Online — Grupo 8

Projeto Integrador de Modelagem de Dados — ADS / UNICID.

## Sobre o projeto

O projeto propõe a organização dos dados de uma pizzaria que funciona exclusivamente pela internet. O banco de dados foi estruturado para apoiar o cadastro de clientes e endereços, produtos, pedidos, itens, pagamentos, entregas, cupons, promoções, ingredientes e estoque.

## Estrutura do repositório

- `docs/`: documentos do projeto, modelo lógico, normalização e material da primeira entrega.
- `diagramas/`: local destinado ao DER e aos fluxogramas atualizados.
- `sql/`: script de criação e alimentação do banco.
- `sql/consultas/`: consultas gerenciais e de auditoria.
- `evidencias/`: registros de testes e evolução do projeto.
- `apresentacao/`: material da apresentação final.

## Como executar o banco

1. Instale e abra o MySQL Workbench ou outro cliente MySQL compatível.
2. Abra `sql/Pizzaria Online.sql`.
3. Execute o script em um ambiente de testes.
4. Confira a criação do banco `pizzaria_online`, as tabelas, os dados de exemplo e as consultas.

> Execute primeiro em ambiente de testes. O script cria e altera estruturas e insere/atualiza dados.

## Documentos

- [Modelo lógico](docs/Modelo_Logico_Grupo_8_Pizzaria.docx)
- [Normalização](docs/Normalizacao_Grupo_8_Pizzaria.docx)
- [Respostas da primeira entrega](docs/Primeira_Entrega_Respostas.pdf)
- [Script SQL](sql/Pizzaria%20Online.sql)

## Consultas gerenciais e de auditoria

As consultas adicionais estão em `sql/consultas/consultas_gerenciais_auditoria.sql`. Elas permitem acompanhar pedidos por status, produtos mais vendidos, estoque abaixo do mínimo e entregas pendentes.

## BI e possibilidades de IA

Os dados podem apoiar indicadores como faturamento, ticket médio, produtos mais vendidos, estoque e desempenho das entregas. Futuramente, podem alimentar dashboards de BI e análises com IA, como previsão de demanda e recomendação de produtos. Essas possibilidades não estão implementadas neste projeto.

## Pendências antes da entrega

- Adicionar o DER/fluxogramas finais em `diagramas/`.
- Conferir se os integrantes e a divisão de contribuições estão atualizados.
- Registrar evidências de execução e testes do SQL.
- Completar a apresentação final.
- Revisar o README após inserir todos os arquivos finais.
