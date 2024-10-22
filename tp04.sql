USE compta;

--Question a.
SELECT *  FROM Article
ORDER BY Designation;

--Question b.
SELECT *  FROM Article
ORDER BY prix DESC;

--Question c.
SELECT * FROM article 
WHERE designation LIKE '%boulon%'
ORDER BY prix;

--Question d.
SELECT * FROM article
WHERE designation LIKE '%sachet%';

--Question e.
SELECT * FROM article
WHERE  LOWER(designation) LIKE '%sachet%';

--Question f.
SELECT * FROM Article
INNER JOIN Fournisseur ON Article.ID_FOU=Fournisseur.id
ORDER BY Fournisseur.Nom, Article.prix DESC;


--Question g.
SELECT * FROM Article, Fournisseur
WHERE Article.ID.FOU=Fournisseur.id && nom 


--Question h.
SELECT Fournisseur.Nom, AVG(Article.Prix) as "Prix Moyen" FROM Article
INNER JOIN Fournisseur ON Article.ID_FOU=Fournisseur.id
WHERE Fournisseur.nom = 'Dubois &F ils'
GROUP BY Fournisseur.nom

--Question i.
SELECT Fournisseur.Nom, AVG(Article.Prix) as "Prix Moyen" FROM Article
JOIN Fournisseur ON Article.ID_FOU=Fournisseur.id
GROUP BY Fournisseur.nom

--Question j.
SELECT * FROM bon
WHERE bon.DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05 12:00:00'

--Question k.
SELECT * FROM Bon
INNER JOIN Compo ON Bon.id=Compo.ID_BON
INNER JOIN Article ON Compo.id=Article.id
WHERE Article.designation like '%boulon%'

--Question l.
SELECT * FROM Bon, Compo, Article, Fournisseur
WHERE Bon.id=Compo.ID_BON AND Compo.ID_ART=Article.id AND Article.id=Fournisseur.id
and Article.Designation like '%boulon%'
ORDER BY Fournisseur.nom

--Question m.
SELECT SUM(Article.prix*Compo.Qte), Numero FROM Bon, Article, Compo
WHERE Bon.id=Compo.ID_Bon AND Article.id=Compo.ID_ART
GROUP BY Bon.Numero
ORDER BY Bon.Numero


--Question n.
SELECT SUM(Qte), Numero FROM Bon, Article, Compo
WHERE Bon.id=Compo.ID_BON AND Article.id=Compo.ID_ART
GROUP BY Bon.Numero
ORDER BY Bon.Numero

--Question o.
SELECT Bon.Numero, SUM(Compo.Qte) FROM Compo, Bon
WHERE Bon.id=Compo.ID_BON 
GROUP BY Bon.Numero
HAVING SUM(Compo.Qte)>25
ORDER BY Bon.Numero

--Question p.
SELECT SUM(Compo.Qte*Article.Prix) as 'Total Commande', Bon.Date_CMDE FROM Compo, Article, Bon
WHERE Compo.ID_ART=Article.id AND Compo.ID_BON=Bon.id
AND Bon.Date_CMDE BETWEEN '2019-04-01' AND '2019-04-30'


