--이밖에 추가 VIEW나 기본셋팅은 project.sql에서 확인

--평점관련 VIEW 테이블
CREATE OR REPLACE VIEW good
      AS 
select u.userId userId, m.movienum movienum, m.movieReleaseDate movieReleaseDate,g.genreNum genreNum
from userinfo u, movieinfo m, genre g, moviegenre mg, favTable f
where u.userid = f.userid and m.movienum=f.movienum and m.movienum=mg.movienum and g.genrenum=mg.genrenum;

--FreeBoard 관련 수정
ALTER TABLE freeBoardComm
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade    
;
ALTER TABLE freeBoardImage
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade
;
ALTER TABLE favTable
	add constraint pk_fav primary key(userId,movieNum)
;

--쪽지페이지 삭제 여부 컬럼 추가(Msg Table 컬럼추가)
ALTER TABLE MsgTable ADD(msgDelete varchar(50) );
