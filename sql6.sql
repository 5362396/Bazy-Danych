Lekcja 6 - NIE BĘDZIE NA KOLOSIE
SHOW triggers;
SHOW CREATE trigger nazwa;
SHOW PROCEDURE STATUS WHERE db = 'nazwa_bazy';
SHOW FUNCTION STATUS WHERE db = 'nazwa_bazy';
DROP FUNCTION nazwa;

# wyjaśnienie pojęcia [NOT] DETERMINISTIC
Funkcja deterministyczna to taka, która dla tych samych danych wejściowych zwraca zawsze
taki sam wynik. Funkcja nie deterministyczna może zwrócić różne wyniki dla tego samego
parametru wejściowego, np. poprzez jakąś losowość, np. rzut kostką, losowanie wartości z przedziału itp).


Zadanie 1
DELIMITER //
CREATE TRIGGER kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
  IF NEW.waga <= 0
  THEN
    SET NEW.waga = 1;
  END IF;
END
//
DELIMITER ;

Zadanie 2???
CREATE TABLE archiwum_wypraw (
id_wyprawy int PRIMARY KEY
auto_increment,
nazwa varchar(40),
data_rozpoczecia date,
data_zakonczenia date,
kierownik varchar(40));

DELIMITER $$
CREATE TRIGGER archiwum_wypraw_update
BEFORE DELETE
ON wyprawa FOR EACH ROW
BEGIN
    INSERT INTO archiwum_wypraw(id_wyprawy,nazwa,data_rozpoczecia, data_zakonczenia, kierownik)
    VALUES(id_wyprawy, nazwa, data_rozpoczecia, data_zakonczenia, kreatura.nazwa????????????);
END
$$
DELIMITER ;

Zadanie 3
a)
DELIMITER $$
CREATE PROCEDURE eliksir_sily(IN id int)
UPDATE kreatura 
set udzwig = 1.2 * udzwig where idKreatury = id
$$
DELIMITER ;

Wywołanie procedury
CALL eliksir_sily(1);
b)
DELIMITER $$
CREATE FUNCTION to_upper(tekst text) RETURNS text DETERMINISTIC
BEGIN
	RETURN upper(tekst);
END
$$
DELIMITER ;

Wywołanie funkcji
SELECT to_upper("ala ma kota");

Zadanie 4
a)
CREATE TABLE system_alarmowy (
id_alarmu int PRIMARY KEY
auto_increment,
wiadomosc varchar(200));
b)?????????
DELIMITER $$
CREATE TRIGGER system_alarmowy_tesciowa
AFTER INSERT ON wyprawa
FOR EACH ROW
BEGIN
IF EXISTS (SELECT wyprawa.id_wyprawy FROM wyprawa WHERE id_uczestnika=3 AND etapy_wyprawy.sektor=7) THEN
    INSERT INTO system_alarmowy(wiadomosc)
    VALUES("Teściowa nadchodzi !!!");
END IF;
END
$$
DELIMITER ;

id_uczestnika=3
id_sektora=7


























