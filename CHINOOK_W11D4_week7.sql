use chinook;

-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.
select genre.Name NomeGenere, count(track.TrackId) nTrack
from genre
join track on Genre.GenreId = track.GenreId
group by genre.Name
having count(track.TrackId) > 10
order by count(track.TrackId) desc;


-- Trovate le tre canzoni più costose.
select Name Nome, UnitPrice PrezzoMax
from track
order by UnitPrice desc
limit 3;

select* from invoiceline;


-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
select artist.Name NomeArtista, track.Milliseconds/60000 DurataMinuti
from track
join album on track.AlbumId = album.AlbumId
join artist on album.ArtistId = artist.ArtistId
where track.Milliseconds/60000 > 6;

-- Individuate la durata media delle tracce per ogni genere.
select avg(track.Milliseconds/60000) DurataMedia, genre.Name NomeGenere
from genre
join track on genre.GenreId = track.GenreId
group by genre.Name
having avg(track.Milliseconds/60000);


-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
select track.Name NomeCanzone, genre.Name Genere
from track
join genre on track.GenreId = genre.GenreId
where track.Name like '%Love%'
order by genre.Name asc, track.Name asc;


-- Trovate il costo medio per ogni tipologia di media.
select mediatype.Name TipologiaMedia, avg(track.UnitPrice) CostoMedio
from mediatype
join track on mediatype.MediaTypeId = track.MediaTypeId
group by mediatype.Name;

select * from mediatype;


-- Individuate il genere con più tracce.
select distinct genre.Name NomeGenere, count(track.TrackId) nTracce
from track
join genre on track.GenreId = genre.GenreId
group by genre.Name
order by count(track.TrackId) desc
limit 1;

-- Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones. XXXXXXXXXX
select count(album.AlbumId), artist.Name
from album
join artist on album.ArtistId = artist.ArtistId 
where count(album.AlbumId) = 
(select count(album.AlbumId)
 from album 
 join artist on album.ArtistId = artist.ArtistId
 where artist.Name = 'The Rolling Stones')
 GROUP by artist.Name;
 
 
select * from album;



-- Trovate l’artista con l’album più costoso. XXXXXXXXXXXX
select artist.Name NomeArtista, album.Title TitoloAlbum, MAX(track.UnitPrice) PrezzoMax
from track
join album on track.AlbumId = album.AlbumId
join artist on album.ArtistId = artist.ArtistId
group by NomeArtista, TitoloAlbum
having PrezzoMax
LIMIT 1;

select * from invoiceline;