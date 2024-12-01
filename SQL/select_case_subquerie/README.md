# **EXERCÍCIOS EM SQL - SELECTS SIMPLES**

## Guia de Símbolos:

    [ ❌ ] - Não finalizado.

    [ ✔️ ] - Finalizado.

## Contexto para cada Operação:

- [ 📑 ] *O começo do código não é mais criando a database, e sim usando uma que já existe. Para isso, basta escrever assim:*

      USE database
      GO

- [ 📑 ] *Com a database selecionada, eu já coloco um select que consulta tudo de cada tabela para verificar os dados tanto agora quanto futuramente quando necessário. Para isso, basta escrever assim:*

      --Na necessidade de consultar mais de uma tabela, basta repetir
      --trocando apenas o nome da tabela

      SELECT * FROM tabela

- [ 📑 ] *Agora, a primeira consulta que pede para que seja 2 maneiras de exibir a senha dos usuário, uma com o default '123mudar', outra com '\*\*\*\*\*\*\*\*', no caso da senha for diferente do default. Para isso ser possível, é necessário uma função condicional mais trabalhada que apenas o WHERE. Para isso, basta escrever assim:*

      CASE WHEN(condicao)
          THEN
              --decisao se condição for positiva
          ELSE
              --decisao se condição for negativa
      END AS coluna_nova

- [ 📑 ] *A segunda consulta pede para consultar, além dos dados normais, a data final de um projeto após 15 dias, isso de um usuário com um email específico. Para isso ser possível, é necessário utilizar de mais de uma tabela, logo, aqui é necessário o uso de subqueries.*
- *Antes de tudo, para descobrir a data de 15 dias depois, basta escrever assim:*

      DATEADD(DAY, 15, data) AS data_15_dias_depois

- *A trilha até a resposta é: "descobrir o id do projeto que esteja associado ao id de um usuário que tenha o email em específico". Para isso, basta escrever assim (isso também vai valer para a  terceira consulta, que exige o mesmo processo, apenas com condições diferentes):*

      --tabela1 = projects
      --tabela2 = users_has_projects (associativa)
      --tabela3 = users
  
      SELECT
          coluna1,
          coluna2,
          coluna3,
      FROM tabela1
      WHERE id_tabela1 IN
      (
          SELECT id_tabela2
          FROM tabela2
          WHERE id_tabela3 IN
          (
              SELECT id_tabela3
              FROM tabela3
              WHERE 'condicao final'
          )
      )

- [ 📑 ] *A quarta e última consulta exige que tenha um cálculo de diárias, além de exibir a data final do projeto, que já foi explicado, e que seja de um projeto que tenha manutenção no nome. Agora, para o cálculo de diárias, foi necessário puxar a diferença entre a data final e inicial, conseguindo um multiplicador para gerar o resultado. Por fim, para encontrar um texto específico em outro texto, basta utilizar o LIKE, que já foi explicado em [Select Simples](https://github.com/KawanSerafim/Banco_De_Dados/tree/main/SQL/select_simples). Para isso, basta escrever assim:*

      SELECT
          coluna1,
          coluna2,
          coluna3,
          valor_diaria * DATEDIFF(DAY, data_inicial, data_final) AS coluna_nova
      FROM tabela
      WHERE coluna1 LIKE '%texto para encontrar%'

========================================================================================================================================================================================

## [ ✔️ ] Selects Case Subquerie 1

(🗺️) - [[Código - Select Case Subquerie]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/select_case_subquerie/Ex_Case_Subqueries1.sql)

### Descrição:

- [ 📑 ] *A data base usada foi a mesma de um exercício feito em Select Simples. O código está logo abaixo em Código - Select Simples:*

- (🗺️) - [[Código - Select Simples]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/select_simples/Ex_SelectSimples1.sql)

- *Considere o diagrama abaixo:*

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.08.09_fee28da8.jpg)

- [ ✔️ ] - *Consultar:*
  - [ ✔️ ] - *Fazer uma consulta que retorne id, nome, email, username e caso a senha seja diferente de 123mudar, mostrar ******** (8 asteriscos), caso contrário, mostrar a própria senha.*
  - [ ✔️ ] - *Considerando que o projeto 10001 durou 15 dias, fazer uma consulta que mostre o nome do projeto, descrição, data, data_final do projeto realizado por usuário de e-mail (aparecido@empresa.com).*
  - [ ✔️ ] - *Fazer uma consulta que retorne o nome e o email dos usuários que estão envolvidos no projeto de nome Auditoria.*
  - [ ✔️ ] - *Considerando que o custo diário do projeto, cujo nome tem o termo Manutenção, é de 79.85 e ele deve finalizar 16/09/2014, consultar, nome, descrição, data, data_final e custo_total do projeto.*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================
