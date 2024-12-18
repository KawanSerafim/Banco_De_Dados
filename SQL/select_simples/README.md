# **EXERCÍCIOS EM SQL - SELECTS SIMPLES**

## Guia de Símbolos:

    [ ❌ ] - Não finalizado.

    [ ✔️ ] - Finalizado.

## Contexto para cada Operação:

- [ 📑 ] *Primeiro, começo escrevendo, em comentário mesmo, dois comandos que servirão na necessidade de resetar a database. Os comandos são:*

      USE master
      DROP DATABASE nome_da_database

- [ 📑 ] *Basta selecionar somente essas duas linhas e clicar para executar no Microsoft SQL Server Management Studio, que o trabalho foi feito. Só selecionar todo o código novamente (isso com os dois comandos citado em comentário), e colocar para executar que a database foi resetada.*

- [ 📑 ] *Agora, para finalmente criar a database, há dois passos e 4 comandos, que são:*

      CREATE DATABASE nome_da_database
      GO
      USE nome_da_database
      GO    

- [ 📑 ] *O uso do GO é para que sejam executados os comandos em passo a passo. Para a criação de tabelas, o corpo do código é bem básico, onde você delimita onde inicia e onde finaliza com parênteses. Entre esses delimitadores, é onde determina os atributos/colunas da tabela, especificando o tipo e se pode iniciar vazio ou não.*

- [ 📑 ] *As keys são bem simples de serem declaradas, onde a PRIMARY KEY é apenas colocar o nome do atributo que vai ser a chave primária dentro de um parênteses, enquanto a FOREIGN KEY é um pouquinho mais verboso, precisando, também colocar daonde está referenciando, citando a tabela e o nome do atributo dessa tabela que a chave referencia. Agora, as restrições ficam depois do NULL/NOT NULL.*

      CREATE TABLE nome_da_tabela (
  
      nome_coluna1        TIPO        NULL/NOT NULL        IDENTITY(1, 1),
      nome_coluna2        TIPO        NULL/NOT NULL        CHECK(nome_coluna2 > 0)

      PRIMARY KEY(nome_coluna1)
      FOREIGN KEY(nome_coluna2) REFERENCES tabela_referenciada(atributo_estrangeiro)
  
      )
      GO

- [ 📑 ] *Se há mais de um atributo na tabela, é obrigatório o uso de vírgula no final da linha, mas podendo quebrar a linha a fim de organizar o código, apenas precisando colocar a vírgula no final, como se fosse tudo numa linha só. Isso também vale para as chaves e outros comandos.*

- [ 📑 ] *Para adicionar um novo atributo/coluna em uma tabela, é usado dois comandos:*

      ALTER TABLE tabela
      ADD nome_coluna    TIPO    NULL/NOT NULL
      GO

- [ 📑 ] *Para poder realizar a alteração num atributo/coluna, como o seu tamanho, é usado dois comandos:*

      --Quero alterar a coluna "exemplo", que é um VARCHAR(10) para VARCHAR(50)

      ALTER TABLE tabela
      ALTER COLUMN exemplo    VARCHAR(50)    NOT NULL
      GO

- [ 📑 ] *Para colocar dados em uma tabela, se usa o INSERT INTO, onde tem um parênteses que é para colocar os atributos que terão dados inseridos, e, após isso, no VALUES(), os dados devem ser inseridos na ordem respectiva dos atributos. No caso de adicionar mais linhas, basta colocar uma vírgula e continuar adicionando. Exemplo:*

      INSERT INTO tabela(coluna1, coluna2) VALUES
      (dado1, dado2),
      (dado1, dado2)
      GO

- [ 📑 ] *Para alterar o conteúdo de uma coluna específica, vai precisar do UPDATE, e se for de uma linha em específico, é necessário de uma função condicional que é o WHERE, justamente para direcionar a linha certa, evitando trocar de todas as linhas daquela coluna. Se precisar de mais de uma condição, basta colocar AND após a primeira condição, e colocar a próxima, sem a necessidade de repetir o WHERE. Exemplo:*

      --Quero alterar o conteúdo da linha2 da coluna_x, e minha referência
      --daquela linha é a linha_2 da coluna_y e a linha_2 da coluna_z

      UPDATE tabela SET coluna = 'novo dado'
      WHERE coluna_y = 'dado da linha_2 da coluna_y' AND
      coluna_z = 'dado da linha_2 da coluna_z'

- [ 📑 ] *Para exibir tudo de uma tabela, basta utilizar o:*

      SELECT * FROM tabela

- [ 📑 ] *Mas, como nem sempre queremos todo o conteúdo da tabela, para exibir apenas as colunas de interesse, o comando é:*

      SELECT coluna1, coluna2 FROM tabela

- [ 📑 ] *Agora, quando necessário acessar apenas linhas específicas das colunas, se utiliza a função condicional WHERE.*

      --Quero acessar a linha5 das colunas1 e coluna2, e minha referência
      --vai ser que as linhas devem ter uma linha de dado x na coluna3

      SELECT coluna1, coluna2 FROM tabela
      WHERE coluna3 = x

- [ 📑 ] *E quando eu quero selecionar uma linha de uma determinada coluna quando tiver 'exemplo' no conteúdo? Simples.*

      SELECT coluna FROM tabela
      WHERE coluna LIKE '%exemplo%'

- [ 📑 ] *O símbolo de porcentagem serve para indicar que pode ou não conter conteúdo além do 'exemplo'. Se vai ter conteúdo só depois, utiliza o símbolo no final, se vai só vai ter antes, utiliza no início, e se poder ter tanto antes quanto depois, coloca no início e no final.*

- [ 📑 ] *Quando necessário uma exibição mais detalhada, como concatenar colunas, atribuir uma regra na coluna em um caso específico, sem alterar a lógica real daquela coluna, é necessário:*

      --Quero concatenar coluna1 e coluna2

      SELECT coluna1 + coluna2 FROM tabela

      --Quero exibir coluna1 + 10 numa nova coluna

      SELECT
          coluna1 + 10 AS coluna1_somado
      FROM tabela

- [ 📑 ] *Para coletar a data atual, se utiliza o GETDATE(), e para colocar no padrão DD/MM/YYYY:*

      SELECT CONVERT(VARCHAR(10), GETDATE(), 103) AS data_de_hoje

- [ 📑 ] *No caso de haver uma coluna já com uma data, e a necessidade seja de exibir essa data no padrão brasileiro, basta trocar o GETDATE() pela coluna.*

========================================================================================================================================================================================

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

## [ ✔️ ] Selects Simples 2

(🗺️) - [[Código]](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/select_simples/Ex_SelectSimples2.sql)

### Descrição:

- *Considere o diagrama abaixo:*

![Imagem da Modelagem](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-23%20à(s)%2022.33.06_82abe2ee.jpg)

- [ ✔️ ] - *Restrições*:
    - [ ✔️ ] - *Ano de filme deve ser menor ou igual a 2021.*
    - [ ✔️ ] - *Data de fabricação de DVD deve ser menor do que hoje.*
    - [ ✔️ ] - *Número do endereço de Cliente deve ser positivo.*
    - [ ✔️ ] - *CEP do endereço de Cliente deve ter, especificamente, 8 caracteres.*
    - [ ✔️ ] - *Data de locação de Locação, por padrão, deve ser hoje.*
    - [ ✔️ ] - *Data de devolução de Locação, deve ser maior que a data de locação.*
    - [ ✔️ ] - *Valor de Locação deve ser positivo.*
 
- [ ✔️ ] - *Esquema:*
    - [ ✔️ ] - *A entidade estrela deveria ter o nome real da estrela, com 50 caracteres.*
    - [ ✔️ ] - *Verificando um dos nomes de filme, percebeu-se que o nome do filme deveria ser um atributo com 80 caracteres.*

- [ ✔️ ] - *Inserir os dados abaixo na tabela Filme:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2009.58.53_0784ccba.jpg)

- [ ✔️ ] - *Inserir os dados abaixo na tabela Estrela:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2009.59.07_e871af5f.jpg)
- [ ✔️ ] - *Inserir os dados abaixo na tabela Filme_Estrela:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2009.59.17_174c63ab.jpg)
- [ ✔️ ] - *Inserir os dados abaixo na tabela DVD:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2010.01.35_067b59d7.jpg)
- [ ✔️ ] - *Inserir os dados abaixo na tabela Cliente:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2009.59.43_59752067.jpg)
- [ ✔️ ] - *Inserir os dados abaixo na tabela Locação:*
![Imagem da Tabela](https://github.com/KawanSerafim/Banco_De_Dados/blob/main/SQL/imagens/Imagem%20do%20WhatsApp%20de%202024-11-24%20à(s)%2009.59.55_14b0fff7.jpg)

- [ ✔️ ] - *Operações com dados:*
    - [ ✔️ ] - *Os CEP dos clientes 5503 e 5504 são 08411150 e 02918190 respectivamente.*
    - [ ✔️ ] - *A locação de 2021-02-18 do cliente 5502 teve o valor de 3.25 para cada DVD alugado.*
    - [ ✔️ ] - *A locação de 2021-02-24 do cliente 5501 teve o valor de 3.10 para cada DVD alugado.*
    - [ ✔️ ] - *O DVD 10005 foi fabricado em 2019-07-14.*
    - [ ✔️ ] - *O nome real de Miles Teller é Miles Alexander Teller.*
    - [ ✔️ ] - *O filme Sing não tem DVD cadastrado e deve ser excluído.*

- [ ✔️ ] - *Consultar:*
    - [ ✔️ ] - *Fazer um select que retorne os nomes dos filmes de 2014.*
    - [ ✔️ ] - *Fazer um select que retorne o id e o ano do filme Birdman.*
    - [ ✔️ ] - *Fazer um select que retorne o id e o ano do filme que tem o nome terminado por plash.*
    - [ ✔️ ] - *Fazer um select que retorne o id, o nome e o nome_real da estrela cujo nome começa com Steve.*
    - [ ✔️ ] - *Fazer um select que retorne FilmeId e a data_fabricação em formato (DD/MM/YYYY) (apelidar de fab) dos filmes fabricados a partir de 01-01-2020.*
    - [ ✔️ ] - *Fazer um select que retorne DVDnum, data_locacao, data_devolucao, valor e valor com multa de acréscimo de 2.00 da locação do cliente 5505.*
    - [ ✔️ ] - *Fazer um select que retorne Logradouro, num e CEP de Matilde Luz.*
    - [ ✔️ ] - *Fazer um select que retorne Nome real de Michael Keaton.*
    - [ ✔️ ] - *Fazer um select que retorne o num_cadastro, o nome e o endereço completo, concatenando (logradouro, numero e CEP), apelido end_comp, dos clientes cujo ID é maior ou igual 5503.*

## **Tecnologia(s) utilizadas neste exercício 💻**
<div style="display: inline_block">
    <img align="center" alt="html5" src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
</div><br/>

## **Feito por 👤**

- [👨‍💻] - [Kawan Serafim](https://github.com/KawanSerafim)

========================================================================================================================================================================================
