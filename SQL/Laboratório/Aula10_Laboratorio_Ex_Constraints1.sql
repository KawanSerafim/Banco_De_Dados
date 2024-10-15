/*
RESTRIÇÕES DO EXERCÍCIO

- O código do livro é auto incremental partindo de 100001 e incrementando de 100 em 100
- O código do autor é auto incremental partindo de 2351 e incrementando de 1 em 1
- O código da editora é auto incremental partindo de 491 e incrementando de 16 em 16
- Por lei, o ISBN deve ter 13 dígitos
- O nome do autor é único
- O nome da editora é único
- Se não preenchida, a língua dos livros é ‘PT-BR’
- Não são cadastrados livros de ano inferior a 1990
- Não são cadastrados livros de edição inferior a 1993
- Não existem preços negativos
- Não existem livros com menos de 15 páginas
- Não existem Números de Endereços negativos
- Telefones são fixos devem ter 10 dígitos
- No Brasil, todo CEP tem 8 caracteres
- Só são cadastrados livros de autores do Brasil, Estados Unidos, Inglaterra e Alemanha
*/


CREATE DATABASE livraria
GO
USE livraria
GO
	
CREATE TABLE Livro (

Codigo		INT					NOT NULL		IDENTITY(100001, 100),
Nome		VARCHAR(200)		NOT NULL,
Lingua		VARCHAR(10)			NOT NULL		DEFAULT('PT-BR'),
Ano			INT					NOT NULL		CHECK(Ano >= 1990),

PRIMARY KEY(Codigo)

)
GO

CREATE TABLE Autor (

ID_Autor		INT					NOT NULL		IDENTITY(2351, 1),
Nome			VARCHAR(100)		NOT NULL		UNIQUE,
Data_nasc		DATE				NOT NULL,
Pais_Nasc		VARCHAR(50)			NOT NULL		CHECK(UPPER(Pais_Nasc) = 'BRASIL' OR 
														  UPPER(Pais_Nasc) = 'ESTADOS UNIDOS' OR 
														  UPPER(Pais_Nasc) = 'INGLATERRA' OR 
														  UPPER(Pais_Nasc) = 'ALEMANHA'),
Biografia		VARCHAR(255)		NOT NULL

PRIMARY KEY(ID_Autor)

)
GO

CREATE TABLE Livro_Autor (

LivroCodigo			INT			NOT NULL,
AutorID_Autor		INT			NOT NULL

PRIMARY KEY(LivroCodigo, AutorID_Autor)
FOREIGN KEY(LivroCodigo) REFERENCES Livro(Codigo),
FOREIGN KEY(AutorID_Autor) REFERENCES Autor(ID_Autor)

)
GO

CREATE TABLE Editora (

ID_Editora					INT					NOT NULL		IDENTITY(491, 16),
Nome						VARCHAR(70)			NOT NULL		UNIQUE,
Telefone					VARCHAR(11)			NOT NULL		CHECK(LEN(Telefone) >= 10),
Logradouro_Endereco			VARCHAR(200)		NOT NULL,
Numero_Endereco				VARCHAR(10)			NOT NULL		CHECK(Numero_Endereco >= 0),
CEP_Endereco				CHAR(8)				NOT NULL		CHECK(LEN(CEP_Endereco) = 8),
Complemento_Endereco		VARCHAR(255)		NOT NULL

PRIMARY KEY(ID_Editora)

)
GO

CREATE TABLE Edicao (

ISBN				CHAR(13)			NOT NULL		CHECK(LEN(ISBN) = 13),
Preco				DECIMAL(4, 2)		NOT NULL		CHECK(Preco >= 0.00),
Ano					INT					NOT NULL		CHECK(Ano >= 1993),
Numero_Paginas		INT					NOT NULL		CHECK(Numero_Paginas >= 15),
Qtd_Estoque			INT					NOT NULL

PRIMARY KEY(ISBN)

)
GO

CREATE TABLE Editora_Edicao_Livro (

EditoraID_Editora		INT				NOT NULL,
EdicaoISBN				CHAR(13)		NOT NULL,
LivroCodigo				INT				NOT NULL

PRIMARY KEY(EditoraID_Editora, EdicaoISBN, LivroCodigo)
FOREIGN KEY(EditoraID_Editora) REFERENCES Editora(ID_Editora),
FOREIGN KEY(EdicaoISBN) REFERENCES Edicao(ISBN),
FOREIGN KEY(LivroCodigo) REFERENCES Livro(Codigo)

)
GO
