use sakila;

-- ES 1
-- Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
select c.customer_id, concat(first_name," ",last_name) NomeCliente
from customer c 
where not exists
(select r.customer_id from rental r where DATE_FORMAT(rental_date, "%m - %Y") = "01 - 2006" and r.customer_id = c.customer_id);

-- ES 2
-- Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005
select (film.film_id), film.title, count(*)
from film
join inventory using (film_id)
join rental using (inventory_id)
where year(rental.rental_date) = '2005'
and quarter(rental.rental_date) = 3
group by film.film_id, film.title
having count(film.film_id) > 10;


-- ES 3
-- Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
select count(rental_id) TotNoleggi from rental
where rental_date = '2006-01-01';


-- ES 4
-- Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
select sum(amount) TotaleIncassoWeekend
from payment
where dayofweek(payment_date) in (1, 7);

-- ES 5
-- Individuate il cliente che ha speso di più in noleggi.
select concat(customer.first_name," ", customer.last_name) NomeCliente, customer.customer_id IdCliente, sum(payment.amount) Totale
from payment
join customer using (customer_id)
group by NomeCliente, IdCliente
order by Totale desc
limit 1;

-- ES 6
-- Elencate i 5 film con la maggior durata media di noleggio.
select film_id, title Titolo, avg(datediff(rental.return_date, rental.rental_date)) DurataMedia
from film
join inventory using (film_id)
join rental using (inventory_id)
group by film_id, Titolo
order by DurataMedia desc
limit 5;


