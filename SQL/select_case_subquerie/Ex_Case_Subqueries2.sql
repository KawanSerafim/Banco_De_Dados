USE locadora
GO

SELECT * FROM Filme 
SELECT * FROM Filme_Estrela
SELECT * FROM Estrela
SELECT * FROM DVD
SELECT * FROM Locacao
SELECT * FROM Cliente

SELECT
	id,
	CASE WHEN(LEN(titulo) >= 10)
		THEN
			SUBSTRING(titulo, 1, 10) + '...'
		ELSE
			titulo
	END AS titulo,
	ano
FROM Filme

SELECT
	num,
	data_fabricacao,
	DATEDIFF(MONTH, data_fabricacao, GETDATE()) AS qtd_meses_desde_fabricacao
FROM DVD
WHERE Filmeid IN
(
	SELECT id
	FROM Filme
	WHERE titulo = 'Interstelar'
)

SELECT
	DVDnum,
	data_locacao,
	data_devolucao,
	DATEDIFF(DAY, data_locacao, data_devolucao) AS dias_alugado,
	valor
FROM Locacao
WHERE Clientenum_cadastro IN
(
	SELECT num_cadastro
	FROM Cliente
	WHERE nome LIKE '%Rosa%'
)

SELECT
	nome,
	CONVERT(VARCHAR(150), logradouro) + ', Nº' + CONVERT(VARCHAR(10), num) AS endereço_completo,
	SUBSTRING(cep, 1, 5) + '-' + SUBSTRING(cep, 6, 8) AS cep
FROM Cliente
WHERE num_cadastro IN
(
	SELECT Clientenum_cadastro
	FROM Locacao
	WHERE DVDnum = 10002
)
