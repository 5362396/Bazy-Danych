Lekcja 1


Zadanie 1
a)
CREATE TABLE postac (
id_postaci int PRIMARY KEY
auto_increment,
nazwa varchar(40),
rodzaj enum('wiking','ptak','kobieta'),
data_ur date,
wiek int unsigned);

b)
INSERT INTO postac (nazwa, data_ur, rodzaj, wiek) VALUES('Bjorn','1800-11-04','wiking',219);
//lub w kolejności w jakiej jest zdefiniowane w tabeli//
INSERT INTO postac VALUES (2,'Drozd','ptak','1950-01-01',69);

select * from postac;

c)
UPDATE postac SET wiek=88 WHERE id_postaci=3;


Zadanie 2
a)
CREATE TABLE walizka (
id_walizki int primary key
auto_increment,
pojemnosc int unsigned,
kolor enum('rozowy','czerwony','teczowy','zolty'),
id_wlasciciela int,
FOREIGN KEY (id_wlasciciela)
REFERENCES postac(id_postaci)
ON DELETE CASCADE
ON DELETE SET NULL
ON DELETE RESTRICT
);
show create table walizka;
describe walizka;

b)
#1 usuniecie klucza obcego
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
#2 ponowne dodanie klucza
ALTER TABLE walizka ADD FOREIGN KEY (id_wlasciciela) REFERENCES postac (id_postaci) ON DELETE CASCADE;

ALTER TABLE walizka ALTER COLUMN kolor set default 'rozowy';

c)
INSERT INTO walizka VALUES (1,'10', 'czerwony',1);
INSERT INTO walizka VALUES (2,'5',default,3);


Zadanie 3
a)
CREATE TABLE izba (
adres_budynku varchar(255),
nazwa_izby varchar(255),
metraz int unsigned,
wlasciciel int,
PRIMARY KEY(adres_budynku,nazwa_izby),
FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL
);

b)
ALTER TABLE izba ADD COLUMN kolor varchar(255) default 'czarny' after metraz;
c)
INSERT INTO izba VALUES ('24/7','spizarnia',3,default,1);


Zadanie 4
a)
CREATE TABLE przetwory (
id_przetworu int primary key
auto_increment,
rok_produkcji int(4),
id_wykonawcy int,
zawartosc varchar(255),
dodatek varchar(255) default 'papryczka chili',
id_konsumenta int,
FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci),
FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci)
);

b)
INSERT INTO przetwory VALUES (1,1984,1,"bigos",default,3);


Zadanie 5
a)
INSERT INTO postac VALUES (
4, 'Astrid', 'wiking', '1905-12-30', 250, default, default),
(5, 'Olaf', 'wiking', '1906-11-15', 250, default, default),
(6, 'Johan', 'wiking', '1923-04-21', 250, default, default),
(7, 'Balbina', 'wiking', '1914-02-13', 250, default, default),
(8, 'Gunter', 'wiking', '1934-03-05', 250, default, default);

b)
CREATE TABLE statek (
nazwa_statku varchar(100) PRIMARY KEY,
rodzaj_statku enum('Galeon','Slup','Barka'),
data_wodowania date,
max_ladownosc int unsigned);

c)
INSERT INTO statek VALUES (
'Titanic', 'Barka', '1950-07-16', 200),
('Ork', 'Galeon', '1969-11-21', 300);

d)
ALTER TABLE postac ADD COLUMN funkcja varchar(50);

e)
UPDATE postac SET funkcja='kapitan' WHERE id_postaci=1;

f)
ALTER TABLE postac ADD COLUMN statek varchar(100);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek (nazwa_statku);

g)
UPDATE postac SET statek = 'Ork' WHERE id_postaci = 1;
UPDATE postac SET statek = 'Ork' WHERE id_postaci = 2;
UPDATE postac SET statek = 'Titanic' WHERE id_postaci = 4;
UPDATE postac SET statek = 'Ork' WHERE id_postaci = 5;
UPDATE postac SET statek = 'Titanic' WHERE id_postaci = 6;
UPDATE postac SET statek = 'Titanic' WHERE id_postaci = 7;
UPDATE postac SET statek = 'Titanic' WHERE id_postaci = 8;

h)
DELETE FROM izba WHERE nazwa_izby = 'Spizarnia';

i)
DROP TABLE izba;
































