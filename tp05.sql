USE compta;

UPDATE Article
SET designation = LOWER(designation)
WHERE id = 2;

UPDATE Article SET Designation = UPPER(Article.designation)
WHERE article.prix > 10

UPDATE Article
SET Article.prix = Article.prix * 0.9
WHERE id NOT IN (
    SELECT Distinct ID_ART
    FROM Compo
)
