--이름 숫자 제한 때문에 일부 이름 잘라서 입력함
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'제커리 레비','Zachary_Levi.jpg','Zachary_Levi.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'애셔 앤젤','Asher_Angel.jpg','Asher_Angel.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'잭 딜런','Jack_Dylan.jpg','Jack_Dylan.jpg'); --본명: 잭 딜런 그레이저(Jack Dylan Grazer)
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'마크 스트롱','Mark_Strong.jpg','Mark_Strong.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'디몬 하운수','Djimon_Hounsou.jpg','Djimon_Hounsou.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'미첼 보스','Michelle_Borth.jpg','Michelle_Borth.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'메건 굿','Meagan_Good.jpg','Meagan_Good.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'그레이스 펄튼','Grace_Fulton.jpg','Grace_Fulton.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'데이비드','David.jpg','David.jpg');--본명: 데이비드 F. 샌드버그(David F. Sandberg)

INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,1,1,'샤잠',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,2,1,'빌리 뱃슨',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,3,2,'프레디 프리먼',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,4,2,'새디어스 박사',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,5,2,'마법사',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,6,2,'메리 샤잠',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,7,2,'다라 더들리',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,8,2,'브롬필드',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,9,11,'감독',22);


INSERT INTO MOVIEGENRE VALUES(4,22);
INSERT INTO MOVIEGENRE VALUES(2,22);
INSERT INTO MOVIEGENRE VALUES(3,22);

INSERT INTO REVIEWIMAGE VALUES(reviewImage_SEQ.NEXTVAL,1,'Shazam.jpg','Shazam.jpg',22);

CREATE SEQUENCE castInfo_SEQ;
CREATE SEQUENCE charInfo_SEQ;
CREATE SEQUENCE urlInfo_SEQ;