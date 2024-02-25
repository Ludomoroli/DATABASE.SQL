use chinook;

-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.
select track.Name as NomeTraccia, genre.Name as NomeGenere
from track
join genre on track.GenreId = genre.GenreId
where genre.Name = 'Pop'
or genre.Name = 'Rock';

select * from track;

-- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
select artist.Name as NomeArtista, album.Title as TitoloAlbum
from artist
join album on artist.ArtistId = album.ArtistId
where artist.Name like 'A%'
and album.Title like 'A%';

select artist.Name as NomeArtista, album.Title as TitoloAlbum
from artist
join album on artist.ArtistId = album.ArtistId
where artist.Name like 'A%'
or album.Title like 'A%';

-- Recuperate i nomi degli album o degli artisti che abbiano pubblicazioni precedenti all’anno 2000.


-- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
select track.Name as NomeTraccia, genre.Name as NomeGenere, track.Milliseconds/60000 as DurataMinuti
from track
join genre on track.GenreId = genre.GenreId
where genre.Name = 'Jazz'
or track.Milliseconds/60000 < 3;

-- oppure
select track.Name as NomeTraccia, genre.Name as NomeGenere, 
concat( floor(Milliseconds/60000),
":",
lpad(floor((Milliseconds % 60000) / 1000),
2, '0' )) as DurataMinuti
from track
join genre on track.GenreId = genre.GenreId
where genre.Name = 'Jazz'
or track.Milliseconds < 180000;


-- Recuperate tutte le tracce più lunghe della durata media.
select Name, Milliseconds
from track
where Milliseconds > (select avg(Milliseconds) from track);

-- oppure
select Name, 
concat( floor(Milliseconds/60000),
":",
lpad(floor((Milliseconds % 60000) / 1000),
2, '0' )) as DurataMinuti
from track
where Milliseconds > (select avg(Milliseconds) from track);


-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.
select genre.Name AS GenreName
FROM track
JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.GenreId
HAVING AVG(track.Milliseconds) > 240000;

-- Individuate gli artisti che hanno rilasciato più di un album.
select artist.Name as NomeArtista, count(album.AlbumId) as AlbumRilasciati
from artist
join album on artist.ArtistId = album.ArtistId
group by artist.Name
having count(album.AlbumId) > 1;



-- Trovate la traccia più lunga in ogni album.
select track.Name as NomeTraccia, track.Milliseconds/60000.0 as DurataMinuti, album.Title as NomeAlbum
from album
join track on album.AlbumId = track.AlbumId
join (select AlbumId, max(Milliseconds) as MaxDurata
from track
group by AlbumId) as MaxTrack
on track.AlbumId = MaxTrack.AlbumId
and track.Milliseconds = MaxTrack.MaxDurata;

-- oppure
select album.Title albumTitle, MAX(track.Milliseconds)/60000 maxTrack from album
join track on album.AlbumId = track.AlbumId
group by album.Title;




-- Individuate la durata media delle tracce per ogni album.        
select album.Title as TitoloAlbum, avg(track.Milliseconds)/1000 as Durata
from track
join album on track.AlbumId = album.AlbumId
group by album.AlbumId;


select * from track;

-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
select album.Title TitoloAlbum, count(track.TrackId) nTrack
from album
join track on album.AlbumId = track.AlbumId
group by album.Title
having count(track.TrackId) > 20;

