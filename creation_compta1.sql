DROP TABLE IF EXISTS Article;
CREATE TABLE IF NOT EXISTS Article (
    id int PRIMARY KEY,
    Ref int (50),
    Designation  VARCHAR(255),
    Prix int,
    ID_FOU int
);
DROP TABLE IF EXISTS Fournisseur;
CREATE TABLE IF NOT EXISTS Fournisseur (
    id int PRIMARY KEY,
    Nom VARCHAR(25)
);

DROP TABLE IF EXISTS Bon;
CREATE TABLE IF NOT EXISTS Bon (
    id INT PRIMARY KEY,
    Numero VARCHAR(25),
    Date_CMDE TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS Compo;
CREATE TABLE IF NOT EXISTS Compo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Qte int (50),
    ID_ART int,
    ID_Bon int
);

ALTER TABLE Article ADD CONSTRAINT FOREIGN KEY (ID_FOU) REFERENCES Fournisseur(id);


ALTER TABLE Compo ADD CONSTRAINT FOREIGN KEY (ID_ART) REFERENCES Article(id);


ALTER TABLE Compo ADD CONSTRAINT FOREIGN KEY (ID_Bon) REFERENCES Bon(id);