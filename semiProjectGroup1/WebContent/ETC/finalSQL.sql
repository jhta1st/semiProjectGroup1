DROP TABLE castInfo;
DROP TABLE charInfo;
DROP TABLE favTable;
DROP TABLE freeBoard;
DROP TABLE freeBoardComm;
DROP TABLE freeBoardImage;
DROP TABLE genre;
DROP TABLE movieGenre;
DROP TABLE movieInfo;
DROP TABLE MsgTable;
DROP TABLE rateTable;
DROP TABLE reviewImage;
DROP TABLE urlInfo;
DROP TABLE UserInfo;

DROP SEQUENCE FREEBOARD_SEQ;
DROP SEQUENCE freeBoardComm_SEQ;
DROP SEQUENCE freeBoardImage_SEQ;
DROP SEQUENCE MsgTable_SEQ;
DROP SEQUENCE reviewImage_SEQ;
DROP SEQUENCE castInfo_SEQ;
DROP SEQUENCE charInfo_SEQ;
DROP SEQUENCE genre_SEQ;
DROP SEQUENCE movieInfo_SEQ;
DROP SEQUENCE urlInfo_SEQ;

/* Create Tables */

--���� �� �Կ���
CREATE TABLE castInfo
(
	castNum number(4) NOT NULL,
	charNum number(4) NOT NULL,
	castDoNum number(4) NOT NULL,
	castDoName varchar2(200) NOT NULL,
	movieNum number(4) NOT NULL,
	PRIMARY KEY (castNum)
);

--�ι� ����
CREATE TABLE charInfo
(
	charNum number(4) NOT NULL,
	charName varchar2(200) NOT NULL,
	charOrgFileName varchar2(200) NOT NULL,
	charSavFileName varchar2(200) NOT NULL,
	PRIMARY KEY (charNum)
);

--���ƿ�
CREATE TABLE favTable
(
	UserId varchar2(20) NOT NULL,
	movieNum number(4) NOT NULL
);

--�����Խ���
CREATE TABLE freeBoard
(
	freeBoardNum number(4) NOT NULL,
	freeBoardTitle varchar2(100),
	freeBoardContent clob,
	freeBoardWdate date,
	UserId varchar2(20) NOT NULL,
	PRIMARY KEY (freeBoardNum)
);

--�ڰ� ���
CREATE TABLE freeBoardComm
(
	freeBoardCommNum number(4) NOT NULL,
	freeBoardCommContent varchar2(1000),
	freeBoardCommWdate date,
	freeBoardNum number(4) NOT NULL,
	UserId varchar2(20) NOT NULL,
	PRIMARY KEY (freeBoardCommNum)
);

--�ڰ� �̹���
CREATE TABLE freeBoardImage
(
	freeBoardImgNum number(4) NOT NULL,
	freeBoardOrgImgName varchar2(20),
	freeBoardSavImgName varchar2(20),
	freeBoardNum number(4) NOT NULL,
	PRIMARY KEY (freeBoardImgNum)
);

--�帣
CREATE TABLE genre
(
	genreNum number(4) NOT NULL,
	genreName varchar2(20) NOT NULL,
	PRIMARY KEY (genreNum)
);

--��ȭ�帣
CREATE TABLE movieGenre
(
	genreNum number(4) NOT NULL,
	movieNum number(4) NOT NULL
);

--��ȭ����
CREATE TABLE movieInfo
(
	movieNum number(4) NOT NULL,
	movieName varchar2(200) NOT NULL,
	movieIntro clob,
	movieReleaseDate date,
	movieRunTime number(4),
	movieProduction varchar2(200),
	movieDistributer varchar2(200),
	Nation varchar2(50),
	movieAge number(3),
	PRIMARY KEY (movieNum)
);

--����
CREATE TABLE MsgTable
(
	msgNum number(4) NOT NULL,
	msgContent varchar2(1000) NOT NULL,
	ReceiveUserId varchar2(20) NOT NULL,
	SendUserId varchar2(20) NOT NULL,
	msgWdate date NOT NULL,
	msgCheck number(1) NOT NULL,
	PRIMARY KEY (msgNum)
);

--����
CREATE TABLE rateTable
(
	rate number(4,2),
	rateComm varchar2(200),
	UserId varchar2(20) NOT NULL,
	movieNum number(4) NOT NULL
);

--��ȭ�̹���
CREATE TABLE reviewImage
(
	imageNum number(4) NOT NULL,
	imageType number(2),
	imageOrgName varchar2(200),
	imageSavName varchar2(200),
	movieNum number(4) NOT NULL,
	PRIMARY KEY (imageNum)
);

--��ȭ���� URL
CREATE TABLE urlInfo
(
	urlNum number(4) NOT NULL,
	urlType number(3) NOT NULL,
	urlAddr varchar2(1000) NOT NULL,
	movieNum number(4) NOT NULL,
	PRIMARY KEY (urlNum)
);

--ȸ������
CREATE TABLE UserInfo
(
	UserId varchar2(20) NOT NULL,
	UserPwd varchar2(20) NOT NULL,
	UserNickName varchar2(50) NOT NULL UNIQUE,
	UserLev number(2),
	UserExp number(5),
	UserJdate date NOT NULL,
	UserPower number(2) NOT NULL,
	PRIMARY KEY (UserId)
);



/* Create Foreign Keys */

ALTER TABLE castInfo
	ADD FOREIGN KEY (charNum)
	REFERENCES charInfo (charNum)
;

ALTER TABLE freeBoardComm --����!
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade    
;

ALTER TABLE freeBoardImage --����!
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade
;

ALTER TABLE movieGenre
	ADD FOREIGN KEY (genreNum)
	REFERENCES genre (genreNum)
;


ALTER TABLE castInfo
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;


ALTER TABLE favTable
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;
ALTER TABLE favTable
	add CONSTRAINT pk_fav primary key(userId,movieNum)
;

ALTER TABLE movieGenre
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;


ALTER TABLE rateTable
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;


ALTER TABLE reviewImage
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;


ALTER TABLE urlInfo
	ADD FOREIGN KEY (movieNum)
	REFERENCES movieInfo (movieNum)
;


ALTER TABLE favTable
	ADD FOREIGN KEY (UserId)
	REFERENCES UserInfo (UserId)
;


ALTER TABLE freeBoard
	ADD FOREIGN KEY (UserId)
	REFERENCES UserInfo (UserId)
;


ALTER TABLE freeBoardComm
	ADD FOREIGN KEY (UserId)
	REFERENCES UserInfo (UserId)
;


ALTER TABLE MsgTable
	ADD FOREIGN KEY (SendUserId)
	REFERENCES UserInfo (UserId)
;


ALTER TABLE MsgTable
	ADD FOREIGN KEY (ReceiveUserId)
	REFERENCES UserInfo (UserId)
;


ALTER TABLE rateTable
	ADD FOREIGN KEY (UserId)
	REFERENCES UserInfo (UserId)
;



CREATE OR REPLACE VIEW MOVIE_VIEW
AS
SELECT M.MOVIENUM,M.movieName,M.movieIntro,M.movieReleaseDate,M.movieRunTime,M.movieProduction,M.movieDistributer,M.Nation,M.movieAge,
G.genreNum,G.genreName
FROM MOVIEINFO M,GENRE G,MOVIEGENRE MG
WHERE m.movienum=mg.movienum AND g.genrenum=mg.genrenum;


CREATE SEQUENCE FREEBOARD_SEQ;

CREATE SEQUENCE freeBoardComm_SEQ;

CREATE SEQUENCE freeBoardImage_SEQ;

CREATE SEQUENCE MsgTable_SEQ;

CREATE SEQUENCE reviewImage_SEQ;

CREATE SEQUENCE castInfo_SEQ;

CREATE SEQUENCE charInfo_SEQ;

CREATE SEQUENCE genre_SEQ;

CREATE SEQUENCE movieInfo_SEQ;

CREATE SEQUENCE urlInfo_SEQ;

--�������� VIEW ���̺�
CREATE OR REPLACE VIEW good
      AS 
select u.userId userId, m.movienum movienum, m.movieReleaseDate movieReleaseDate,g.genreNum genreNum
from userinfo u, movieinfo m, genre g, moviegenre mg, favTable f
where u.userid = f.userid and m.movienum=f.movienum and m.movienum=mg.movienum and g.genrenum=mg.genrenum;

--FreeBoard ���� ����


--���������� ���� ���� �÷� �߰�(Msg Table �÷��߰�)
ALTER TABLE MsgTable ADD(msgDelete varchar(50) ); --����!

--����ũ�� ���� ��
ALTER TABLE RATETABLE MODIFY(RATE NUMBER(4,2));


/* ������ ���� ����� */
INSERT INTO USERINFO VALUES('Master','immaster','������','99','99999',SYSDATE,1);


INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'���');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'��Ÿ��');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'SF');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'�׼�');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'���');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'����');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'����');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'����');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'����');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'�ڹ̵�');
commit;


--�̹ۿ� �߰� VIEW�� �⺻������ project.sql���� Ȯ��

