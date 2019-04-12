
/* Create Tables */

CREATE TABLE castInfo
(
	castNum number(4) NOT NULL,
	charNum number(4) NOT NULL,
	castDoNum number(4) NOT NULL,
	castDoName varchar2(20) NOT NULL,
	movieNum number(4) NOT NULL,
	PRIMARY KEY (castNum)
);


CREATE TABLE charInfo
(
	charNum number(4) NOT NULL,
	charName varchar2(20) NOT NULL,
	charOrgFileName varchar2(20) NOT NULL,
	charSavFileName varchar2(20) NOT NULL,
	PRIMARY KEY (charNum)
);


CREATE TABLE favTable
(
	UserId varchar2(20) NOT NULL,
	movieNum number(4) NOT NULL
);


CREATE TABLE freeBoard
(
	freeBoardNum number(4) NOT NULL,
	freeBoardTitle varchar2(100),
	freeBoardContent clob,
	freeBoardWdate date,
	UserId varchar2(20) NOT NULL,
	PRIMARY KEY (freeBoardNum)
);


CREATE TABLE freeBoardComm
(
	freeBoardCommNum number(4) NOT NULL,
	freeBoardCommContent varchar2(1000),
	freeBoardCommWdate date,
	freeBoardNum number(4) NOT NULL,
	UserId varchar2(20) NOT NULL,
	PRIMARY KEY (freeBoardCommNum)
);


CREATE TABLE freeBoardImage
(
	freeBoardImgNum number(4) NOT NULL,
	freeBoardOrgImgName varchar2(20),
	freeBoardSavImgName varchar2(20),
	freeBoardNum number(4) NOT NULL,
	PRIMARY KEY (freeBoardImgNum)
);


CREATE TABLE genre
(
	genreNum number(4) NOT NULL,
	genreName varchar2(20) NOT NULL,
	PRIMARY KEY (genreNum)
);


CREATE TABLE movieGenre
(
	genreNum number(4) NOT NULL,
	movieNum number(4) NOT NULL
);


CREATE TABLE movieInfo
(
	movieNum number(4) NOT NULL,
	movieName varchar2(50) NOT NULL,
	movieIntro clob,
	movieReleaseDate date,
	movieRunTime number(4),
	movieProduction varchar2(20),
	movieDistributer varchar2(20),
	Nation varchar2(20),
	movieAge number(3),
	PRIMARY KEY (movieNum)
);


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


CREATE TABLE rateTable
(
	rate number(2,2),
	rateComm varchar2(100),
	UserId varchar2(20) NOT NULL,
	movieNum number(4) NOT NULL
);


CREATE TABLE reviewImage
(
	imageNum number(4) NOT NULL,
	imageType number(2),
	imageOrgName varchar2(20),
	imageSavName varchar2(20),
	movieNum number(4) NOT NULL,
	PRIMARY KEY (imageNum)
);


CREATE TABLE urlInfo
(
	urlNum number(4) NOT NULL,
	urlType number(3) NOT NULL,
	urlAddr varchar2(1000) NOT NULL,
	movieNum number(4) NOT NULL,
	PRIMARY KEY (urlNum)
);


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


ALTER TABLE freeBoardComm
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum)
;


ALTER TABLE freeBoardImage
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum)
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
	add constrant pk_fav primary key(userId,movieNum)
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

/* 관리자 계정 만들기 */
INSERT INTO USERINFO VALUES('Master','immaster','관리자','99','99999',SYSDATE,1);


INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'드라마');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'판타지');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'SF');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'액션');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'멜로');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'범죄');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'역사');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'공포');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'전쟁');
INSERT INTO GENRE VALUES(genre_SEQ.NEXTVAL,'코미디');
commit;

insert into reviewImage values(reviewImage_SEQ.nextval,1,'test1.jpg','test1.jpg',1);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test2.jpg','test2.jpg',2);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test3.jpg','test3.jpg',3);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test4.jpg','test4.jpg',4);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test5.jpg','test5.jpg',5);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test6.jpg','test6.jpg',6);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test7.jpg','test7.jpg',7);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test8.jpg','test8.jpg',8);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test9.jpg','test9.jpg',9);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test10.jpg','tes120.jpg',10);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test11.jpg','test11.jpg',11);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test12.jpg','test12.jpg',12);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test13.jpg','test13.jpg',13);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test14.jpg','test14.jpg',14);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test15.jpg','test15.jpg',15);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test16.jpg','test16.jpg',16);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test17.jpg','test17.jpg',17);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test18.jpg','test18.jpg',18);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test19.jpg','test19.jpg',19);
insert into reviewImage values(reviewImage_SEQ.nextval,1,'test20.jpg','test20.jpg',20);

insert into movieGenre values(1,1);
insert into movieGenre values(2,2);
insert into movieGenre values(3,3);
insert into movieGenre values(4,4);
insert into movieGenre values(5,5);
insert into movieGenre values(6,6);
insert into movieGenre values(7,7);
insert into movieGenre values(8,8);
insert into movieGenre values(9,9);
insert into movieGenre values(10,10);
insert into movieGenre values(1,11);
insert into movieGenre values(2,12);
insert into movieGenre values(3,13);
insert into movieGenre values(4,14);
insert into movieGenre values(5,15);
insert into movieGenre values(6,16);
insert into movieGenre values(7,17);
insert into movieGenre values(8,18);
insert into movieGenre values(9,19);
insert into movieGenre values(10,20);

insert into movieinfo values(movieInfo_SEQ.nextval,'test1','test1',sysdate,120,'test1','test1','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test2','test2',sysdate,120,'test2','test2','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test3','test3',sysdate,120,'test3','test3','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test4','test4',sysdate,120,'test4','test4','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test5','test5',sysdate,120,'test5','test5','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test6','test6',sysdate,120,'test6','test6','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test7','test7',sysdate,120,'test7','test7','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test8','test8',sysdate,120,'test8','test8','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test9','test9',sysdate,120,'test9','test9','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test10','test10',sysdate,120,'test10','test10','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test11','test11',sysdate,120,'test11','test11','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test12','test12',sysdate,120,'test12','test12','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test13','test13',sysdate,120,'test13','test13','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test14','test14',sysdate,120,'test14','test14','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test15','test15',sysdate,120,'test15','test15','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test16','test16',sysdate,120,'test16','test16','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test17','test17',sysdate,120,'test17','test17','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test18','test18',sysdate,120,'test18','test18','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test19','test19',sysdate,120,'test19','test19','한국',15);
insert into movieinfo values(movieInfo_SEQ.nextval,'test20','test20',sysdate,120,'test20','test20','한국',15);