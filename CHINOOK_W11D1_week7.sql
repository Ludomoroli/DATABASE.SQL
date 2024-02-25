-- ESERCIZIO 1
-- Cominciate facendo un’analisi esplorativa del database, ad esempio: Fate un elenco di tutte le tabelle. 
show tables;

-- Visualizzate le prime 10 righe della tabella Album. 
select * from album
limit 10;

-- Trovate il numero totale di canzoni della tabella Tracks. 
select count(*)
from track;

-- Trovate i diversi generi presenti nella tabella Genre.
select distinct GenreId, Name
from genre;

-- … … Effettuate tutte le query esplorative che vi servono per prendere confidenza con i dati.



-- ESERCIZIO 2
-- Recuperate il nome di tutte le tracce e del genere associato.
select track.Name, genre.Name
from track
join genre on track.GenreId = genre.GenreId
order by genre.Name;


-- ESERCIZIO 3
-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?
select distinct artist.Name
from artist
join album on artist.ArtistId = album.ArtistId
order by artist.Name;
-- oppure 
SELECT artist.Name FROM artist
WHERE EXISTS (SELECT album.AlbumId FROM album WHERE artist.ArtistId = album.ArtistId)
ORDER BY 1;

-- ESERCIZIO 4
-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media? 
select track.Name as TrackName, genre.Name as GenreName, mediatype.Name as MediaName, count(*)
from track
inner join genre on track.GenreId = genre.GenreId
inner join mediatype on track.MediaTypeId = mediatype.MediaTypeId
group by track.Name, genre.Name, mediatype.Name;

select track.Name as TrackName, count(*)
from track
inner join genre on track.GenreId = genre.GenreId
inner join mediatype on track.MediaTypeId = mediatype.MediaTypeId
group by track.Name;

-- ESERCIZIO 5 
-- Elencate i nomi di tutti gli artisti e dei loro album.
select artist.Name as NameArtist, album.Title as TitleAlbum
from artist
join album on artist.ArtistId = album.ArtistId;