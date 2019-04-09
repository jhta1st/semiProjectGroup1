drop table freeboardcomm;
CREATE TABLE freeBoardComm
(
	freeBoardCommNum number(4) NOT NULL,
	freeBoardCommContent varchar2(1000),
	freeBoardCommWdate date,
	freeBoardNum number(4) NOT NULL,
	UserId varchar2(20) NOT NULL,
	PRIMARY KEY (freeBoardCommNum)
);
ALTER TABLE freeBoardComm
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade    
;

drop table freeboardimage;
CREATE TABLE freeBoardImage
(
	freeBoardImgNum number(4) NOT NULL,
	freeBoardOrgImgName varchar2(20),
	freeBoardSavImgName varchar2(20),
	freeBoardNum number(4) NOT NULL,
	PRIMARY KEY (freeBoardImgNum)
);
ALTER TABLE freeBoardImage
	ADD FOREIGN KEY (freeBoardNum)
	REFERENCES freeBoard (freeBoardNum) on delete cascade
;