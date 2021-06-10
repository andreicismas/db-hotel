--1. Seleziona tutti gli ospiti che sono stati identificati con la carta di
--identità
--2. Seleziona tutti gli ospiti che sono nati dopo il 1988
--3. Seleziona tutti gli ospiti che hanno più di 20 anni (al momento
--dell’esecuzione della query)
--4. Seleziona tutti gli ospiti il cui nome inizia con la D
--5. Calcola il totale incassato degli ordini accepted
--6. Qual è il prezzo massimo pagato?
--7. Seleziona gli ospiti riconosciuti con patente e nati nel 1975
--8. Quanti paganti sono anche ospiti?
--9. Quanti posti letto ha l’hotel in totale?

--esercizio-1
SELECT * 
FROM `ospiti` 
WHERE `document_type`="CI";

--esercizio-2
SELECT * 
FROM `ospiti` 
WHERE YEAR(date_of_birth) > 1988;

--esercizio-3
SELECT * 
FROM `ospiti` 
WHERE (YEAR(CURRENT_DATE) - YEAR(date_of_birth)) > 20;

--esercizio-4
SELECT * 
FROM `ospiti` 
WHERE `name` LIKE 'D%';


--esercizio-5
SELECT SUM(price) 
FROM `pagamenti`
WHERE status = 'accepted';

--esercizio-6
SELECT MAX(price) 
FROM `pagamenti`;


--esercizio-7
SELECT * 
FROM `ospiti`
WHERE `document_type` = "Driver License"
  AND YEAR(`date_of_birth`) = 1975;

--esercizio-8
SELECT *
FROM `paganti`
WHERE `ospite_id` IS NOT NULL;

-- SELECT *
-- FROM `paganti`
-- WHERE `ospite_id`> 0;

--esercizio-9
SELECT SUM(`beds`) 
FROM `stanze`;

