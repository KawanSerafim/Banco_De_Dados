/*
USE master
DROP DATABASE projetos
*/

CREATE DATABASE projetos
GO
USE projetos
GO

CREATE TABLE users (

id				INT				NOT NULL		IDENTITY(1, 1),
_name			VARCHAR(45)		NOT NULL,
username		VARCHAR(45)		NOT NULL		UNIQUE,
_password		VARCHAR(45)		NOT NULL		DEFAULT('123mudar'),
email			VARCHAR(45)		NOT NULL

PRIMARY KEY(id)

)
GO

CREATE TABLE projects (

id					INT				NOT NULL		IDENTITY(10001, 1),
_name				VARCHAR(45)		NOT NULL,
_description		VARCHAR(45)		NULL,
_date				DATE			NOT NULL		CHECK(_date > '01/09/2014')

PRIMARY KEY(id)

)
GO

CREATE TABLE users_has_projects (

users_id			INT		NOT NULL,
projects_id			INT		NOT NULL

PRIMARY KEY(users_id, projects_id)
FOREIGN KEY(users_id) REFERENCES users(id),
FOREIGN KEY(projects_id) REFERENCES projects(id)

)
GO




/*
ALTER TABLE users
DROP CONSTRAINT nome_da_constraint
GO

ALTER TABLE users
ALTER COLUMN username	VARCHAR(10)		NOT NULL
GO

ALTER TABLE users
ADD UNIQUE(username)
GO
*/

/*
ALTER TABLE users
DROP CONSTRAINT nome_da_constraint
GO

ALTER TABLE users
ALTER COLUMN _password	VARCHAR(8)		NOT NULL
GO

ALTER TABLE users
ADD CONSTRAINT nome_da_constraint_nova DEFAULT '123mudar' FOR _password
GO
*/

/*
INSERT INTO users(_name, username, _password, email) 
VALUES
('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')
GO
*/

/*
INSERT INTO projects(_name, _description, _date)
VALUES
('Re-folha', 'Refatoração das Folhas', '05/09/2014'),
('Manutenção PC´s', 'Manutenção PC´s', '06/09/2014'),
('Auditoria', NULL, '07/09/2014')
GO
*/

/*
INSERT INTO users_has_projects(users_id, projects_id)
VALUES
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)
GO
*/

/*
UPDATE projects SET _date = '12/09/2014'
WHERE _name = 'Manutenção PC´s'

UPDATE users SET username = 'Rh_cido'
WHERE _name = 'Aparecido'

UPDATE users SET _password = '888@*'
WHERE _name = 'Maria' AND
_password = '123mudar'

DELETE FROM users_has_projects 
WHERE users_id = 2 AND
projects_id = 10002
*/

SELECT * FROM users
SELECT * FROM projects
SELECT * FROM users_has_projects