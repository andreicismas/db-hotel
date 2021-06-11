-- 1.Conta gli ospiti raggruppandoli per anno di nascita
-- 2.Somma i prezzi dei pagamenti raggruppandoli per status
-- 3.Conta quante volte è stata prenotata ogni stanza
-- 4.Fai una analisi per vedere se ci sono ore in cui leprenotazioni sonopiù frequenti
-- 5.Quante prenotazioni ha fatto l’ospite che ha fattopiùprenotazioni? (quante, non chi!

--esercizio 1
SELECT COUNT(`id`), YEAR(`date_of_birth`)
FROM `ospiti` 
GROUP BY `date_of_birth` ASC


--esercizio 2

SELECT SUM(`price`), `status`
FROM `pagamenti`
GROUP BY `status`;

--esercizio 3

SELECT COUNT(`stanza_id`), `stanza_id`
FROM `prenotazioni` 
GROUP BY `stanza_id`;

--esercizio 4

SELECT COUNT(`id`) AS  `person_id`, HOUR(`created_at`) AS `hour_check`
FROM `prenotazioni` 
GROUP BY `hour_check`
ORDER BY `person_id` ASC;

--esercizio 5

SELECT COUNT(`prenotazione_id`) AS `check_number`, `ospite_id` AS `personal_number`
FROM `prenotazioni_has_ospiti` 
GROUP BY  `personal_number`
ORDER by `check_number` ASC;