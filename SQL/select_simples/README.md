# **EXERCÍCIOS EM SQL - SELECTS SIMPLES**

## Guia de Símbolos:

    [ ❌ ] - Não finalizado.

    [ ✔️ ] - Finalizado.

## [ ✔️ ] Selects Simples 1

(🗺️) - [[Código]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/select_simples/Ex_SelectSimples1.sql)

### Descrição:

- *Considere o diagrama abaixo:*

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.08.09_fee28da8.jpg)

- [ ✔️ ] - *Criar as tabelas da forma que foram diagramadas, obedecendo as seguintes restrições:*
  - [ ✔️ ] - *A coluna projects_id da tabela associativa é FK da coluna id, tabela projects.*
  - [ ✔️ ] - *A coluna projects_id da tabela associativa é FK da coluna id, tabela projects*
  - [ ✔️ ] - *coluna date da tabela projects deve verificar se a data é posterior que 01/09/2014. Caso contrário, o registro não deve ser inserido.*
  - [ ✔️ ] - *A PK de projects deve ser de auto incremento, iniciando em 10001, com incremento de 1.*
  - [ ✔️ ] - *A PK de users deve ser de auto incremento, iniciando em 1, com incremento de 1.*
  - [ ✔️ ] - *O valor padrão da coluna password da tabela users, deverá ser 123mudar*
  - [ ✔️ ] - *A coluna username da tabela users deve ter restrição de unicidade.*

- [ ✔️ ] - *Modificar a coluna username da tabela Users para varchar(10).*
- [ ✔️ ] - *Modificar a coluna password da tabela Users para varchar(8)*

- [ ✔️ ] - *Inserir os dados abaixo na tabela users*:

![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.17.06_bc030726.jpg)

- [ ✔️ ] - *Inserir os dados abaixo na tabela projects*:

![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.19.08_85f8c4e8.jpg)

- [ ✔️ ] - *Inserir os dados abaixo na tabela users_has_projects*:

![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.19.30_909cc243.jpg)

- [ ✔️ ] - *Considerar as situações:*:
  - [ ✔️ ] - *O projeto de Manutenção atrasou, mudar a data para 12/09/2014.*
  - [ ✔️ ] - *O username de aparecido (usar o nome como condição de mudança) está feio, mudar para Rh_cido.*
  - [ ✔️ ] - *Mudar o password do username Rh_maria (usar o username como condição de mudança) para 888@\*, mas a condição deve verificar se o password dela ainda é 123mudar.*
  - [ ✔️ ] - *O user de id 2 não participa mais do projeto 10002, removê-lo da associativa.*
 
## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================
