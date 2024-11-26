# **EXERCÍCIOS EM SQL - CONSTRAINTS**

## Guia de Símbolos:

    [ ❌ ] - Não finalizado.

    [ ✔️ ] - Finalizado.

## Contexto para cada Operação:

- [ 📑 ] *Primeiro, começo escrevendo, em comentário mesmo, dois comandos que servirão na necessidade de resetar a database. Os comandos são:*

      USE master
      DROP DATABASE 'nome_da_database'

- [ 📑 ] *Basta selecionar somente essas duas linhas e clicar para executar no Microsoft SQL Server Management Studio, que o trabalho foi feito. Só selecionar todo o código novamente (isso com os dois comandos citado em comentário), e colocar para executar que a database foi resetada.*

- [ 📑 ] *Agora, para finalmente criar a database, há dois passos e 4 comandos, que são:*

      CREATE DATABASE 'nome_da_database'
      GO
      USE 'nome_da_database'
      GO    

- [ 📑 ] *O uso do GO é para que sejam executados os comandos em passo a passo. Para a criação de tabelas, o corpo do código é bem básico, onde você delimita onde inicia e onde finaliza com parênteses. Entre esses delimitadores, é onde determina os atributos/colunas da tabela, especificando o tipo e se pode iniciar vazio ou não.*

- [ 📑 ] *As keys são bem simples de serem declaradas, onde a PRIMARY KEY é apenas colocar o nome do atributo que vai ser a chave primária dentro de um parênteses, enquanto a FOREIGN KEY é um pouquinho mais verboso, precisando, também colocar daonde está referenciando, citando a tabela e o nome do atributo dessa tabela que a chave referencia. Agora, as restrições ficam depois do NULL/NOT NULL.*

      CREATE TABLE 'nome_da_tabela' (
  
      nome_atributo1        TIPO        NULL/NOT NULL        IDENTITY(1, 1),
      nome_atributo2        TIPO        NULL/NOT NULL        CHECK(nome_atributo2 > 0)

      PRIMARY KEY(nome_atributo1)
      FOREIGN KEY(nome_atributo2) REFERENCES 'tabela_referenciada'('atributo_estrangeiro')
  
      )
      GO

- [ 📑 ] *Se há mais de um atributo na tabela, é obrigatório o uso de vírgula no final da linha, mas podendo quebrar a linha a fim de organizar o código, apenas precisando colocar a vírgula no final, como se fosse tudo numa linha só. Isso também vale para as chaves e outros comandos.*

## [ ✔️ ] Exercício da Aula 10 - Constraints 1

(🗺️) - [[Código]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/constraints/Ex_Constraints1.sql)

### Descrição:

- [ ✔️ ] - Criar as tabelas, em SQL Server, considerando o domínio de uma livraria, conforme modelado:

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-10-15%20à(s)%2019.04.15_0b81bcf8.jpg)

- Foram delimitadas as seguintes restrições:
  - [ ✔️ ] - *O código do livro é auto incremental partindo de 100001 e incrementando de 100 em 100*
  - [ ✔️ ] - *O código do autor é auto incremental partindo de 2351 e incrementando de 1 em 1*
  - [ ✔️ ] - *O código da editora é auto incremental partindo de 491 e incrementando de 16 em 16*
  - [ ✔️ ] - *Por lei, o ISBN deve ter 13 dígitos*
  - [ ✔️ ] - *O nome do autor é único*
  - [ ✔️ ] - *O nome da editora é único*
  - [ ✔️ ] - *Se não preenchida, a língua dos livros é ‘PT-BR’*
  - [ ✔️ ] - *Não são cadastrados livros de ano inferior a 1990*
  - [ ✔️ ] - *Não são cadastrados livros de edição inferior a 1993*
  - [ ✔️ ] - *Não existem preços negativos*
  - [ ✔️ ] - *Não existem livros com menos de 15 páginas*
  - [ ✔️ ] - *Não existem Números de Endereços negativos*
  - [ ✔️ ] - *Telefones são fixos devem ter 10 dígitos*
  - [ ✔️ ] - *No Brasil, todo CEP tem 8 caracteres*
  - [ ✔️ ] - *Só são cadastrados livros de autores do Brasil, Estados Unidos, Inglaterra e Alemanha*
 
## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================

## [ ✔️ ] Exercício da Aula 10 - Constraints 2

(🗺️) - [[Código]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/constraints/Ex_Constraints2.sql)

### Descrição:

- [ ✔️ ] - Criar as tabelas, em SQL Server, considerando o domínio de uma mecânica, conforme modelado:

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-10-15%20à(s)%2015.59.33_12ff2830.jpg)

- Foram delimitadas as seguintes restrições:
    - [ ✔️ ] - *O ID do cliente é auto incremental partindo de 3401 e incrementando de 15 em 15*
    - [ ✔️ ] - *O ID do funcionário é auto incremental partindo de 101 e incrementando de 1 em 1*
    - [ ✔️ ] - *O ID da peça é auto incremental partindo de 3411 e incrementando de 7 em 7*
    - [ ✔️ ] - *O ID da categoria é auto incremental partindo de 1 e incrementando de 1 em 1*
    - [ ✔️ ] - *Nenhum número de endereço é negativo*
    - [ ✔️ ] - *Todos os CEP de endereços devem ter 8 dígitos*
    - [ ✔️ ] - *Se não preenchida, a data do reparo deve ser a data de hoje*
    - [ ✔️ ] - *A oficina só trabalha com carros de modelo superior a 1997*
    - [ ✔️ ] - *A oficina só trabalha com carros de fabricação superior a 1997*
    - [ ✔️ ] - *O ano do modelo deve ser igual ou 1 ano superior ao ano de fabricação*
    - [ ✔️ ] - *Não existem preços, custos, tempo ou valores negativos*
    - [ ✔️ ] - *Telefones podem ser fixos ou celulares, tendo 10 ou 11 dígitos*
    - [ ✔️ ] - *Categorias de Habilitação devem ser A, B, C, D ou E*
    - [ ✔️ ] - *Todas as peças devem ter, ao menos, 10 unidades em estoque*
    - [ ✔️ ] - *No Brasil, toda placa de veículo tem 7 caracteres*
    - [ ✔️ ] - *Cada peça tem nome diferente*
    - [ ✔️ ] - *As categorias de funcionários são estagiário, Nível 1, Nível 2 ou Nível 3 e seguem os valores:*
        - [ ✔️ ] - *Estagiário: Mais de R$15,00 / hora*
        - [ ✔️ ] - *Nível 1: Mais de R$25,00 / hora*
        - [ ✔️ ] - *Nível 2: Mais de R$35,00 / hora*
        - [ ✔️ ] - *Nível 3: Mais de R$50,00 / hora*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================

## [ ✔️ ] Exercício da Aula 10 - Constraints 3

(🗺️) - [[Código]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/constraints/Ex_Constraints3.sql)

### Descrição:

- [ ✔️ ] - Criar as tabelas, em SQL Server, considerando o domínio de uma Maternidade, implementado na aula passada(https://pastebin.com/AuAJFJgP), conforme modelado:

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-10-15%20à(s)%2015.50.28_25733604.jpg)

- Foram delimitadas as seguintes restrições:

    - *Para a tabela mãe:*

        - [ ✔️ ] - *O ID é auto incremental, iniciando em 1001 e indo de 1 em 1*
        - [ ✔️ ] - *Número de porta não pode ser negativo*
        - [ ✔️ ] - *CEP deve ter 8 dígitos*
        - [ ✔️ ] - *Telefone deve ter 10 dígitos*

    - *Para a tabela medico:*

        - [ ✔️ ] - *Celular deve ter 11 dígitos*
        - [ ✔️ ] - *Celular não pode repetir*

    - *Para a tabela bebe:*

        - [ ✔️ ] - *O ID é auto incremental, iniciando em 1 e indo de 1 em 1*
        - [ ✔️ ] - *Se não preenchida, a data de nascimento é o dia de hoje*
        - [ ✔️ ] - *Altura não pode ser negativa*
        - [ ✔️ ] - *Peso não pode ser negativo*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================
