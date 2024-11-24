/*
USE master
DROP DATABASE locadora
*/

CREATE DATABASE locadora
GO
USE locadora
GO

CREATE TABLE Filme (

id			INT				NOT NULL,
titulo		VARCHAR(40)		NOT NULL,
ano			INT				NULL		CHECK(ano <= 2021)

PRIMARY KEY(id)

)
GO

CREATE TABLE Estrela (

id			INT				NOT NULL,
nome		VARCHAR(50)		NOT NULL

PRIMARY KEY(id)

)
GO

CREATE TABLE Filme_Estrela (

Filmeid			INT		NOT NULL,
Estrelaid		INT		NOT NULL

PRIMARY KEY(Filmeid, Estrelaid)
FOREIGN KEY(Filmeid) REFERENCES Filme(id),
FOREIGN KEY(Estrelaid) REFERENCES Estrela(id)

)
GO

CREATE TABLE DVD (

num					INT			NOT NULL,
data_fabricacao		DATE		NOT NULL		CHECK(data_fabricacao < 
												CAST(GETDATE() AS DATE)),
Filmeid				INT			NOT NULL

PRIMARY KEY(num)
FOREIGN KEY(Filmeid) REFERENCES Filme(id)

)
GO

CREATE TABLE Cliente (

num_cadastro	INT					NOT NULL,
nome			VARCHAR(70)			NOT NULL,
logradouro		VARCHAR(150)		NOT NULL,
num				INT					NOT NULL		CHECK(num >= 0),
cep				CHAR(8)				NULL			CHECK(LEN(cep) = 8) 

PRIMARY KEY(num_cadastro)

)
GO

CREATE TABLE Locacao (

DVDnum					INT					NOT NULL,
Clientenum_cadastro		INT					NOT NULL,
data_locacao			DATE				NOT NULL,
data_devolucao			DATE				NOT NULL,
valor					DECIMAL(7, 2)		NOT NULL		CHECK(valor >= 0.00)

PRIMARY KEY(DVDnum, Clientenum_cadastro, data_locacao)
FOREIGN KEY(DVDnum) REFERENCES DVD(num),
FOREIGN KEY(Clientenum_cadastro) REFERENCES Cliente(num_cadastro),

CONSTRAINT data_locacao_devolucao

	CHECK(data_devolucao > data_locacao),

)
GO




/*
ALTER TABLE Estrela
ALTER COLUMN nome_real VARCHAR(50) NULL
GO

ALTER TABLE Filme
ALTER COLUMN titulo VARCHAR(80)	NOT NULL
GO

INSERT INTO Filme(id, titulo, ano) 
VALUES
(1001, 'Whiplash', 2015),
(1002, 'Birdman', 2015),
(1003, 'Interstelar', 2014),
(1004, 'A Culpa é das estrelas', 2014),
(1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014),
(1006, 'Sing', 2016)
GO

INSERT INTO Estrela(id, nome, nome_real)
VALUES
(9901, 'Michael Kaeton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9903, 'Miles Teller', NULL),
(9904, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')
GO

INSERT INTO DVD(num, data_fabricacao, Filmeid)
VALUES
(10001, '2020-12-02', 1001),
(10002, '2019-10-18', 1002),
(10003, '2020-04-03', 1003),
(10004, '2020-12-02', 1001),
(10005, '2019-10-18', 1004),
(10006, '2020-04-03', 1002),
(10007, '2020-12-02', 1005),
(10008, '2019-10-18', 1002),
(10009, '2020-04-03', 1003)
GO

INSERT INTO Cliente(num_cadastro, nome, logradouro, num, cep)
VALUES
(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040'),
(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110'),
(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL),
(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, NULL),
(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')
GO

INSERT INTO Locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES
(10001, 5502, '2021-02-18', '2021-02-21', 3.50),
(10009, 5502, '2021-02-18', '2021-02-21', 3.50),
(10002, 5503, '2021-02-18', '2021-02-19', 3.50),
(10002, 5505, '2021-02-20', '2021-02-23', 3.00),
(10004, 5505, '2021-02-20', '2021-02-23', 3.00),
(10005, 5505, '2021-02-20', '2021-02-23', 3.00),
(10001, 5501, '2021-02-24', '2021-02-26', 3.50),
(10008, 5501, '2021-02-24', '2021-02-26', 3.50)
GO

UPDATE Cliente SET cep = '08411150'
WHERE num_cadastro = 5503

UPDATE Cliente SET cep = '02918190'
WHERE num_cadastro = 5504

UPDATE Locacao SET valor = 3.25
WHERE Clientenum_cadastro = 5502 AND
data_locacao = '2021-02-18'

UPDATE Locacao SET valor = 3.10
WHERE Clientenum_cadastro = 5501 AND
data_locacao = '2021-02-24'

UPDATE DVD SET data_fabricacao = '2019-07-14'
WHERE num = 10005

UPDATE Estrela SET nome_real = 'Miles Alexander Teller'
WHERE nome = 'Miles Teller'

DELETE FROM Filme
WHERE titulo = 'Sing'
*/

SELECT titulo FROM Filme
WHERE ano = 2014

SELECT id, ano FROM Filme
WHERE titulo = 'Birdman'

SELECT id, nome, nome_real FROM Estrela
WHERE nome LIKE 'Steve%'

SELECT * FROM Filme
SELECT * FROM Filme_Estrela
SELECT * FROM DVD
SELECT * FROM Locacao
SELECT * FROM Estrela
SELECT * FROM Cliente