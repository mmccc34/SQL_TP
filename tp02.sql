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
(1, 'Française d Imports'),
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
(1, 0001, 3, 1);

INSERT INTO Compo (Qte, ID_ART, ID_Bon)
VALUES 
(3, 1, 1),
(4, 5, 1),
(1, 7, 1);

