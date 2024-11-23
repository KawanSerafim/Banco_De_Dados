CREATE DATABASE mecanica
GO
USE mecanica
GO

CREATE TABLE Cliente (

ID				INT					NOT NULL		IDENTITY(3401, 15),
Nome			VARCHAR(100)		NOT NULL,
Logradouro		VARCHAR(200)		NOT NULL,
Numero			INT					NOT NULL		CHECK(Numero >= 0),
CEP				CHAR(8)				NOT NULL		CHECK(LEN(CEP) = 8),
Complemento		VARCHAR(255)		NOT NULL

PRIMARY KEY(ID)

)
GO

CREATE TABLE Veiculo (

Placa				CHAR(7)				NOT NULL		CHECK(LEN(Placa) = 7),
Marca				VARCHAR(30)			NOT NULL,
Modelo				VARCHAR(30)			NOT NULL,
Cor					VARCHAR(15)			NOT NULL,
Ano_Fabricacao		INT					NOT NULL		CHECK((Ano_Fabricacao > 1997)),
Ano_Modelo			INT					NOT NULL,
Data_Aquisicao		DATE				NOT NULL,
ClienteID			INT					NOT NULL

PRIMARY KEY(Placa),
FOREIGN KEY(ClienteID) REFERENCES Cliente(ID),

CONSTRAINT Ano_Modelo_Fabricacao

	CHECK((Ano_Modelo > 1997) AND 
		  (Ano_Modelo = Ano_Fabricacao) AND 
		  (Ano_Modelo = Ano_Fabricacao + 1)),

)
GO

CREATE TABLE Telefone_Cliente (

	ClienteID			INT					NOT NULL,
	Telefone			VARCHAR(11)			NOT NULL		CHECK((LEN(Telefone) >= 10) OR (LEN(Telefone) = 11))

	PRIMARY KEY(Telefone)
	FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)

)
GO

CREATE TABLE Peca (

ID				INT						NOT NULL		IDENTITY(3411, 7),
Nome			VARCHAR(30)				NOT NULL		UNIQUE,
Preco			DECIMAL(4, 2)			NOT NULL		CHECK(Preco >= 0.00),
Estoque			INT						NOT NULL		CHECK(Estoque >= 10)

PRIMARY KEY(ID)

)
GO

CREATE TABLE Categoria (

ID					INT						NOT NULL		IDENTITY(1, 1),
Categoria			VARCHAR(10)				NOT NULL		CHECK(UPPER(Categoria) = 'ESTAGIÁRIO' OR
																  UPPER(Categoria) = 'NÍVEL 1' OR
																  UPPER(Categoria) = 'NÍVEL 2' OR
																  UPPER(Categoria) = 'NÍVEL 3'),
Valor_Hora			DECIMAL(4, 2)			NOT NULL

PRIMARY KEY(ID),

CONSTRAINT Categoria_Valor_Hora

	CHECK((
			((Categoria = 'ESTAGIÁRIO') AND (Valor_Hora > 15.00)) OR
			((Categoria = 'NÍVEL 1') AND (Valor_Hora > 35.00)) OR
			((Categoria = 'NÍVEL 2') AND (Valor_Hora > 50.00))
			))

)
GO

CREATE TABLE Funcionario (

ID								INT						NOT NULL		IDENTITY(101, 1),
Nome							VARCHAR(100)			NOT NULL,
Logradouro						VARCHAR(200)			NOT NULL,
Numero							INT						NOT NULL		CHECK(Numero >= 0),
Telefone						CHAR(11)				NOT NULL		CHECK((LEN(Telefone) >= 10) OR (LEN(Telefone) = 11)),
Categoria_Habilitacao			VARCHAR(2)				NOT NULL		CHECK(UPPER(Categoria_Habilitacao) = 'A' AND
																			  UPPER(Categoria_Habilitacao) = 'B' AND
																			  UPPER(Categoria_Habilitacao) = 'C' AND
																			  UPPER(Categoria_Habilitacao) = 'D' AND
																			  UPPER(Categoria_Habilitacao) = 'E'),
CategoriaID						INT						NOT NULL

PRIMARY KEY(ID)
FOREIGN KEY(CategoriaID) REFERENCES Categoria(ID)

)
GO

CREATE TABLE Reparo (

	VeiculoPlaca			CHAR(7)					NOT NULL,
	FuncionarioID			INT						NOT NULL,
	PecaID					INT						NOT NULL,
	Data_Reparo				DATE					NOT NULL		DEFAULT('15/10/2024'),
	Custo_Total				DECIMAL(4, 2)			NOT NULL		CHECK(Custo_Total >= 0.00),
	Tempo					INTEGER					NOT NULL		CHECK(Tempo >= 0)

	PRIMARY KEY(Data_Reparo, VeiculoPlaca, FuncionarioID, PecaID)
	
	FOREIGN KEY(VeiculoPlaca) REFERENCES Veiculo(Placa),
	FOREIGN KEY(FuncionarioID) REFERENCES Funcionario(ID),
	FOREIGN KEY(PecaID) REFERENCES Peca(ID)

)
GO

/*EXEC SP_HELP Cliente
EXEC SP_HELP Veiculo
EXEC SP_HELP Telefone_Cliente
EXEC SP_HELP Peca
EXEC SP_HELP Categoria
EXEC SP_HELP Funcionario
EXEC SP_HELP Reparo
*/
