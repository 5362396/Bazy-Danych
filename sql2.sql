1).a)
	
	a) wyświetlenie tylko wikingów;
	SELECT * FROM postac WHERE rodzaj='wiking';

	b) jak a + bez Bjorna;
	SELECT nazwa, data_ur FROM postac WHERE rodzaj='wiking' and nazwa!='Bjorn';
	
	e) ułożenie N rekordów
	SELECT nazwa, data_ur FROM postac WHERE rodzaj='wiking' and nazwa!='Bjorn' ORDER BY data_ur ASC LIMIT 2;

	f) usunięcie N rekordów
	DELETE FROM postac WHERE rodzaj='wiking' and nazwa!='Bjorn' ORDER BY data_ur ASC LIMIT 2;


1.b) usunięcie kluczy odwołujących się do tabeli postaci

SHOW CREATE TABLE walizka;
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;

pozbycie się auto_increment z głównego

ALTER TABLE postac CHANGE id_postaci idPostaci int;
lub ALTER TABLE postac MODIFY id_postaci int;

usunięcie głównego

ALTER TABLE postac DROP PRIMARY KEY;



2.a)
ALTER TABLE postac ADD COLUMN pesel varchar(11);
ALTER TABLE postac ADD PRIMARY KEY(pesel);
UPDATE postac SET pesel=1434564+id_postaci;

b) ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena');

c) INSERT INTO postac VALUES (9, 'Gertruda Nieszczera', 'syrena', '1798-06-22', 250, default, default);



3.a)
UPDATE postac SET statek='Santa Maria'
WHERE nazwa like '%a%';

b)
UPDATE statek set ladownosc=ladownosc*0.7
WHERE data_wodowania >= '1901-01-01'
and data_wodowania <= '2000-12-31';

lub

UPDATE statek set ladownosc=ladownosc*0.7
WHERE data_wodowania BETWEEN '1901-01-01'
and '2000-12-31';

c) CHECK() ???



4.a)
ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac VALUES (10, 'Loko', 'waz', '1567-01-05', 424, default, default);

b) #1 - CREATE LIKE
CREATE TABLE marynarz LIKE postac;
INSERT marynarz SELECT * FROM postac WHERE statek IS NOT NULL;
#2 - CREATE TABLE [AS] SELECT
CREATE TABLE marynarz SELECT * FROM postac WHERE statek is not NULL;

c)
ALTER TABLE marynarz ADD PRIMARY KEY (id_postaci);
ALTER TABLE marynarz ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku) ON DELETE CASCADE;



5.a)
UPDATE postac SET statek=NULL;
b)
DELETE FROM postac WHERE id_postaci=...;
c)
DELETE FROM statek;
d)
DROP TABLE statek; (usunac klucze)
e)
CREATE TABLE zwierz(id int PRIMARY KEY auto_increment, nazwa varchar(200), wiek int unsigned);
f)
INSERT INTO zwierz VALUES (SELECT ... FROM postac WHERE ...);
lub INSERT zwierz SELECT id_postaci, nazwa, wiek FROM postac WHERE rodzaj IN ('ptak', 'syrena', 'waz');
	











