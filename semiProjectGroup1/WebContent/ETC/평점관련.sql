CREATE OR REPLACE VIEW good
      AS 
select u.userId userId, m.movienum movienum, m.movieReleaseDate movieReleaseDate,g.genreNum genreNum
from userinfo u, movieinfo m, genre g, moviegenre mg, favTable f
where u.userid = f.userid and m.movienum=f.movienum and m.movienum=mg.movienum and g.genrenum=mg.genrenum;