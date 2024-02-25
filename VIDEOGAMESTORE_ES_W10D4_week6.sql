use videogamestoredb;

-- Seleziona tutti gli impiegati con una laurea in Economia.
select * from impiegato
where TitoloStudio = 'Laurea in Economia';


-- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica.
SELECT * FROM impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE servizio_impiegato.carica = "Cassiere"
OR impiegato.titolostudio = "Diploma di Informatica";

select * from servizio_impiegato;


-- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023.
select Nome, TitoloStudio from impiegato
LEFT JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
where servizio_impiegato.DataInizio > '2023-01-01';


-- Seleziona i titoli di studio distinti tra gli impiegati.
select distinct (TitoloStudio) from impiegato;


-- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia". 
select * from impiegato
where TitoloStudio <> 'Laurea in Economia';

select * from impiegato
where TitoloStudio not like 'Laurea in Economia';


-- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi. 
select * from impiegato
JOIN servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
where servizio_impiegato.DataInizio < '2023-07-01'
and servizio_impiegato.Carica = 'Commesso';

select DataInizio from servizio_impiegato;


-- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020.
select Titolo, Sviluppatore
from videogioco
where year(AnnoDistribuzione) = '2020';

select * from videogioco;


-- Seleziona i titoli dei videogiochi disponibili nei settori 1 o 3 del negozio 5.


-- Seleziona i negozi con più di 20 copie disponibili di almeno un videogioco.
