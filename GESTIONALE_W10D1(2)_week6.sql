-- CREAZIONE DATABASE GESTIONALE
use gestionale;


-- CREAZIONE TABELLA PRODOTTI
create table PRODOTTI 
(IDProdotto int primary key,
NomeProdotto varchar (100),
Prezzo decimal (10,2)
);

-- INSERIMENTO DATI NELLA TABELLA PRODOTTI
INSERT INTO PRODOTTI (IDProdotto, NomeProdotto, Prezzo) VALUES
(1, 'Tablet', 300.00),
(2, 'Mouse', 20.00),
(3, 'Tastiera', 25.00),
(4, 'Monitor', 180.00),
(5, 'HDD', 90.00),
(6, 'SSD', 200.00),
(7, 'RAM', 100.00),
(8, 'Router', 80.00),
(9, 'Webcam', 45.00),
(10, 'GPU', 1250.00),
(11, 'Trackpad', 500.00),
(12, 'Techmagazine', 5.00),
(13, 'Martech', 50.00);

-- CREAZIONE DELLA TABELLA CLIENTI
CREATE TABLE CLIENTI
(IDCliente int primary key,
Nome varchar (50),
Email varchar (100)
);

-- INSERIMENTO DATI NELLA TABELLA CLIENTI
INSERT INTO CLIENTI (IDCliente, Nome, Email) VALUES
(1, 'Antonio', NULL),
(2, 'Battista', 'battista@mailmail.it'),
(3, 'Maria', 'maria@posta.it'),
(4, 'Franca', 'franca@lettere.it'),
(5, 'Ettore', NULL),
(6, 'Arianna', 'arianna@posta.it'),
(7, 'Piero', 'piero@lavoro.it');

-- CREAZIONE DELLA TABELLA ORDINI
CREATE TABLE ORDINI
(IDOrdine int primary key,
IDProdotto int,
IDCliente int,
Quantità int,
foreign key (IDProdotto) references PRODOTTI (IDProdotto),
foreign key (IDCliente) references CLIENTI (IDCliente)
);

-- INSERIMENTO DATI NELLA TABELLA ORDINI
INSERT INTO ORDINI (IDOrdine, IDProdotto, IDCliente, Quantità) values
(1, 2, 1, 10),
(2, 6, 2, 2),
(3, 5, 3, 3),
(4, 1, 4, 1),
(5, 9, 5, 1),
(6, 4, 6, 2),
(7, 11, 7, 6),
(8, 10, 1, 2),
(9, 3, 2, 3),
(10, 3, 3, 1),
(11, 2, 4, 1);

-- CREAZIONE TABELLA DETTAGLI_ORODINI 
create table DETTAGLI_ORDINI
(IDOrdine INT,
IDProdotto INT,
IDCliente INT,
PrezzoTotale decimal (10,2),
primary key (IDOrdine, IDProdotto, IDCliente),
FOREIGN KEY (IDOrdine) REFERENCES ORDINI (IDOrdine),
FOREIGN KEY (IDProdotto) REFERENCES PRODOTTI (IDProdotto),
FOREIGN KEY (IDCliente) REFERENCES CLIENTI (IDCliente)
);

-- CALCOLO DEL PREZZO TOTALE
insert into DETTAGLI_ORDINI (IDOrdine, IDProdotto, IDCliente, PrezzoTotale) select
o.IDOrdine,
o.IDProdotto,
o.IDCliente,
p.Prezzo * o.Quantità as PrezzoTotale
from ORDINI o
join PRODOTTI p on o.IDProdotto = p.IDProdotto;


select * from gestionale.dettagli_ordini;