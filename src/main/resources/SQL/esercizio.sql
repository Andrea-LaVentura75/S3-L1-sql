--Es 1--estrai tutti i clienti con nome Mario
--select * from clienti where clienti.nome = 'mario';

--Es 2--estrai il nome e il cognome dei clienti nati nello stesso anno (1999)
--select * from clienti where clienti.anno_di_nascita = 1999;

--Es 3--estrarre il numero delle fatture con iva al 20
--select numero_fattura from fattura where iva = 20;

--Es 4-- estrarre prodotti attivati nel 2017e che sono in produzione o in commercio
--select * from prodotti where EXTRACT(Year from prodotti.data_attivazione) = 2017
--and (prodotti.in_produzione= true or prodotti.in_commercio = true);

--Es 5--estrarre le fatture con importo inferiore a mille
--select * from fattura  join clienti on clienti.numero_clienti = fattura.id_cliente where fattura.importo < 1000

--Es 6--riportare l'elenco delle fatture (numero importo iva e data) con aggiunta il nome del fornitore
--select numero_fattura, importo, iva , data_fattura, fornitori.denominazione
--from fattura join fornitori on fattura.numero_fornitore = fornitori.numero_fornitore

--Es 7considerando solo fatture con iva al 20%, estrarre il numero di fatture per ogni anno
--select  EXTRACT (YEAR FROM data_fattura), count(iva) as numero_fatture_per_anno from fattura where  fattura.iva = 20
--group by  EXTRACT (YEAR FROM data_fattura);

--Es 8--riportare il numero di fatture e la somma dei relativi importi divisi per anno di fatturazione
--select  EXTRACT (YEAR FROM data_fattura), count(*) as numero_fatture_per_anno, sum(importo) as totate_importi_annuale from fattura
--group by  EXTRACT (YEAR FROM data_fattura);

--Es 9--estrarre gli anni in cui sono state registrate più fattue di tipo A
/*SELECT EXTRACT(YEAR FROM data_fattura) AS anno,
       COUNT(*) AS numero_fatture_per_anno
FROM fattura
WHERE tipologia = 'a'
GROUP BY EXTRACT(YEAR FROM data_fattura)
HAVING COUNT(*) > 1;*/

--Es 10--estrarre  il totale degli importi delle fatture divisi per residenza dei clienti
--select sum (importo) as importi_regione, clienti.regione_residenza from fattura join clienti on clienti.numero_clienti = fattura.id_cliente
--group by clienti.regione_residenza;

--Es 11--estrarre il numero dei clienti nati nel 1980 che hanno almeno una fattura superiore a 50
/*SELECT
    COUNT(DISTINCT clienti.numero_clienti) AS numero_clienti
FROM
    clienti
JOIN
    fattura
ON
    clienti.numero_clienti = fattura.id_cliente
WHERE
    clienti.anno_di_nascita = 1999
    AND fattura.importo > 50;*/


