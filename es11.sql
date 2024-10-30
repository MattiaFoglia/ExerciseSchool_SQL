-- 1
SELECT  docenti.Cognome, docenti.Nome FROM Docenti
JOIN materie ON Docenti.idmateria = materie.idMateria
WHERE (nomeMateria = "sistemi"
OR nomeMateria = "italiano")
ORDER BY docenti.Cognome
;
-- 2
SELECT distinct studenti.Cognome,studenti.nome,classe FROM studenti
JOIN voti ON voti.idstudente = studenti.idstudente
JOIN materie ON voti.idmateria = materie.idMateria
WHERE Voti.voto > 6
AND nomeMateria = "informatica"
;
-- 3
SELECT distinct count(*) AS NumeroProve ,nomeMateria FROM studenti
JOIN voti ON voti.idstudente = studenti.idstudente
JOIN materie ON voti.idmateria = materie.idMateria
WHERE studenti.nome = "Francesca"
AND studenti.cognome = "Verdi"
GROUP BY materie.idMateria
;
-- 4
SELECT avg(voti.voto) AS MediaVoti , nomeMateria FROM studenti
JOIN voti ON voti.idstudente = studenti.idstudente
JOIN materie ON voti.idmateria = materie.idMateria
WHERE studenti.nome = "Franco"
AND studenti.cognome = "Rossi"
GROUP BY materie.idMateria
;
-- 5
SELECT Cognome, nome, count(*) AS NumeroProve
FROM studenti
JOIN voti ON voti.idstudente = studenti.idstudente
JOIN materie ON voti.idmateria = materie.idMateria
WHERE Voti.voto >= 6
AND nomeMateria = "informatica"
GROUP BY studenti.idStudente
ORDER BY Cognome
;

-- 6
SELECT docenti.cognome, docenti.nome, count(voti.voto) as numProve FROM Docenti
JOIN voti ON voti.idDocente = docenti.idDocente
GROUP BY Docenti.idDocente
HAVING numProve >= 2
ORDER BY docenti.Cognome
;

-- 7
SELECT docenti.Cognome, docenti.Nome FROM Docenti
JOIN voti ON voti.idDocente = docenti.idDocente
JOIN studenti ON voti.idstudente = studenti.idstudente
WHERE studenti.cognome like "B%"
GROUP BY Docenti.idDocente
;
-- 8
SELECT docenti.cognome, docenti.nome , materie.nomeMateria FROM Docenti
JOIN voti ON voti.idDocente = docenti.idDocente
JOIN materie ON voti.idmateria = materie.idMateria
WHERE dataVoto > "%-03-01"
GROUP BY Docenti.idDocente
ORDER BY docenti.Cognome
;
-- 9
SELECT studenti.classe, avg(voti.voto) AS MediaClasse FROM studenti
JOIN voti ON voti.idStudente = studenti.idStudente
GROUP BY Studenti.Classe
ORDER BY MediaClasse
;
-- 10
SELECT studenti.classe, count(studenti.idStudente) AS NumeroStudentiSufficenti FROM studenti
JOIN voti ON voti.idStudente = studenti.idStudente
WHERE Voto >= 6
GROUP BY Studenti.Classe
;