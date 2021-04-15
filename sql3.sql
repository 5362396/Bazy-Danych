Lekcja 3


Zadanie 1
tabela.kolumna
baza.tabela
a)
CREATE TABLE kreatura SELECT * from wikingowie.kreatura;
CREATE TABLE zasob SELECT * from wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * from wikingowie.ekwipunek;

b)
SELECT * FROM zasob;

c)
SELECT * FROM zasob WHERE rodzaj='jedzenie';

d)
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury=1 OR idKreatury=3 OR idKreatury=5;
lub SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);


Zadanie 2
a)
SELECT nazwa FROM kreatura WHERE rodzaj!='wiedzma' AND udzwig>=50;
b)
SELECT nazwa FROM zasob WHERE waga>=2 and waga<=5;
SELECT nazwa FROM zasob WHERE waga BETWEEN 2 and 5;
c)
SELECT nazwa FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 and 70;


Zadanie 3
a)
SELECT nazwa FROM zasob WHERE month(dataPozyskania) IN (7,8);
b)
SELECT nazwa FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;
c)
SELECT nazwa FROM kreatura ORDER BY dataUr ASC LIMIT 5;


Zadanie 4
a)
SELECT DISTINCT nazwa FROM zasob;
b)
SELECT CONCAT(nazwa, " - ", rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
c)
SELECT nazwa, ilosc*waga AS wagaCalkowita FROM zasob WHERE dataPozyskania BETWEEN '2000-01-01' and '2007-12-31';


Zadanie 5
a)
SELECT idZasobu, nazwa, (waga*0.7) AS 'jedzenie', (waga*0.3) AS 'odpad' FROM zasob WHERE rodzaj='jedzenie';
b)
SELECT * FROM zasob WHERE rodzaj IS NULL;
c)
SELECT DISTINCT rodzaj FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;