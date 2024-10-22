USE compta;

-- Question a. 
 SELECT * FROM Article;

-- Question b. --
-- SELECT ref, designation FROM article
-- WHERE prix > 2;

-- Question c. --
-- SELECT * FROM article
-- WHERE prix>=2 AND prix<=6.25;

-- Question d. --
-- SELECT * FROM article
-- WHERE prix BETWEEN 2 AND 6.25;

-- Question e. --
-- SELECT * FROM article
-- WHERE prix NOT BETWEEN 2 AND 6.25 AND ID_FOU = 1
-- ORDER BY prix DESC;

-- Question f. --
-- SELECT * FROM article
-- WHERE ID_FOU = 1 || ID_FOU = 3;

-- Question g. --
-- SELECT * FROM article
-- WHERE ID_FOU IN (1,3);

-- Question h. --
-- SELECT * FROM article
-- WHERE ID_FOU NOT IN (1,3);

-- Question i. --
-- SELECT * FROM bon
-- WHERE Date_CMDE BETWEEN '2019-02-01' AND '2019-04-30';