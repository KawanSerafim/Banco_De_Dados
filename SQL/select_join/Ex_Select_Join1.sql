USE projetos
GO

SELECT * FROM users
SELECT * FROM projects
SELECT * FROM users_has_projects

INSERT INTO users(_name, username, _password, email) VALUES
('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')
GO

INSERT INTO projects(_name, _description, _date) VALUES
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC´s', '12/09/2014')
GO

------------------------------------------------------------------

SELECT
	users.id,
	users._name,
	users.email,
	projects._name,
	projects._description,
	projects._date
FROM users
INNER JOIN users_has_projects
ON users_has_projects.users_id = users.id
INNER JOIN projects
ON users_has_projects.projects_id = projects.id
WHERE projects._name = 'Re-folha'

------------------------------------------------------------------

SELECT
	_name
FROM 
projects LEFT OUTER JOIN users_has_projects
ON users_has_projects.projects_id = projects.id
WHERE users_has_projects.users_id IS NULL

------------------------------------------------------------------

SELECT
	_name
FROM
users LEFT OUTER JOIN users_has_projects
ON users_has_projects.users_id = users.id
WHERE users_has_projects.projects_id IS NULL
