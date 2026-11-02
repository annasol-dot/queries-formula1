# 🏎️ Trabalho DML – Modelagem de Dados: Fórmula 1

Esse projeto foi desenvolvido por mim e pelo meu grupo da faculdade para um trabalho de `Modelagem de Banco de Dados`. O objetivo é analisar e entender o cenário de Fórmula 1, criar o banco de dados db_formula1, popular todas as tabelas e resolver as queries propostas. 

## 🗂️ Sobre as tabelas

O banco é composto por 5 tabelas:
 
| Tabela | Atributos | Descrição |
|---|---|---|
| `paises` | **codigo** (PK), nome | Países de origem de pilotos, equipes e GPs |
| `equipes` | **sigla** (PK), nome, cod_pais | Equipes participantes |
| `pilotos` | **numero** (PK), nome, cod_pais, sigla_equipe | Pilotos e suas equipes |
| `corridas` | **sigla_gp** (PK), nome_gp, cod_pais, qtd_voltas | Grandes Prêmios |
| `participantes` | **sigla_gp** (PK), **num_piloto** (PK), posicao_largada | Pilotos que disputaram cada GP |

## 🔎 Queries propostas
 
1. Listar o nome dos países que começam com a letra **B** e terminam com a letra **L**.
2. Listar o nome dos pilotos dos países **Brasil**, **Itálai** e  **França**.
3. Listar os nomes dos pilotos.
4. Listar o nome dos GPs e a quantidade de voltas (usando `ALIAS`)
5. Listar o nome dos pilotos e seus países.
6. Inserir o atributo `salario` na tabela `pilotos`
7. Popular o atributo `salario` da tabela `pilotos`.
8. Listar o nome dos pilotos cujos salários estejam entre **70 e 100 mil**.
9. Retornar, para cada `cod_pais`, a **média salarial** dos pilotos.
10. Exibir todos os diferentes valores de salário da tabela `pilotos`, em **ordem crescente**.

## 🛠️ Tecnologias utilizadas

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)

## ▶️ Como executar
 
1. Crie o banco de dados:
```sql
   CREATE DATABASE db_formula1;
   USE db_formula1;
```
2. Crie as tabelas conforme o modelo acima.
3. Execute os scripts de inserção para popular as tabelas.
4. Execute as queries na ordem em que estão listadas.
