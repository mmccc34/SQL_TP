DROP DATABASE IF EXISTS compta;
CREATE DATABASE IF NOT EXISTS compta; 
USE compta;

DROP TABLE IF EXISTS Article;
CREATE TABLE IF NOT EXISTS Article (
    id int PRIMARY KEY,
    Ref VARCHAR(50),
    Designation  VARCHAR(255),
    Prix DECIMAL(6,2) ,
    ID_FOU int
);
DROP TABLE IF EXISTS Fournisseur;
CREATE TABLE IF NOT EXISTS Fournisseur (
    id int PRIMARY KEY,
    Nom VARCHAR(50)
);
DROP TABLE IF EXISTS Bon;
CREATE TABLE IF NOT EXISTS Bon (
    id INT PRIMARY KEY,
    Numero INT,
    Date_CMDE TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    delai INT,
    ID_FOU INT
);
DROP TABLE IF EXISTS Compo;
CREATE TABLE IF NOT EXISTS Compo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Qte int,
    ID_ART int,
    ID_Bon int
);

ALTER TABLE Article ADD CONSTRAINT FOREIGN KEY (ID_FOU) REFERENCES Fournisseur(id);

ALTER TABLE Bon ADD CONSTRAINT FOREIGN KEY (ID_FOU) REFERENCES Fournisseur(id);

ALTER TABLE Compo ADD CONSTRAINT FOREIGN KEY (ID_ART) REFERENCES Article(id);

ALTER TABLE Compo ADD CONSTRAINT FOREIGN KEY (ID_Bon) REFERENCES Bon(id);

INSERT INTO Fournisseur (id, Nom) VALUES 
(1, 'Française d'' Imports'),
 (2, 'FDM SA'),
 (3, 'Dubois & Fils');


INSERT INTO Article (id, Ref, Designation, prix, ID_FOU)
VALUES 
(1, 'A01', 'Perceuse P1', 74.99, 1),
(2, 'F01','Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.8, 3),
(7, 'A03', 'Perceuse à colonne', 185.25, 1),
(8, 'D04', 'Coffret mêches à bois', 12.25, 3),
(9, 'F03', 'Coffret mêches plates', 6.25, 2),
(10, 'F04', 'Fraises d’encastrement', 8.14, 2);

INSERT INTO Bon (id, numero, delai, ID_FOU)
VALUES 
(1, 1, 3, 1);

INSERT INTO Compo (Qte, ID_ART, ID_Bon)
VALUES 
(3, 1, 1),
(4, 5, 1),
(1, 7, 1);



-- UPDATE bon 
-- SET DATE_CMDE = '2019-02-08 09:30:00' 
-- WHERE ID = 1;

-- INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (1, 1, 3, 1, '2019-02-08 09:30:00');
-- INSERT INTO COMPO (ID_ART, ID_BON, QTE) VALUES
-- (1, 1, 3),
-- (5, 1, 4),
-- (7, 1, 1);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (2, 2, 5, 2, '2019-03-02 09:30:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 2, 25),
(3, 2, 15),
(9, 2, 8),
(10, 2, 11);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (3, 3, 2, 3, '2019-04-03 17:30:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (4, 3, 25),
(6, 3, 40),
(8, 3, 15);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (4, 4, 2, 3, '2019-04-05 11:40:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (4, 4, 10),
(6, 4, 15),
(8, 4, 8);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (5, 5, 7, 2, '2019-05-15 14:45:00');
INSERT INTO COMPO (ID_ART, ID_BON, QTE) values (2, 5, 17),
(3, 5, 13),
(10, 5, 9);

INSERT INTO BON (ID, NUMERO, DELAI, ID_FOU, DATE_CMDE) VALUES (6, 6, 0, 1, '2019-06-24 18:55:00');

