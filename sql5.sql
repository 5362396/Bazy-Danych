 Lekcja 5

Zadanie 1
a)
ALTER TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE uczestnicy SELECT * from wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy SELECT * from wikingowie.etapy_wyprawy;
CREATE TABLE sektor SELECT * from wikingowie.sektor;
CREATE TABLE wyprawa SELECT * from wikingowie.wyprawa;
b)
SELECT kreatura.nazwa FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika WHERE uczestnicy.id_uczestnika IS NULL;
c)
SELECT wyprawa.nazwa, SUM(ekwipunek.ilosc) FROM wyprawa, ekwipunek, uczestnicy WHERE ekwipunek.idkreatury=uczestnicy.id_uczestnika AND uczestnicy.id_wyprawy=wyprawa.id_wyprawy GROUP BY wyprawa.nazwa;

Zadanie 2
a)
SELECT wyprawa.nazwa, COUNT(DISTINCT(uczestnicy.id_uczestnika)), GROUP_CONCAT(DISTINCT(kreatura.nazwa)) FROM wyprawa, uczestnicy, kreatura WHERE uczestnicy.id_wyprawy = wyprawa.id_wyprawy AND kreatura.idKreatury=uczestnicy.id_uczestnika GROUP BY wyprawa.nazwa;
b)
SELECT wyprawa.nazwa, etapy_wyprawy.dziennik, sektor.nazwa, kreatura.nazwa FROM etapy_wyprawy, wyprawa, sektor, kreatura WHERE sektor.id_sektora = etapy_wyprawy.sektor AND wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy AND kreatura.idKreatury=wyprawa.kierownik ORDER BY etapy_wyprawy.kolejnosc;

Zadanie 3
a)
SELECT sektor.nazwa, IFNULL(COUNT(etapy_wyprawy.sektor), 0) FROM sektor, etapy_wyprawy WHERE sektor.id_sektora=etapy_wyprawy.sektor GROUP BY sektor.nazwa;
b)
SELECT kreatura.nazwa, IF(COUNT(uczestnicy.id_wyprawy)>0, "Bral udzial w wyprawie", "Nie bral udzialu w wyprawie") FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika GROUP BY kreatura.idKreatury;

Zadanie 4
a)
SELECT wyprawa.nazwa, SUM(LENGTH(etapy_wyprawy.dziennik)) FROM wyprawa, etapy_wyprawy WHERE wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy GROUP BY wyprawa.nazwa HAVING SUM(LENGTH(etapy_wyprawy.dziennik))<400;
b)
SELECT wyprawa.nazwa, (SUM(zasob.waga*zasob.ilosc)/COUNT(uczestnicy.id_uczestnika)) FROM wyprawa, zasob, uczestnicy, ekwipunek WHERE ekwipunek.idzasobu=zasob.idzasobu AND ekwipunek.idKreatury=uczestnicy.id_uczestnika AND uczestnicy.id_wyprawy=wyprawa.id_wyprawy GROUP BY wyprawa.nazwa;

Zadanie 5
SELECT k.nazwa, DATEDIFF(k.dataUr, w.data_rozpoczecia) FROM kreatura k, wyprawa w, uczestnicy u, etapy_wyprawy e WHERE k.idKreatury=u.id_uczestnika AND e.sektor=7;???
SELECT kreatura.nazwa, DATEDIFF(MONTH, '1700-08-02', '1655-10-01') FROM kreatura, wyprawa, etapy_wyprawy;