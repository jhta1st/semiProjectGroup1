CREATE OR REPLACE VIEW good
      AS 
select u.userId userId, m.movienum movienum, m.movieReleaseDate movieReleaseDate,r.rate rate, g.genreNum genreNum
from userinfo u, movieinfo m, ratetable r, genre g, moviegenre mg
where u.userid = r.userid and m.movienum=r.movienum and m.movienum=mg.movienum and g.genrenum=mg.genrenum;
