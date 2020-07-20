

-------------------------------------------------------------------------------------------------------------------------------
--������
-------------------------------------------------------------------------------------------------------------------------------


DROP TABLE CAFE_CUSTOMER;
--�����̺�
create table CAFE_CUSTOMER(                    
    customer_code number PRIMARY key, --���ڵ�  
    customer_name varchar2(30), --����
    customer_phone varchar2(50), --�� ��ȭ��ȣ
    customer_birth varchar2(30), -- �� �������
    customer_gender varchar2(10), --�� ����
    customer_pwd varchar2(30),  --�� ��й�ȣ
--    customer_phone varchar(30) PRIMARY key,    
--    customer_name varchar2(40),      
    customer_stamp number --������
);  
DESC CAFE_CUSTOMER;
select * FROM CAFE_CUSTOMER;


--insert into CAFE_CUSTOMER(customer_code, customer_name,customer_phone,customer_birth,customer_gender,customer_stamp,customer_pwd) values(1,'lee','010-1234-1234','','',0,'aa');


-------------------------------------------------------------------------------------------------------------------------------
--�λ����
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CAFE_JOB;
 --�������̺�
create table CAFE_JOB(     
    job_code number not null unique,           --�����ڵ�
    job_name varchar(20) primary key,          --�����̸�
    job_tpay varchar(20) ,                     --�ñ�
    job_mpay varchar(20)                       --����
    );
DESC CAFE_JOB;
select * FROM CAFE_JOB;

--INSERT INTO CAFE_JOB(job_code,job_name,job_tpay,job_mpay) VALUES (1,'','','');


DROP TABLE CAFE_EMPLOYEE;
--�������̺�
create table CAFE_EMPLOYEE(   
    employee_code number primary key,            --�����ڵ�
    employee_name varchar(20) not null unique,   --�����̸�
    employee_jumin varchar(20) not null ,        --�����ֹι�ȣ  
    employee_phone varchar(20) ,                 --�����ڵ�����ȣ
    employee_address varchar(50),                --�����ּ�
    employee_startdate date not null,            --�Ի糯¥
    employee_enddate date,                       --��糯¥
    employee_endyn varchar(1),                   --��翩��
    employee_bank varchar(20),                   --�����
    employee_bankaddress varchar(30),            --���¹�ȣ
    employee_jobname varchar(20) not null REFERENCES CAFE_JOB(job_name)   --�����̸�
    );
    
DESC CAFE_EMPLOYEE;
select * FROM CAFE_EMPLOYEE;    

DROP TABLE cafe_emptna;
--���� ���̺�
create table cafe_emptna        
(   emptna_code number primary key,                                       --�����ڵ�            
    emptna_empcode number REFERENCES CAFE_EMPLOYEE (employee_code),       --�����ڵ�
    emptna_year number(4) not null,                                       --�ٹ��ѳ�
    emptna_month number(2) not null,                                      --�ٹ��ѿ�
    emptna_day number(2) not null,                                        --�ٹ�����
    emptna_starttime varchar(10),                                         --��ٽð�
    emptna_endtime varchar(10),                                           --��ٽð�
    emptna_daytotaltime varchar(10),                                      --�Ϸ� �� ���ѽð�
    emptna_monthtotaltime varchar(10)                                     --�Ѵ޵��� ���ѽð�
    );

DESC cafe_emptna;
select * FROM cafe_emptna;
    



-------------------------------------------------------------------------------------------------------------------------------
--������
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE Cafe_account;
--�ŷ�ó ���̺�
create table Cafe_account (
account_number number PRIMARY key, --�ŷ�ó �ڵ�(=����ڹ�ȣ)
account_name VARCHAR2(30),  -- �ŷ�ó ��
account_ceoname VARCHAR2(30),  -- �ŷ�ó ����ڸ�(�̸�)
account_address VARCHAR2(50), -- �ּ�
account_email VARCHAR2(100) -- email
);

DESC Cafe_account;
select * FROM Cafe_account;


DROP TABLE Cafe_stock;
--����� ���̺�
CREATE table Cafe_stock (
stock_code NUMBER PRIMARY KEY, --����� �ڵ�
stock_productname VARCHAR2(30), --ǰ��(�������� ex)����ǰ...)
stock_detailname VARCHAR2(50), --�󼼸�
stock_standard VARCHAR2(30), --�԰�
stock_price VARCHAR2(50), --�ݾ�
stock_image VARCHAR2(50), -- �̹���
account_number number,  --�ŷ�ó �ڵ�
CONSTRAINT account_number FOREIGN KEY(account_number) REFERENCES Cafe_account(account_number)
);    

DESC Cafe_stock;
select * FROM Cafe_stock;


DROP TABLE CAFE_PRODUCTORDER;
--���� ���̺�
CREATE TABLE CAFE_PRODUCTORDER
(
productOrder_code number primary key,--�ڵ�
productOrder_date date,--��¥
prodectOrder_total number--�ѱݾ�
);
DESC CAFE_PRODUCTORDER;
select * FROM CAFE_PRODUCTORDER;


DROP TABLE CAFE_PRODUCTORDERLIST;
--���� �󼼳��� ���̺�
CREATE TABLE CAFE_PRODUCTORDERLIST 
(
 productOrderList_code number primary key,--�ڵ�
 productOrderList_count number,--����
 productOrder_code number, --�������̺� �ڵ�(fk)
 stock_code number,--������ǰ���̺� �ڵ�(fk)
 
 CONSTRAINT productOrder_code FOREIGN KEY(productOrder_code) REFERENCES CAFE_PRODUCTORDER(productOrder_code),
 CONSTRAINT stock_code FOREIGN KEY(stock_code) REFERENCES Cafe_stock(stock_code)
 
);
DESC CAFE_PRODUCTORDERLIST;
select * FROM CAFE_PRODUCTORDERLIST;



-------------------------------------------------------------------------------------------------------------------------------
--����/��ǰ����
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CAFE_PRODUCT_CATEGORY;
--��ǰ ī�װ� ���̺�
CREATE TABLE CAFE_PRODUCT_CATEGORY(
    PRODUCT_CATEGORY_CODE  NUMBER PRIMARY KEY, --��ǰī�װ� �ڵ�
    PRODUCT_CATEGORY_NAME VARCHAR2(50) NOT NULL --��ǰī�װ���
);
DESC CAFE_PRODUCT_CATEGORY;
select * FROM CAFE_PRODUCT_CATEGORY;

--��ǰ ī�װ� ���̺� ������ �Է�
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(1,'coffe');
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(2,'non-coffe');
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(3,'juice');
 
 
 DROP TABLE CAFE_PRODUCT_ADD;
 -- ���� �߰� ���� : EX)���߰� �����߰�
 create table CAFE_PRODUCT_ADD(
    PRODUCT_ADD_CODE NUMBER PRIMARY KEY,
    PRODUCT_ADD_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_ADD_PRICE NUMBER
 );
DESC CAFE_PRODUCT_ADD;
select * FROM CAFE_PRODUCT_ADD;

--���� �߰� ���� ���̺� ������ �Է�
--delete from CAFE_PRODUCT_ADD;
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(1,'���߰�',500);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(2,'�÷��߰�',500);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(3,'�����߰�',700);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(4,'�����߰�',700);
 
 

DROP TABLE CAFE_PRODUCT;
--��ǰ ���̺�
CREATE TABLE CAFE_PRODUCT(
    CAFE_PRODUCT_CODE NUMBER PRIMARY KEY, --��ǰ �ڵ�
    CAFE_PRODUCT_NAME VARCHAR2(50) NOT NULL, --��ǰ��
    CAFE_PRODUCT_PRICE NUMBER, --����
    CAFE_PRODUCT_IMG VARCHAR2(100), --�̹���
    PRODUCT_CATEGORY_CODE NUMBER, --ī�װ��ڵ�
    
    CONSTRAINT PRODUCT_CATEGORY_CODE FOREIGN KEY(PRODUCT_CATEGORY_CODE) REFERENCES CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE) 
);
DESC CAFE_PRODUCT;
select * FROM CAFE_PRODUCT;
delete from CAFE_PRODUCT;




DROP TABLE CAFE_CART;
--��ٱ���
CREATE TABLE CAFE_CART(
     cart_code number primary key,--��ٱ��� �ڵ�
     customer_code number, --���ڵ�
     cafe_product_code number, --��ǰ�ڵ�
     cart_num number, --��ٱ��Ͽ����� ��ǰ����

    CONSTRAINT customer_code_cart FOREIGN KEY(customer_code) REFERENCES CAFE_CUSTOMER(customer_code),
    CONSTRAINT cafe_product_code_cart FOREIGN KEY(cafe_product_code) REFERENCES CAFE_PRODUCT(cafe_product_code)
);
DESC CAFE_CART;
select * FROM CAFE_CART order by cart_code;
update CAFE_CART set cart_num=cart_num+1 where cart_code=1;
update CAFE_CART set cart_num=1 where cart_code=1;

delete from CAFE_CART;

--insert INTO cafe_cart VALUES(3,1,3,1);


DROP TABLE CAFE_CART_ADD;
--��ٱ����� �ɼǳ��� ���̺�
CREATE TABLE CAFE_CART_ADD(
    cart_code number,--��ٱ��� �ڵ�
    PRODUCT_ADD_CODE number, --�ɼ��ڵ�(fk)
    
    CONSTRAINT cart_code_cart_Add FOREIGN KEY(cart_code) REFERENCES CAFE_CART(cart_code),
    CONSTRAINT PRODUCT_ADD_CODE_cart_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);
DESC CAFE_CART_ADD ;
select * FROM CAFE_CART_ADD order by cart_code,PRODUCT_ADD_CODE;
delete from CAFE_CART_ADD;
delete from CAFE_CART_ADD where cart_code=1;

--insert into CAFE_CUSTOMER(customer_code, customer_name,customer_phone,customer_birth,customer_gender,customer_stamp) values(1,'lee','010-1234-1234','','',0);
 
 
 

 
 
 
 
 
 
----------------------------------------web  �ֹ�
  
 
DROP TABLE CAFE_ORDER_WEB;
--�ֹ� ���̺� -  -web
CREATE TABLE CAFE_ORDER_WEB
(
 order_web_code number PRIMARY KEY, --�ֹ� �ڵ�
 order_web_total number, --�� �ݾ�
 order_web_count number,--�Ǽ�
 order_web_date date,--�ֹ� ����
 customer_code number, --���ڵ�(fk)
 
CONSTRAINT customer_code_web FOREIGN KEY(customer_code) REFERENCES CAFE_CUSTOMER(customer_code)
 
);
DESC CAFE_ORDER_WEB;
select * FROM CAFE_ORDER_WEB;
delete from CAFE_ORDER_WEB;



DROP TABLE CAFE_ORDERList_web;
--�ֹ� ���� ���̺�      -web
CREATE TABLE CAFE_ORDERList_web
(
orderList_web_code number primary key,--�ֹ� ���� �ڵ�
cafe_product_code number, --��ǰ�ڵ�
orderList_web_count number,--����
order_web_code number,--�ֹ��ڵ�(fk)

CONSTRAINT order_web_code FOREIGN KEY(order_web_code) REFERENCES CAFE_ORDER_WEB(order_web_code),
CONSTRAINT cafe_product_code_order_web FOREIGN KEY(cafe_product_code) REFERENCES CAFE_PRODUCT(cafe_product_code)
);
 DESC CAFE_ORDERList_web;
select * FROM CAFE_ORDERList_web;
delete from CAFE_ORDERList_web;


 DROP TABLE CAFE_ORDERLIST_ADD_web;
--�ֹ� ���� ���̺� �� �ɼǳ��� ���̺�
CREATE TABLE CAFE_ORDERLIST_ADD_web(
    orderList_web_code number, --�ֹ� ���� �ڵ�
    PRODUCT_ADD_CODE number, --�ɼ��ڵ�(fk)
    
    CONSTRAINT orderList_web_code_add FOREIGN KEY(orderList_web_code) REFERENCES CAFE_ORDERList_web(orderList_web_code),
    CONSTRAINT PRODUCT_ADD_CODE_order_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);
DESC CAFE_ORDERLIST_ADD_web;
select * FROM CAFE_ORDERLIST_ADD_web;
delete from CAFE_ORDERLIST_ADD_web;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ----------------------------------------pos  �ֹ�
 
 
 
DROP TABLE CAFE_ORDER;
--�ֹ� ���̺�
CREATE TABLE CAFE_ORDER
(
 order_code number PRIMARY KEY, --�ֹ� �ڵ�
 order_tatal number, --�� �ݾ�
 order_count number,--�Ǽ�
 order_accountType varchar2(30),--��������
 order_date date,--�ֹ� ����
 customer_code number, --���ڵ�(fk)
 
CONSTRAINT customer_code FOREIGN KEY(customer_code) REFERENCES CAFE_CUSTOMER(customer_code)
 
);
DESC CAFE_ORDER;
select * FROM CAFE_ORDER;


DROP TABLE CAFE_ORDERList;
--�ֹ� ���� ���̺�
CREATE TABLE CAFE_ORDERList
(
orderList_code number primary key,--�󼼳��� �ڵ�
orderList_pCount number,--�θ�
orderList_count number,--����
order_code number,--�ֹ��ڵ�(fk)

CONSTRAINT order_code FOREIGN KEY(order_code) REFERENCES CAFE_ORDER(order_code)
);
 DESC CAFE_ORDERList;
select * FROM CAFE_ORDERList;

 


-------------------------------------------------------------------------------------------------------------------------------
--POS
-------------------------------------------------------------------------------------------------------------------------------
DROP TABLE CAFE_reserveFund;
--�غ�� ���̺�
CREATE TABLE CAFE_reserveFund
(
 reserveFund_code number PRIMARY KEY,    --�ڵ�
 reserveFund_startTime date, --���۽ð�
 reserveFund_endTime date,   --����ð�
 reserveFund_total number    --���� �غ��
 );
DESC CAFE_reserveFund;
select * FROM CAFE_reserveFund;


DROP TABLE CAFE_ACCOUNTS;
--�����������̺�
CREATE TABLE CAFE_ACCOUNTS
(
    accounts_code number PRIMARY KEY,    --�����ڵ�
    accounts_deadline timestamp,              --����ó�� �ð�
    accounts_deadlineDate date,           --����ó�� ����
    accounts_supply number,              --���ް���
    accounts_tax number,                 --�ΰ�����
    accounts_tatal number,               --�հ� �ݾ�
    accounts_deposit number,             --���� �Ա�
    accounts_payment number,             --���� ���
    accounts_card number,                   --ī��
    accounts_cash number,                --����
    accounts_saleCount number,           --�ֹ� �Ǽ�
    accounts_salesRevenue number,         --�����
    reserveFund_code number,             --�غ��
    
    CONSTRAINT reserveFund_code FOREIGN KEY(reserveFund_code) REFERENCES CAFE_reserveFund(reserveFund_code)
);
DESC CAFE_ACCOUNTS;
select * FROM CAFE_ACCOUNTS;






create table ex1(
    code1 number,
    code2 number
);

insert into ex1 VALUES(1,3);
insert into ex1 VALUES(1,4);

delete from ex1;
select * from ex1;

select code2 from ex1 where code1=1;
select count(code2) from ex1 where code1=1;

rollback;


 
 
 
 
 
 
 
 
 commit;
 
 
