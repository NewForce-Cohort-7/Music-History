--Query all of the entries in the Genre table
--Select * from genre;


--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--Select * from Artist Order By ArtistName;

--Write a SELECT query that lists all the songs in the Song table and include the Artist name
--Select s.Title, s.ArtistId, a.Id, a.ArtistName from Song s 
--Join Artist a on s.ArtistId = a.Id;

--Write a SELECT query that lists all the Artists that have a Pop Album Genre = 7
--Select * from Artist a
--join Album al on a.id = al.ArtistId
--join Genre g on al.GenreId = g.Id
----Where al.GenreId = 7
--Where g.Name = 'Pop'

--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
--Select * from Artist a
--Join Album al on al.ArtistId = a.Id
--Join Genre g on al.GenreId = g.Id
--Where g.Name = 'Rock' OR g.Name = 'Jazz'

--Write a SELECT statement that lists the Albums with no songs
--Select * from Song s
--JOIN Album al on al.Id = s.AlbumId
--Where s.AlbumId is Null


--Using the INSERT statement, add one of your favorite artists to the Artist table.
--Insert Into Artist (ArtistName, YearEstablished) VALUES ('Doja Cat', 2012)

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--Select * from Genre;
--Insert Into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
--Values ('Planet Her', '06/25/2021', 2646, 'RCA', 28, 7)

--Using the INSERT statement, add some songs that are on that album to the Song table.
--Select * From Album
--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
--Values ('Woman', 172, '06/25/2021', 7, 28, 25)
--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
--Values ('Get Into It', 223, '06/25/2021', 7, 28, 25)
--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
--Values ('Kiss Me More', 208, '06/25/2021', 7, 28, 25)
--Insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
--Values ('You Right', 186, '06/25/2021', 7, 28, 25)
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--Select s.Title, al.Title, a.ArtistName
--From Album al
--Left Join Song s on s.AlbumId = al.Id
--Left Join Artist a on al.ArtistId = a.Id 
--Where a.ArtistName = 'Doja Cat'

--NOTE: Direction of join matters. Try the following statements and see the difference in results.

--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--Select a.Title, Count(s.Id) AS '# of songs'
--from Album a
--Left Join Song s on a.Id = s.AlbumId
--Group by a.Title

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--Select a.ArtistName, Count(s.Id) as '# of songs'
--from Artist a
--Left join Song s on s.ArtistId = a.Id
--Group by a.ArtistName


--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--select g.Name, COUNT(s.Id) as '# of songs'
--from Genre g
--Left Join Song s on s.GenreId = g.Id
--Group by g.Name


--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
--Select a.ArtistName, COUNT(al.Label) as '# of labels'
--from Artist a
--Left Join Album al on al.ArtistId = a.Id
--Group by a.ArtistName
--Having COUNT(distinct al.Label) > 1


--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
--Select al.Title, al.AlbumLength
--from Album al 
--Where AlbumLength = (Select MAX(AlbumLength) from Album)


--Select Top 1 al.Title, MAX(al.AlbumLength)
--from Album al
--GROUP BY al.title
--Order by MAX(al.AlbumLength) desc


--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--Select s.Title, s.SongLength
--from Song s
--Where s.SongLength = (Select MAX(s.SongLength) from Song s)

--Select * from Song Order By SongLength


--Modify the previous query to also display the title of the album.
--Select s.Title, s.SongLength, a.Title
--from Song s
--Join Album a on s.AlbumId = a.Id
--Where s.SongLength = (Select MAX(s.SongLength) from Song s)

exec sp_help Album