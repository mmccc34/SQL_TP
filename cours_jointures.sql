DROP DATABASE IF EXISTS banque;
CREATE DATABASE IF NOT EXISTS banque;
USE banque;
DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client (
    id int,
    nom varchar(50),
    prenom varchar(50),
    ville varchar(25),
    age int (3)
);
DROP TABLE IF EXISTS compte;
CREATE TABLE IF NOT EXISTS compte (
    type_compte varchar (20),
    id_cli int, 
    solde decimal (12,2)
);
INSERT INTO client (id, nom, prenom, ville, age)
VALUES 
(1, 'Parker', 'Tony', 'Nantes', 32),
(2, 'Benzema', 'Karim', 'Lille', 18),
(3, 'Batum', 'Nicolas', 'Angers', 27),
(4, 'Cadamuro', 'Louisa', 'Toulouse', 28);


INSERT INTO compte (type_compte, id_cli, solde)
VALUES
('Compte Courant', 1, 8524.50),
('Livret A', 1, 35327.00),
('Compte courant', 2, 15040.00),
('Compte Courant', 3, -2535.10),
('Livret A', 4, 2527.00),
('Compte Courant', 4, 12800.00);

--Avec les alias
-- SELECT * FROM client cl, compte co
-- WHERE cl.id=co.id_cli
-- AND age >=20; 

INSERT INTO client (id, nom, prenom, ville, age)
VALUES 
(5, 'Décosse', 'Lucie', 'Angers', 24);


-- SELECT * FROM client INNER JOIN compte ON client.id=compte.id_cli
-- WHERE age >=20;

-- SELECT * FROM client LEFT JOIN compte ON client.id=compte.id_cli
-- WHERE age >=20;

-- SELECT nom, prenom, SUM(solde) FROM compte, client
-- WHERE client.id=compte.id_cli
-- GROUP BY nom, prenom DESC;




-- J'ai rajouté SUM(solde) pour afficher en plus le solde total des clients ayant plus de 2 comptes
-- J'ai également rajouté le prénom dans SELECT et dans GROUP BY

-- SELECT nom, prenom, COUNT(*), SUM(solde) FROM compte, client
-- WHERE client.id=compte.id_cli
-- GROUP BY nom, prenom HAVING COUNT(*)>=2



-- SELECT nom, prenom, SUM(solde) as 'Solde Total' FROM compte, client
-- WHERE client.id=compte.id_cli
-- GROUP BY nom, prenom HAVING SUM(solde)>=10000



--Sous requêtes
-- Cette requête retourne toutes les colonnes des clients âgés de 25 ans ou plus, ainsi que toutes les informations sur leurs comptes associés dans la table COMPTE. 
-- Les résultats seront présentés sous forme d'une combinaison des données de ces deux tables, en fonction de l'ID client.
SELECT *
FROM
(SELECT * FROM CLIENT WHERE age >=25) VIRTUA,
COMPTE
WHERE VIRTUA.id=COMPTE.id.cli

