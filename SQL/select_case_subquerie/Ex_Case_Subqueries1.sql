USE projetos
GO

SELECT * FROM users
SELECT * FROM projects
SELECT * FROM users_has_projects

SELECT

id, 
_name, 
email, 
username,

CASE WHEN(_password != '123mudar')
	THEN
		'******'
	ELSE
		_password
END AS senha

FROM users

SELECT

_name,
_description,
_date,

DATEADD(DAY, 15, _date) AS data_final

FROM projects

WHERE id IN
(
	SELECT projects_id
	FROM users_has_projects
	WHERE users_id IN
	(
		SELECT id
		FROM users
		WHERE email = 'aparecido@empresa.com'
	)
)

SELECT _name, email
FROM users
WHERE id IN
(
	SELECT users_id
	FROM users_has_projects
	WHERE projects_id IN
	(
		SELECT id
		FROM projects
		WHERE _name = 'Auditoria'
	)
)

SELECT
	_name, 
	_description,
	CONVERT(VARCHAR(10), _date, 103) as data,
	'16/09/2014' AS data_final,

	79.85 * DATEDIFF(DAY, _date, '16/09/2014') AS custo_total
FROM projects
WHERE _name LIKE '%Manutenção%'
