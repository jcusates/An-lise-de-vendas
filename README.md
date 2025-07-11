# 🧠 Análise de Dados Simulada – Replicando Processo de Decisão Real

Este projeto tem como objetivo replicar o **processo de pensamento analítico e de tomada de decisão** baseado em dados, tal como foi exigido de mim no ambiente corporativo.

Como os dados da empresa são confidenciais, **gerei uma base fictícia usando a biblioteca [`faker`](https://faker.readthedocs.io/en/master/)**, simulando uma estrutura semelhante à que enfrentei profissionalmente.

---

## ⚙️ Ferramentas Utilizadas

- **BigQuery**: para manipulação de dados estruturais com SQL, criação de filtros e aplicação de regras de negócio
- **Python**: para gerar dados fictícios e documentar o processo
  - `faker`: geração de dados falsos estruturados
  - `pandas`, `numpy`: para manipulação adicional, se necessário

---

## 🗂 Estrutura do Projeto

```bash
.
├── data/                   # Base de dados gerada com faker
│   └── base_simulada.csv
├── notebooks/              # Notebooks com análise e modelagem de negócios
│   └── analise_bigquery.ipynb
├── src/                    # Scripts Python (ex: geração de dados, ETL)
│   └── gerar_dados.py
├── reports/                # Relatórios ou prints de resultados relevantes
└── README.md               # Este documento
