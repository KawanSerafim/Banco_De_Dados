/*
RESTRI��ES DO EXERC�CIO

- O c�digo do livro � auto incremental partindo de 100001 e incrementando de 100 em 100
- O c�digo do autor � auto incremental partindo de 2351 e incrementando de 1 em 1
- O c�digo da editora � auto incremental partindo de 491 e incrementando de 16 em 16
- Por lei, o ISBN deve ter 13 d�gitos
- O nome do autor � �nico
- O nome da editora � �nico
- Se n�o preenchida, a l�ngua dos livros � �PT-BR�
- N�o s�o cadastrados livros de ano inferior a 1990
- N�o s�o cadastrados livros de edi��o inferior a 1993
- N�o existem pre�os negativos
- N�o existem livros com menos de 15 p�ginas
- N�o existem N�meros de Endere�os negativos
- Telefones s�o fixos devem ter 10 d�gitos
- No Brasil, todo CEP tem 8 caracteres
- S� s�o cadastrados livros de autores do Brasil, Estados Unidos, Inglaterra e Alemanha
*/


CREATE DATABASE livraria
GO
USE livraria

DROP DATABASE livraria
CREATE DATABASE livraria

GO
USE livraria

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
