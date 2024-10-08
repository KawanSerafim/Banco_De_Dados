CREATE DATABASE livraria
GO
USE livraria

DROP DATABASE livraria
CREATE DATABASE livraria

GO
USE livraria

CREATE TABLE Livro (

Codigo		INT					NOT NULL,
Nome		VARCHAR(200)		NOT NULL,
Lingua		VARCHAR(10)			NOT NULL,
Ano			INT					NOT NULL

PRIMARY KEY(Codigo)

)
GO

CREATE TABLE Autor (

ID_Autor		INT					NOT NULL,
Nome			VARCHAR(100)		NOT NULL,
Data_nasc		DATE				NOT NULL,
Pais_Nasc		VARCHAR(50)			NOT NULL,
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

ID_Editora					INT					NOT NULL,
Nome						VARCHAR(70)			NOT NULL,
Telefone					VARCHAR(11)			NOT NULL,
Logradouro_Endereco			VARCHAR(200)		NOT NULL,
Numero_Endereco				VARCHAR(10)			NOT NULL,
CEP_Endereco				CHAR(8)				NOT NULL,
Complemento_Endereco		VARCHAR(255)		NOT NULL

PRIMARY KEY(ID_Editora)

)
GO

CREATE TABLE Edicao (

ISBN				CHAR(13)			NOT NULL,
Preco				DECIMAL(4, 2)		NOT NULL,
Ano					INT					NOT NULL,
Numero_Paginas		INT					NOT NULL,
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