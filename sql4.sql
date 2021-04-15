Lekcja 4


Zadanie 1
a)
SELECT AVG(waga) FROM kreatura WHERE rodzaj = 'wiking';
b)
SELECT rodzaj, AVG(waga), COUNT(rodzaj) FROM kreatura GROUP BY rodzaj;
c) 
SELECT rodzaj, AVG(YEAR(CURDATE()) - YEAR(dataUr)) FROM kreatura GROUP BY rodzaj;


Zadanie 2
a)
SELECT rodzaj, SUM(waga) FROM zasob GROUP BY rodzaj;
b)
SELECT nazwa, AVG(waga) FROM zasob WHERE ilosc >= 4 GROUP BY nazwa HAVING SUM(waga) > 10;
c)
SELECT rodzaj, COUNT(DISTINCT nazwa) FROM zasob WHERE ilosc > 1 GROUP BY rodzaj;


Zadanie 3
a)
SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura, ekwipunek WHERE kreatura.idKreatury = ekwipunek.idKreatury GROUP BY kreatura.idKreatury;
b)
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura, ekwipunek, zasob WHERE kreatura.idKreatury = ekwipunek.idKreatury AND ekwipunek.idZasobu = zasob.idZasobu;
c)
SELECT kreatura.nazwa from kreatura WHERE kreatura.idKreatury NOT IN(SELECT idKreatury FROM ekwipunek WHERE idKreatury IS NOT NULL);
lub
SELECT kreatura.nazwa FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;

(TO WYŻEJ BARDZIEJ OBRAZOWO)
SELECT kreatura.nazwa, kreatura.idKreatury, ekwipunek.idKreatury FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;

Zadanie 4
ALIASY!!!
SELECT k1.nazwa, k2.nazwa FROM kreatura k1, kreatura k2 WHERE k2.nazwa=k1.nazwa;

a)
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura, ekwipunek, zasob WHERE kreatura.idKreatury = ekwipunek.idKreatury AND ekwipunek.idZasobu = zasob.idZasobu AND YEAR(kreatura.dataUr) BETWEEN 1670 AND 1679;
b)
SELECT kreatura.nazwa FROM kreatura, ekwipunek, zasob WHERE kreatura.idKreatury = ekwipunek.idKreatury AND ekwipunek.idZasobu = zasob.idZasobu AND zasob.rodzaj = 'jedzenie' ORDER BY dataUr DESC LIMIT 5;
c)
SELECT CONCAT(a.nazwa, ' - ', b.nazwa) FROM kreatura a, kreatura b WHERE b.idKreatury - a.idKreatury = 5;


Zadanie 5?????????  
a)
SELECT kreatura.rodzaj, AVG(zasob.waga) FROM kreatura, ekwipunek, zasob WHERE kreatura.idKreatury = ekwipunek.idKreatury AND ekwipunek.idZasobu = zasob.idZasobu GROUP BY kreatura.rodzaj;
b)
SELECT nazwa, MIN(dataUr), rodzaj FROM kreatura
UNION
SELECT nazwa, MAX(dataUr), rodzaj FROM kreatura ORDER BY rodzaj;

SELECT nazwa, dataUr, rodzaj FROM kreatura GROUP BY rodzaj;
