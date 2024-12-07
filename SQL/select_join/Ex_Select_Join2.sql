USE locadora
GO

SELECT * FROM Cliente
SELECT * FROM DVD
SELECT * FROM Estrela
SELECT * FROM Filme
SELECT * FROM Filme_Estrela
SELECT * FROM Locacao

------------------------------------------------------------------

SELECT
	Cliente.num_cadastro,
	Cliente.nome,
	Locacao.data_locacao,
	DATEDIFF(DAY, Locacao.data_locacao, Locacao.data_devolucao) AS Qtd_dias_alugado,
	Filme.titulo,
	Filme.ano
FROM Cliente 
INNER JOIN Locacao
ON Cliente.num_cadastro = Locacao.Clientenum_cadastro
INNER JOIN DVD
ON Locacao.DVDnum = DVD.num
INNER JOIN Filme
ON DVD.Filmeid = Filme.id
WHERE Cliente.nome LIKE '%Matilde%'

------------------------------------------------------------------

SELECT
	Estrela.nome,
	Estrela.nome_real,
	Filme.titulo
FROM Estrela
INNER JOIN Filme_Estrela
ON Estrela.id = Filme_Estrela.Estrelaid
INNER JOIN Filme
ON Filme_Estrela.Filmeid = Filme.id
WHERE Filme.ano = 2015

------------------------------------------------------------------

SELECT
	Filme.titulo,
	CONVERT(VARCHAR(10), DVD.data_fabricacao, 103) AS data_fabricacao,
	CASE WHEN(DATEDIFF(YEAR, data_fabricacao, GETDATE()) > 6)
		THEN
			CONVERT(CHAR(1), DATEDIFF(YEAR, data_fabricacao, GETDATE())) + ' anos'
		ELSE
			CONVERT(CHAR(1), DATEDIFF(YEAR, data_fabricacao, GETDATE()))
	END AS [Diferença de Anos]
FROM Filme
INNER JOIN DVD
ON Filme.id = DVD.Filmeid
