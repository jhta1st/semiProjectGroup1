--�̸� ���� ���� ������ �Ϻ� �̸� �߶� �Է���
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'��Ŀ�� ����','Zachary_Levi.jpg','Zachary_Levi.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'�ּ� ����','Asher_Angel.jpg','Asher_Angel.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'�� ����','Jack_Dylan.jpg','Jack_Dylan.jpg'); --����: �� ���� �׷�����(Jack Dylan Grazer)
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'��ũ ��Ʈ��','Mark_Strong.jpg','Mark_Strong.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'��� �Ͽ��','Djimon_Hounsou.jpg','Djimon_Hounsou.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'��ÿ ����','Michelle_Borth.jpg','Michelle_Borth.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'�ް� ��','Meagan_Good.jpg','Meagan_Good.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'�׷��̽� ��ư','Grace_Fulton.jpg','Grace_Fulton.jpg');
INSERT INTO CHARINFO values(charInfo_SEQ.NEXTVAL,'���̺��','David.jpg','David.jpg');--����: ���̺�� F. �������(David F. Sandberg)

INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,1,1,'����',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,2,1,'���� �',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,3,2,'������ ������',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,4,2,'���� �ڻ�',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,5,2,'������',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,6,2,'�޸� ����',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,7,2,'�ٶ� ���鸮',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,8,2,'����ʵ�',22);
INSERT INTO CASTINFO VALUES(castInfo_SEQ.NEXTVAL,9,11,'����',22);

insert into movieinfo values(movieInfo_SEQ.nextval,'����',
'��� ������� �ɷ��� �ϳ��� �𿴴�!<BR>�ַθ��� ����, ���Ŭ������ ��, ��Ʋ���� ü��, ���콺�� �Ǵ�, ��ų������ ���, ��ť���� ���ǵ����<BR>�쿬�� ���� �Ŀ��� ��� �� �ҳ�. �ڽ��� �ɷ��� ���ݰ� �Ǵ��� ����ġ�� ��������η� �ٽ� �¾��!<BR><BR>�ֹ��� ���Ķ�, �����ᡯ!',
'2019 .04.03',132,'���ʺ귯����','���ʺ귯����','�̱�',12);

INSERT INTO MOVIEGENRE VALUES(4,22);
INSERT INTO MOVIEGENRE VALUES(2,22);
INSERT INTO MOVIEGENRE VALUES(3,22);

INSERT INTO REVIEWIMAGE VALUES(reviewImage_SEQ.NEXTVAL,1,'Shazam.jpg','Shazam.jpg',22);

CREATE SEQUENCE castInfo_SEQ;
CREATE SEQUENCE charInfo_SEQ;
CREATE SEQUENCE urlInfo_SEQ;