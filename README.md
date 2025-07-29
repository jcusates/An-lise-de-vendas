# 🧠 Análise de Dados Simulada – Replicando Processo de Decisão Real

Este projeto tem como objetivo replicar o **processo de pensamento analítico e de tomada de decisão** baseado em dados, tal como foi exigido de mim no ambiente corporativo.

Como os dados da empresa são confidenciais, **gerei uma base fictícia usando a biblioteca [`faker`](https://faker.readthedocs.io/en/master/)**, simulando uma estrutura semelhante à que enfrentei profissionalmente.

---

## ⚙️ Ferramentas Utilizadas

- **BigQuery**: para manipulação de dados com SQL, criação de filtros e aplicação de regras de negócio
- **Python**: geração dados fictícios 
  - `faker`: geração de dados falsos
  - `pandas`, `numpy`: para manipulação de tabelas e dados numéricos

---

## 🧩 Descrição do Caso
O objetivo desta análise é avaliar a evolução do comportamento de compra dos clientes ao longo do tempo, com base em três métricas fundamentais:

Faturamento total por data de compra

Quantidade de pedidos

Ticket médio (valor médio por pedido)

## 🔍 Pergunta de Negócio
Os clientes estão gastando mais ou menos nas compras seguintes?
Há aumento ou queda no volume de pedidos e no ticket médio ao longo do tempo?

Para isso, utilizei uma abordagem baseada em funções analíticas SQL (LAG) para comparar o desempenho atual de cada cliente com sua compra anterior.

## 🛠️ Metodologia Técnica
A análise foi construída em duas etapas principais:

Agregação dos dados de pedidos:

Utilizando JOIN entre as tabelas de clientes e pedidos, agrupei por cliente e por data de emissão.

Calculei:

valor_total: soma do valor geral dos pedidos no dia

pedidos_totais: contagem de pedidos

ticket_medio: valor_total / pedidos_totais

Comparação temporal com LAG():

Para cada cliente, comparei a compra atual com a anterior:

ticket_anterior, qtd_anterior, faturamento_anterior

Classifiquei a tendência de cada métrica como:

"Crescente" – valor atual > anterior

"Decrescente" – valor atual < anterior

"Igual" – sem variação

## 📈 Resultado
Com essa abordagem, foi possível:

Identificar clientes com padrão de crescimento ou queda

Destacar oportunidades de atuação proativa (como reengajamento de clientes com queda de performance)

Criar uma base sólida para futuras análises preditivas, como detecção de churn ou recomendação personalizada








