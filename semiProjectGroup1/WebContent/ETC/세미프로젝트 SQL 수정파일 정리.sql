--�̹ۿ� �߰� VIEW�� �⺻������ project.sql���� Ȯ��

--�������� VIEW ���̺�
CREATE OR REPLACE VIEW good
      AS 
select u.userId userId, m.movienum movienum, m.movieReleaseDate movieReleaseDate,g.genreNum genreNum
from userinfo u, movieinfo m, genre g, moviegenre mg, favTable f
where u.userid = f.userid and m.movienum=f.movienum and m.movienum=mg.movienum and g.genrenum=mg.genrenum;

--FreeBoard ���� ����
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

--���������� ���� ���� �÷� �߰�(Msg Table �÷��߰�)
ALTER TABLE MsgTable ADD(msgDelete varchar(50) );
