USE GESTIONALE;

-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti.
SELECT * FROM prodotti
where Prezzo > 50;


-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti.
select Email, Nome from clienti
where Nome like 'A%';


-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini.
select * from ordini o
join dettagli_ordini d on o.IDProdotto = d.IDProdotto
where o.Quantità > 10
or d.PrezzoTotale <= 100;

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.
select Prezzo, NomeProdotto from prodotti
where NomeProdotto like '%tech%';


-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti.
select * from clienti
where Email is NULL
or Email = ' ';


-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.
select * from prodotti
where NomeProdotto like 'M%e';

