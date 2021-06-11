-- 1. Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
-- 2. Stampare tutti gli ospiti per ogni prenotazione
-- 3. Stampare Nome, Cognome, Prezzo e Pagante per tutte le
-- prenotazioni fatte a Maggio 2018
-- 4. Fai la somma di tutti i prezzi delle prenotazioni per le stanze del
-- primo piano
-- 5. Prendi i dati di fatturazione per la prenotazione con id=7
-- 6. Le stanze sono state tutte prenotate almeno una volta?
-- (Visualizzare le stanze non ancora prenotate)


--esercizio 1
SELECT COUNT(`ospite_id`),`ospiti`.`name`,`ospiti`.`lastname` 
FROM `prenotazioni_has_ospiti` 
LEFT JOIN `ospiti` 
ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id` 
GROUP BY `ospite_id` 
HAVING COUNT(`ospite_id`) > 2;

--esercizio 2
SELECT `prenotazioni_has_ospiti`.`id` 
    AS "prenotazione",`ospite_id`,`ospiti`.*
FROM `prenotazioni_has_ospiti`  
LEFT JOIN `ospiti` 
ON `prenotazioni_has_ospiti`.`ospite_id`=`ospiti`.`id`
ORDER BY `id` ASC;

--esercizio 3
SELECT `pagamenti`.`id`,
    `paganti`.`name` AS `nome_pagante`,
    `paganti`.`lastname` AS `cognome_pagante`,
    `pagamenti`.`price` AS `prezzo`,
    `prenotazioni`.`created_at` AS `data_creazione`
FROM `pagamenti`
LEFT JOIN `prenotazioni`
  ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
LEFT JOIN `paganti`
  ON `paganti`.`id`=`pagamenti`.`pagante_id`
WHERE `prenotazioni`.`created_at`>='2018/05/1'
ORDER BY `id` ASC

-- --esercizio 4
-- SELECT *
-- FROM `pagamenti`
-- LEFT JOIN `prenotazioni`
--     ON `prenotazioni`.`id` = `pagamenti`.`prenotazione_id`
-- LEFT JOIN `stanze` 
-- ON `prenotazioni`.`stanza_id` = `stanze`.`id`
-- WHERE `stanze`.`flour`


-- --esercizio 5
-- SELECT *
-- FROM `pagamenti`
-- LEFT JOIN `paganti`
-- ON `pagamenti`.`pagante_id`=

-- --esercizio 6