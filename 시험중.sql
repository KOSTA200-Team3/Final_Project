create table ��ٱ���(
    ��ٱ����ڵ�  number,
    �� VARCHAR2(20),
    ��ǰ VARCHAR2(20),
    ���� number
);

create table ��ٱ��Ͽɼǳ���(
    ��ٱ����ڵ�  number,
    �ɼ� VARCHAR2(20)
);

insert into "��ٱ���" VALUES(1,'ȫ�浿','�Ƹ޸�ī��',1);
insert into "��ٱ���" VALUES(2,'ȫ�浿','�Ƹ޸�ī��',1);
insert into "��ٱ��Ͽɼǳ���" VALUES(2,'���߰�');
insert into "��ٱ���" VALUES(3,'ȫ�浿','�Ƹ޸�ī��',1);
insert into "��ٱ��Ͽɼǳ���" VALUES(3,'���߰�');
insert into "��ٱ��Ͽɼǳ���" VALUES(3,'�����߰�');
insert into "��ٱ���" VALUES(4,'ȫ�浿','��',1);
insert into "��ٱ��Ͽɼǳ���" VALUES(4,'���߰�');
insert into "��ٱ��Ͽɼǳ���" VALUES(4,'�����߰�');

select * from "��ٱ���" , "��ٱ��Ͽɼǳ���" where "��ٱ���"."��ٱ����ڵ�"="��ٱ��Ͽɼǳ���"."��ٱ����ڵ�"(+) ORDER BY "��ٱ���"."��ٱ����ڵ�" ;


SELECT ��ٱ����ڵ� FROM "��ٱ���" where "��"='ȫ�浿' and "��ǰ"='�Ƹ޸�ī��';

rollback;

