-- Effettuate un’esplorazione preliminare del database. Di cosa si tratta? Quante e quali tabelle contiene? 
-- Fate in modo di avere un’idea abbastanza chiara riguardo a con cosa state lavorando.
use sakila;
show tables;
SELECT COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'sakila';
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sakila';


-- Scoprite quanti clienti si sono registrati nel 2006.
select distinct count(*) from customer
where create_date between '2006-01-01' and '2006-12-31';


-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
select count(rental_id) from rental
where rental_date = '2006-01-01';

select * from rental;
--      NON ESISTONO NOLEGGI EFFETTUATI IL 1/1/2006


-- Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
SELECT film.title Titolo, rental.rental_id IdNoleggio, concat(customer.first_name, " ", customer.last_name) NomeCliente, inventory_id, rental_date DataNoleggio
FROM rental
JOIN customer USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
WHERE rental_date 
BETWEEN (SELECT (ADDDATE(MAX(rental_date), - 7))
FROM rental) 
AND (SELECT MAX(rental_date)
FROM rental);

-- Calcolate la durata media del noleggio per ogni categoria di film.
select AVG(datediff(rental.return_date, rental.rental_date)) MediaNoleggio, film_category.category_id IdCategoria
from rental
join inventory using (inventory_id)
join film using (film_id)
join film_category using (film_id)
group by film_category.category_id
having AVG(datediff(rental.return_date, rental.rental_date));

select * from film_text;


-- Trovate la durata del noleggio più lungo.
select max(datediff(return_date, rental_date)) NoleggioMax
from rental;
