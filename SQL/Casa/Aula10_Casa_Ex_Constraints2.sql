CREATE DATABASE mecanica
GO
USE mecanica
GO

CREATE TABLE Cliente (

ID				INT					NOT NULL,
Nome			VARCHAR(100)		NOT NULL,
Logradouro		VARCHAR(200)		NOT NULL,
Numero			INT					NOT NULL,
CEP				CHAR(8)				NOT NULL,
Complemento		VARCHAR(255)		NOT NULL

PRIMARY KEY(ID)

)
GO

CREATE TABLE Veiculo (

Placa				CHAR(7)				NOT NULL,
Marca				VARCHAR(30)			NOT NULL,
Modelo				VARCHAR(30)			NOT NULL,
Cor					VARCHAR(15)			NOT NULL,
Ano_Fabricacao		INT					NOT NULL,
Ano_Modelo			INT					NOT NULL,
Data_Aquisicao		DATE				NOT NULL,
ClienteID			INT					NOT NULL

PRIMARY KEY(Placa)
FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)

)
GO

CREATE TABLE Telefone_Cliente (

	ClienteID			INT					NOT NULL,
	Telefone			VARCHAR(11)			NOT NULL

	PRIMARY KEY(Telefone)
	FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)

)
GO

CREATE TABLE Peca (

ID				INT						NOT NULL,
Nome			VARCHAR(30)				NOT NULL,
Preco			DECIMAL(4, 2)			NOT NULL,
Estoque			INT						NOT NULL

PRIMARY KEY(ID)

)
GO

CREATE TABLE Categoria (

ID					INT						NOT NULL,
Categoria			VARCHAR(10)				NOT NULL,
Valor_Hora			DECIMAL(4, 2)			NOT NULL

PRIMARY KEY(ID)

)
GO

CREATE TABLE Funcionario (

ID								INT						NOT NULL,
Nome							VARCHAR(100)			NOT NULL,
Logradouro						VARCHAR(200)			NOT NULL,
Numero							INT						NOT NULL,
Telefone						CHAR(11)				NOT NULL,
Categoria_Habilitacao			VARCHAR(2)				NOT NULL,
CategoriaID						INT						NOT NULL

PRIMARY KEY(ID)
FOREIGN KEY(CategoriaID) REFERENCES Categoria(ID)

)
GO

CREATE TABLE Reparo (

	VeiculoPlaca			CHAR(7)					NOT NULL,
	FuncionarioID			INT						NOT NULL,
	PecaID					INT						NOT NULL,
	Data_Reparo				DATE					NOT NULL,
	Custo_Total				DECIMAL(4, 2)			NOT NULL,
	Tempo					INTEGER					NOT NULL

	PRIMARY KEY(Data_Reparo, VeiculoPlaca, FuncionarioID, PecaID)
	
	FOREIGN KEY(VeiculoPlaca) REFERENCES Veiculo(Placa),
	FOREIGN KEY(FuncionarioID) REFERENCES Funcionario(ID),
	FOREIGN KEY(PecaID) REFERENCES Peca(ID)

)
GO
