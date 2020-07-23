

-------------------------------------------------------------------------------------------------------------------------------
--고객관리
-------------------------------------------------------------------------------------------------------------------------------


DROP TABLE CAFE_CUSTOMER;
--고객테이블
create table CAFE_CUSTOMER(                    
    customer_code number, --고객코드  
    customer_name varchar2(30), --고객명
    customer_phone varchar2(50) PRIMARY key, --고객 전화번호
    customer_birth varchar2(30), -- 고객 생년월일
    customer_gender varchar2(10), --고객 성별
    customer_pwd varchar2(30),  --고객 비밀번호     
    customer_stamp number --스탬프
);  
DESC CAFE_CUSTOMER;
select * FROM CAFE_CUSTOMER;


--insert into CAFE_CUSTOMER(customer_code, customer_name,customer_phone,customer_birth,customer_gender,customer_stamp,customer_pwd) values(1,'lee','010-1234-1234','','',0,'aa');


-------------------------------------------------------------------------------------------------------------------------------
--인사관리
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CAFE_JOB;
 --직급테이블
create table CAFE_JOB(     
    job_code number not null unique,           --직급코드
    job_name varchar(20) primary key,          --직급이름
    job_tpay varchar(20) ,                     --시급
    job_mpay varchar(20)                       --월급
    );
DESC CAFE_JOB;
select * FROM CAFE_JOB;

--INSERT INTO CAFE_JOB(job_code,job_name,job_tpay,job_mpay) VALUES (1,'','','');


DROP TABLE CAFE_EMPLOYEE;
--직원테이블
create table CAFE_EMPLOYEE(   
    employee_code number primary key,            --직원코드
    employee_name varchar(20) not null unique,   --직원이름
    employee_jumin varchar(20) not null ,        --직원주민번호  
    employee_phone varchar(20) ,                 --직원핸드폰번호
    employee_address varchar(50),                --직원주소
    employee_startdate date not null,            --입사날짜
    employee_enddate date,                       --퇴사날짜
    employee_endyn varchar(1),                   --퇴사여부
    employee_bank varchar(20),                   --은행명
    employee_bankaddress varchar(30),            --계좌번호
    employee_jobname varchar(20) not null REFERENCES CAFE_JOB(job_name)   --직급이름
    );
    
DESC CAFE_EMPLOYEE;
select * FROM CAFE_EMPLOYEE;    

DROP TABLE cafe_emptna;
--근태 테이블
create table cafe_emptna        
(   emptna_code number primary key,                                       --근태코드            
    emptna_empcode number REFERENCES CAFE_EMPLOYEE (employee_code),       --직원코드
    emptna_year number(4) not null,                                       --근무한년
    emptna_month number(2) not null,                                      --근무한월
    emptna_day number(2) not null,                                        --근무한일
    emptna_starttime varchar(10),                                         --출근시간
    emptna_endtime varchar(10),                                           --퇴근시간
    emptna_daytotaltime varchar(10),                                      --하루 총 일한시간
    emptna_monthtotaltime varchar(10)                                     --한달동안 일한시간
    );

DESC cafe_emptna;
select * FROM cafe_emptna;
    



-------------------------------------------------------------------------------------------------------------------------------
--재고관리
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE Cafe_account;
--거래처 테이블
create table Cafe_account (
account_number number PRIMARY key, --거래처 코드(=사업자번호)
account_name VARCHAR2(30),  -- 거래처 명
account_ceoname VARCHAR2(30),  -- 거래처 사업자명(이름)
account_address VARCHAR2(50), -- 주소
account_email VARCHAR2(100) -- email
);

DESC Cafe_account;
select * FROM Cafe_account;


DROP TABLE Cafe_stock;
--원재료 테이블
CREATE table Cafe_stock (
stock_code NUMBER PRIMARY KEY, --원재료 코드
stock_productname VARCHAR2(30), --품명(폼목종류 ex)유제품...)
stock_detailname VARCHAR2(50), --상세명
stock_standard VARCHAR2(30), --규격
stock_price VARCHAR2(50), --금액
stock_image VARCHAR2(50), -- 이미지
account_number number,  --거래처 코드
CONSTRAINT account_number FOREIGN KEY(account_number) REFERENCES Cafe_account(account_number)
);    

DESC Cafe_stock;
select * FROM Cafe_stock;


DROP TABLE CAFE_PRODUCTORDER;
--발주 테이블
CREATE TABLE CAFE_PRODUCTORDER
(
productOrder_code number primary key,--코드
productOrder_date date,--날짜
prodectOrder_total number--총금액
);
DESC CAFE_PRODUCTORDER;
select * FROM CAFE_PRODUCTORDER;


DROP TABLE CAFE_PRODUCTORDERLIST;
--발주 상세내역 테이블
CREATE TABLE CAFE_PRODUCTORDERLIST 
(
 productOrderList_code number primary key,--코드
 productOrderList_count number,--수량
 productOrder_code number, --발주테이블 코드(fk)
 stock_code number,--원재료상품테이블 코드(fk)
 
 CONSTRAINT productOrder_code FOREIGN KEY(productOrder_code) REFERENCES CAFE_PRODUCTORDER(productOrder_code),
 CONSTRAINT stock_code FOREIGN KEY(stock_code) REFERENCES Cafe_stock(stock_code)
 
);
DESC CAFE_PRODUCTORDERLIST;
select * FROM CAFE_PRODUCTORDERLIST;



-------------------------------------------------------------------------------------------------------------------------------
--매출/상품관리
-------------------------------------------------------------------------------------------------------------------------------

DROP TABLE CAFE_PRODUCT_CATEGORY;
--상품 카테고리 테이블
CREATE TABLE CAFE_PRODUCT_CATEGORY(
    PRODUCT_CATEGORY_CODE  NUMBER PRIMARY KEY, --상품카테고리 코드
    PRODUCT_CATEGORY_NAME VARCHAR2(50) NOT NULL --상품카테고리명
);
DESC CAFE_PRODUCT_CATEGORY;
select * FROM CAFE_PRODUCT_CATEGORY;

--상품 카테고리 테이블 데이터 입력
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(1,'coffe');
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(2,'non-coffe');
--insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(3,'juice');
 
 
 DROP TABLE CAFE_PRODUCT_ADD;
 -- 음료 추가 사항 : EX)샷추가 휘핑추가
 create table CAFE_PRODUCT_ADD(
    PRODUCT_ADD_CODE NUMBER PRIMARY KEY,
    PRODUCT_ADD_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_ADD_PRICE NUMBER
 );
DESC CAFE_PRODUCT_ADD;
select * FROM CAFE_PRODUCT_ADD;

--음료 추가 사항 테이블 데이터 입력
--delete from CAFE_PRODUCT_ADD;
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(1,'샷추가',500);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(2,'시럽추가',500);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(3,'버블추가',700);
--insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(4,'휘핑추가',700);
 
 

DROP TABLE CAFE_PRODUCT;
--상품 테이블
CREATE TABLE CAFE_PRODUCT(
    CAFE_PRODUCT_CODE NUMBER PRIMARY KEY, --상품 코드
    CAFE_PRODUCT_NAME VARCHAR2(50) NOT NULL, --상품명
    CAFE_PRODUCT_PRICE NUMBER, --가격
    CAFE_PRODUCT_IMG VARCHAR2(100), --이미지
    PRODUCT_CATEGORY_CODE NUMBER, --카테고리코드
    
    CONSTRAINT PRODUCT_CATEGORY_CODE FOREIGN KEY(PRODUCT_CATEGORY_CODE) REFERENCES CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE) 
);
DESC CAFE_PRODUCT;
select * FROM CAFE_PRODUCT;
delete from CAFE_PRODUCT;




DROP TABLE CAFE_CART;
--장바구니
CREATE TABLE CAFE_CART(
     cart_code number primary key,--장바구니 코드
     customer_code number, --고객코드
     cafe_product_code number, --상품코드
     cart_num number, --장바구니에담은 상품수량

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
--장바구니의 옵션내역 테이블
CREATE TABLE CAFE_CART_ADD(
    cart_code number,--장바구니 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT cart_code_cart_Add FOREIGN KEY(cart_code) REFERENCES CAFE_CART(cart_code),
    CONSTRAINT PRODUCT_ADD_CODE_cart_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);
DESC CAFE_CART_ADD ;
select * FROM CAFE_CART_ADD order by cart_code,PRODUCT_ADD_CODE;
delete from CAFE_CART_ADD;
delete from CAFE_CART_ADD where cart_code=1;

--insert into CAFE_CUSTOMER(customer_code, customer_name,customer_phone,customer_birth,customer_gender,customer_stamp) values(1,'lee','010-1234-1234','','',0);
 
 
 

 
 
 
 
 
 
----------------------------------------web  주문
  
 
DROP TABLE CAFE_ORDER_WEB;
--주문 테이블 -  -web
CREATE TABLE CAFE_ORDER_WEB
(
 order_web_code number PRIMARY KEY, --주문 코드
 order_web_total number, --총 금액
 order_web_count number,--건수
 order_web_date date,--주문 일자
 customer_code number, --고객코드(fk)
 order_web_check number, --주문확인 (0:주문접수확인중 1:주문접수완료)
 
CONSTRAINT customer_code_web FOREIGN KEY(customer_code) REFERENCES CAFE_CUSTOMER(customer_code)
 
);
DESC CAFE_ORDER_WEB;
select * FROM CAFE_ORDER_WEB;
delete from CAFE_ORDER_WEB;



DROP TABLE CAFE_ORDERList_web;
--주문 내역 테이블      -web
CREATE TABLE CAFE_ORDERList_web
(
orderList_web_code number primary key,--주문 내역 코드
cafe_product_code number, --상품코드
orderList_web_count number,--수량
order_web_code number,--주문코드(fk)

CONSTRAINT order_web_code FOREIGN KEY(order_web_code) REFERENCES CAFE_ORDER_WEB(order_web_code),
CONSTRAINT cafe_product_code_order_web FOREIGN KEY(cafe_product_code) REFERENCES CAFE_PRODUCT(cafe_product_code)
);
 DESC CAFE_ORDERList_web;
select * FROM CAFE_ORDERList_web;
delete from CAFE_ORDERList_web;


 DROP TABLE CAFE_ORDERLIST_ADD_web;
--주문 내역 테이블 의 옵션내역 테이블
CREATE TABLE CAFE_ORDERLIST_ADD_web(
    orderList_web_code number, --주문 내역 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT orderList_web_code_add FOREIGN KEY(orderList_web_code) REFERENCES CAFE_ORDERList_web(orderList_web_code),
    CONSTRAINT PRODUCT_ADD_CODE_order_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);
DESC CAFE_ORDERLIST_ADD_web;
select * FROM CAFE_ORDERLIST_ADD_web;
delete from CAFE_ORDERLIST_ADD_web;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ----------------------------------------pos  주문
 
 
 
DROP TABLE CAFE_ORDER;
--주문 테이블
CREATE TABLE CAFE_ORDER
(
 order_code number PRIMARY KEY, --주문 코드
 order_total number, --총 금액
 order_count number,--건수
 order_accountType varchar2(30),--결제수단
 order_date date,--주문 일자
 customer_phone number, --고객전화번호(fk)
 
CONSTRAINT customer_phone FOREIGN KEY(customer_phone) REFERENCES CAFE_CUSTOMER(customer_phone)
 
);
DESC CAFE_ORDER;
select * FROM CAFE_ORDER;


DROP TABLE CAFE_ORDERList;
--주문 내역 테이블
CREATE TABLE CAFE_ORDERList
(
orderList_code number primary key,--상세내역 코드
cafe_product_code number,-- 상품코드
orderList_count number,--수량
order_code number,--주문코드(fk)

CONSTRAINT order_code FOREIGN KEY(order_code) REFERENCES CAFE_ORDER(order_code),
CONSTRAINT cafe_product_code_order FOREIGN KEY(cafe_product_code) REFERENCES CAFE_PRODUCT(cafe_product_code)
);
 DESC CAFE_ORDERList;
select * FROM CAFE_ORDERList;

 --주문 내역 테이블 의 옵션내역 테이블
CREATE TABLE CAFE_ORDERLIST_ADD(
    orderList_code number, --주문 내역 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT orderList_code_add FOREIGN KEY(orderList_code) REFERENCES CAFE_ORDERList(orderList_code),
    CONSTRAINT PRODUCT_ADD_CODE_order_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);


-------------------------------------------------------------------------------------------------------------------------------
--POS
-------------------------------------------------------------------------------------------------------------------------------
DROP TABLE CAFE_reserveFund;
--준비금 테이블
CREATE TABLE CAFE_reserveFund
(
 reserveFund_code number PRIMARY KEY,    --코드
 reserveFund_startTime date, --시작시각
 reserveFund_endTime date,   --종료시각
 reserveFund_total number    --영업 준비금
 );
DESC CAFE_reserveFund;
select * FROM CAFE_reserveFund;


DROP TABLE CAFE_ACCOUNTS;
--일일정산테이블
CREATE TABLE CAFE_ACCOUNTS
(
    accounts_code number PRIMARY KEY,    --정산코드
    accounts_deadline timestamp,              --마감처리 시간
    accounts_deadlineDate date,           --마감처리 일자
    accounts_supply number,              --공급가액
    accounts_tax number,                 --부가세액
    accounts_tatal number,               --합계 금액
    accounts_deposit number,             --시재 입금
    accounts_payment number,             --시재 출금
    accounts_card number,                   --카드
    accounts_cash number,                --현금
    accounts_saleCount number,           --주문 건수
    accounts_salesRevenue number,         --매출액
    reserveFund_code number,             --준비금
    
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
 
 
