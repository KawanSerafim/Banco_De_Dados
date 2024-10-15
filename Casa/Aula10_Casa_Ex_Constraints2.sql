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

FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)

)