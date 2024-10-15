# **EXERCÍCIOS PARA CASA**

## Guia de Símbolos:

    [ ❌ ] - Não finalizado.

    [ ✔️ ] - Finalizado.

## [ ❌ ] Exercício da Aula 10 - Constraints 2

(🗺️) - [[Caminho]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/Casa/Aula10_Casa_Ex_Constraints2.sql)

### Descrição:

- [ ✔️ ] - Criar as tabelas, em SQL Server, considerando o domínio de uma mecânica, conforme modelado:

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/Casa/Imagens/Imagem%20do%20WhatsApp%20de%202024-10-15%20à(s)%2015.59.33_12ff2830.jpg)

- Foram delimitadas as seguintes restrições:
    - [ ❌ ] - *O ID do cliente é auto incremental partindo de 3401 e incrementando de 15 em 15*
    - [ ❌ ] - *O ID do funcionário é auto incremental partindo de 101 e incrementando de 1 em 1*
    - [ ❌ ] - *O ID da peça é auto incremental partindo de 3411 e incrementando de 7 em 7*
    - [ ❌ ] - *O ID da categoria é auto incremental partindo de 1 e incrementando de 1 em 1*
    - [ ❌ ] - *Nenhum número de endereço é negativo*
    - [ ❌ ] - *Todos os CEP de endereços devem ter 8 dígitos*
    - [ ❌ ] - *Se não preenchida, a data do reparo deve ser a data de hoje*
    - [ ❌ ] - *A oficina só trabalha com carros de modelo superior a 1997*
    - [ ❌ ] - *A oficina só trabalha com carros de fabricação superior a 1997*
    - [ ❌ ] - *O ano do modelo deve ser igual ou 1 ano superior ao ano de fabricação*
    - [ ❌ ] - *Não existem preços, custos, tempo ou valores negativos*
    - [ ❌ ] - *Telefones podem ser fixos ou celulares, tendo 10 ou 11 dígitos*
    - [ ❌ ] - *Categorias de Habilitação devem ser A, B, C, D ou E*
    - [ ❌ ] - *Todas as peças devem ter, ao menos, 10 unidades em estoque*
    - [ ❌ ] - *No Brasil, toda placa de veículo tem 7 caracteres*
    - [ ❌ ] - *Cada peça tem nome diferente*
    - [ ❌ ] - *As categorias de funcionários são estagiário, Nível 1, Nível 2 ou Nível 3 e seguem os valores:*
        - [ ❌ ] - *Estagiário: Mais de R$15,00 / hora*
        - [ ❌ ] - *Nível 1: Mais de R$25,00 / hora*
        - [ ❌ ] - *Nível 2: Mais de R$35,00 / hora*
        - [ ❌ ] - *Nível 3: Mais de R$50,00 / hora*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================

## [ ❌ ] Exercício da Aula 10 - Constraints 3

### Descrição:

- [ ❌ ] - Criar as tabelas, em SQL Server, considerando o domínio de uma Maternidade, implementado na aula passada(https://pastebin.com/AuAJFJgP), conforme modelado:

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/Casa/Imagens/Imagem%20do%20WhatsApp%20de%202024-10-15%20à(s)%2015.50.28_25733604.jpg)

- Foram delimitadas as seguintes restrições:

    - *Para a tabela mãe:*

        - [ ❌ ] - *O ID é auto incremental, iniciando em 1001 e indo de 1 em 1*
        - [ ❌ ] - *Número de porta não pode ser negativo*
        - [ ❌ ] - *CEP deve ter 8 dígitos*
        - [ ❌ ] - *Telefone deve ter 10 dígitos*

    - *Para a tabela medico:*

        - [ ❌ ] - *Celular deve ter 11 dígitos*
        - [ ❌ ] - *Celular não pode repetir*

    - *Para a tabela bebe:*

        - [ ❌ ] - *O ID é auto incremental, iniciando em 1 e indo de 1 em 1*
        - [ ❌ ] - *Se não preenchida, a data de nascimento é o dia de hoje*
        - [ ❌ ] - *Altura não pode ser negativa*
        - [ ❌ ] - *Peso não pode ser negativo*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================
