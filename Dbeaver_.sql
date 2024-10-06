SELECT * from Invoice i limit 100
select * from InvoiceLine il 
select * from Track t
select * from Album a 


select 
    t.TrackId 
    , t.Name 
    , a.Title 
    , a.ArtistId 
    , art.Name 
from  Track t 
join Album a     on t.AlbumId = a.AlbumId
JOIN Artist art  on a.ArtistId = art.ArtistId  
where art.Name  like "A%"
limit 100;

select 
     art.Name 
    , COUNT(t.TrackId) 
from  Track t 
join Album a     on t.AlbumId = a.AlbumId
JOIN Artist artt  on a.ArtistId = art.ArtistId  
where art.Name  like "A%"
GROUP BY 1
ORDER BY 2
limit 100;