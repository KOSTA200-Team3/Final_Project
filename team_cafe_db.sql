----------------------------------------------------------------------------------------------------------------------------
--                                                      drop
----------------------------------------------------------------------------------------------------------------------------
--pos 기타
DROP TABLE CAFE_POSPASSWORD;
DROP TABLE CAFE_ACCOUNTS;
DROP TABLE CAFE_reserveFund;

--pos 주문
DROP TABLE CAFE_ORDERLIST_ADD;
DROP TABLE CAFE_ORDERList;
DROP TABLE CAFE_ORDER;

--web주문
DROP TABLE CAFE_ORDERLIST_ADD_web;
DROP TABLE CAFE_ORDERList_web;
DROP TABLE CAFE_ORDER_WEB;
DROP TABLE CAFE_CART_ADD;
DROP TABLE CAFE_CART;

--판매상품
DROP TABLE CAFE_PRODUCT;
DROP TABLE CAFE_PRODUCT_ADD;
DROP TABLE CAFE_PRODUCT_CATEGORY;

--재고
drop table CAFE_PRODUCTORDERLIST;
drop table CAFE_PRODUCTORDER;
drop table Cafe_order_cart;
drop table Cafe_stock;
drop table Cafe_account;

--인사
DROP TABLE cafe_salary;
DROP TABLE cafe_emptna;
DROP TABLE CAFE_EMPLOYEE;
DROP TABLE CAFE_JOB;

--고객
DROP TABLE CAFE_CUSTOMER;


----------------------------------------------------------------------------------------------------------------------------
--                                                      create
----------------------------------------------------------------------------------------------------------------------------
--고객
create table CAFE_CUSTOMER(                    
    customer_code number UNIQUE, --고객코드  
    customer_name varchar2(30), --고객명
    customer_phone varchar2(50) PRIMARY key, --고객 전화번호
    customer_birth varchar2(30), -- 고객 생년월일
    customer_gender varchar2(10), --고객 성별
    customer_pwd varchar2(30),  --고객 비밀번호
--    customer_phone varchar(30) PRIMARY key,    
--    customer_name varchar2(40),      
    customer_stamp number --스탬프
);


--인사
 --직급테이블
create table CAFE_JOB(      
    job_code number not null unique,   --직급코드       
    job_name varchar(20) primary key,         --직급명
    job_tpay number(20),                       --시급
    job_mpay number(20)                         --월급
    );

--직원테이블
create table CAFE_EMPLOYEE(  
    employee_code number primary key,          --직원코드
    employee_name varchar(20) not null unique,   --직원 이름
    employee_jumin varchar(20) not null ,          --직원 주민번호
    employee_phone varchar(20) ,                --핸드폰번호
    employee_address varchar(50),               --주소
    employee_startdate date not null,            --입사날짜
    employee_enddate date,                       --퇴사날짜
    employee_endyn varchar(1),                   --퇴사 여부(y:퇴사, n:재직중) 
    employee_bank varchar(20),                   --은행
    employee_bankaddress varchar(30),            --계좌번호
    employee_jobname varchar(20) not null REFERENCES CAFE_JOB(job_name)   --직급명
    );

--근태 테이블
create table cafe_emptna(   
        emptna_code number primary key,                                      --직급코드            
        emptna_empcode number REFERENCES CAFE_EMPLOYEE (employee_code),     --직원코드
        emptna_year number not null,                                          --년
        emptna_month number not null,                                       --월
        emptna_day number not null,                                         --일
        emptna_starttime date not null,                                        --출근시간      
        emptna_endtime date,                                                --퇴근시간
        emptna_daytotaltime number                                           --하루 근무시간                              
    );

--급여 테이블    
create table cafe_salary(
    salary_code number not null primary key,                                    --급여코드
    salary_empcode number not null REFERENCES CAFE_EMPLOYEE (employee_code),    --직원코드
    salary_year number not null,                                                --년
    salary_month number not null,                                              --월
    salary_time number not null,                                              --총 근무 시간
    salary_tpay number not null,                                              --시급
    salary_mpay number not null,                                              --월급
    salary_totalpay number not null,                                           --총급여
    salary_date number not null                                                 --급여지급일
    );


--재고
--거래처 테이블
create table Cafe_account (
account_number number(30) PRIMARY key, --거래처 코드
account_name VARCHAR2(30),  -- 거래처 명
account_ceoname VARCHAR2(30),  -- 거래처 사업자명
account_address VARCHAR2(50), -- 주소
account_email VARCHAR2(100) -- email
);



--원재료 테이블
CREATE table Cafe_stock (
stock_code NUMBER PRIMARY KEY, --원재료 코드
stock_productname VARCHAR2(30), --품명
stock_detailname VARCHAR2(50), --상세명
stock_standard VARCHAR2(30), --규격
stock_price VARCHAR2(50), --금액
stock_image VARCHAR2(100), -- 이미지
account_number NUMBER(30)  --거래처 코드
);
alter table Cafe_stock add CONSTRAINT account_number FOREIGN KEY (account_number) 
REFERENCES Cafe_account(account_number) on delete set null;

-- 발주내용 담기용 테이블
create table Cafe_order_cart( 
cart_number number, -- 담은번호
cart_stock_productname VARCHAR2(30), -- 담은 품명
cart_stock_detailname VARCHAR2(50), -- 담은 상세명
cart_stock_price number, -- 담은 발부품의 금액
cart_stock_quantity NUMBER, -- 담은 수량
stock_code number,
PRODUCTORDER_CODE number,
ACCOUNT_NUMBER number
);

--발주 테이블
CREATE TABLE CAFE_PRODUCTORDER
(
productOrder_code number primary key,--코드
productOrder_date date,--날짜
prodectOrder_total number--총금액
);

--발주 상세내역 테이블
CREATE TABLE CAFE_PRODUCTORDERLIST 
(
 productOrderList_code number ,--코드
 productOrderList_count number,--수량
 productOrder_code number, --발주테이블 코드(fk)
 stock_code number,--원재료상품테이블 코드(fk)
 
 CONSTRAINT productOrder_code FOREIGN KEY(productOrder_code) REFERENCES CAFE_PRODUCTORDER(productOrder_code) on delete cascade,
 CONSTRAINT stock_code FOREIGN KEY(stock_code) REFERENCES Cafe_stock(stock_code) on delete set null
);


--판매상품
--상품 카테고리 테이블
CREATE TABLE CAFE_PRODUCT_CATEGORY(
    PRODUCT_CATEGORY_CODE  NUMBER PRIMARY KEY, --상품카테고리 코드
    PRODUCT_CATEGORY_NAME VARCHAR2(50) NOT NULL --상품카테고리명
);
 -- 음료 추가 사항 : EX)샷추가 휘핑추가
 create table CAFE_PRODUCT_ADD(
    PRODUCT_ADD_CODE NUMBER PRIMARY KEY,
    PRODUCT_ADD_NAME VARCHAR2(50) NOT NULL,
    PRODUCT_ADD_PRICE NUMBER
 );
--상품 테이블
CREATE TABLE CAFE_PRODUCT(
    CAFE_PRODUCT_CODE NUMBER PRIMARY KEY, --상품 코드
    CAFE_PRODUCT_NAME VARCHAR2(50) NOT NULL, --상품명
    CAFE_PRODUCT_PRICE NUMBER, --가격
    CAFE_PRODUCT_IMG VARCHAR2(100), --이미지
    PRODUCT_CATEGORY_CODE NUMBER, --카테고리코드
    
    CONSTRAINT PRODUCT_CATEGORY_CODE FOREIGN KEY(PRODUCT_CATEGORY_CODE) REFERENCES CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE) 
);


--web주문
--장바구니
CREATE TABLE CAFE_CART(
     cart_code number primary key,--장바구니 코드
     customer_code number, --고객코드
     cafe_product_code number, --상품코드
     cart_num number, --장바구니에담은 상품수량

    CONSTRAINT customer_code_cart FOREIGN KEY(customer_code) REFERENCES CAFE_CUSTOMER(customer_code),
    CONSTRAINT cafe_product_code_cart FOREIGN KEY(cafe_product_code) REFERENCES CAFE_PRODUCT(cafe_product_code)
);

--장바구니의 옵션내역 테이블
CREATE TABLE CAFE_CART_ADD(
    cart_code number,--장바구니 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT cart_code_cart_Add FOREIGN KEY(cart_code) REFERENCES CAFE_CART(cart_code),
    CONSTRAINT PRODUCT_ADD_CODE_cart_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);

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

--주문 내역 테이블 의 옵션내역 테이블
CREATE TABLE CAFE_ORDERLIST_ADD_web(
    orderList_web_code number, --주문 내역 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT orderList_web_code_add_web FOREIGN KEY(orderList_web_code) REFERENCES CAFE_ORDERList_web(orderList_web_code),
    CONSTRAINT PRODUCT_ADD_CODE_order_add_web FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);


--pos 주문
--주문 테이블
CREATE TABLE CAFE_ORDER
(
 order_code number PRIMARY KEY, --주문 코드
 order_total number, --총 금액
 order_count number,--건수
 order_accountType varchar2(30),--결제수단
 order_date date,--주문 일자
 customer_phone varchar2(50), --고객전화번호(fk)
 
CONSTRAINT customer_phone FOREIGN KEY(customer_phone) REFERENCES CAFE_CUSTOMER(customer_phone)
 
);

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

--주문 내역 테이블의 옵션내역 테이블
CREATE TABLE CAFE_ORDERLIST_ADD(
    orderList_code number, --주문 내역 코드
    PRODUCT_ADD_CODE number, --옵션코드(fk)
    
    CONSTRAINT orderList_code_add FOREIGN KEY(orderList_code) REFERENCES CAFE_ORDERList(orderList_code),
    CONSTRAINT PRODUCT_ADD_CODE_order_add FOREIGN KEY(PRODUCT_ADD_CODE) REFERENCES CAFE_Product_add(PRODUCT_ADD_CODE)
);



-- pos 비밀번호 테이블
CREATE TABLE CAFE_POSPASSWORD
(
 POSPASSWORD_PWD varchar2(30)  --POS 비밀번호
 );

--POS 준비금 테이블 
 CREATE TABLE CAFE_reserveFund
(
 reserveFund_code number PRIMARY KEY,    --코드
 reserveFund_startTime date, --시작시각
 reserveFund_endTime date,   --종료시각
 reserveFund_total number    --영업 준비금
 );
 
 --일일정산테이블
CREATE TABLE CAFE_ACCOUNTS
(
    accounts_code number PRIMARY KEY,    --정산코드
    accounts_total number,               -- 총 매출액
    accounts_card number,                   --카드 매출액
    accounts_cash number,                --현금 매출액
    accounts_saleCount number,           -- 총 주문 건수
    accounts_startSell date,            -- 영업 시작 시간
    accounts_endSell date,              -- 영업 마감 시간
    reserveFund_code number,             -- POS 시작일 코드
    
    CONSTRAINT reserveFund_code FOREIGN KEY(reserveFund_code) REFERENCES CAFE_reserveFund(reserveFund_code)
);

    
----------------------------------------------------------------------------------------------------------------------------
--                                                      insert
----------------------------------------------------------------------------------------------------------------------------
insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(1,'샷추가',500);
insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(2,'시럽추가',500);
insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(3,'버블추가',700);
insert into CAFE_PRODUCT_ADD(PRODUCT_ADD_CODE, PRODUCT_ADD_NAME,PRODUCT_ADD_PRICE) values(4,'휘핑추가',700);

insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(1,'coffe');
insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(2,'non-coffe');
insert into CAFE_PRODUCT_CATEGORY(PRODUCT_CATEGORY_CODE, PRODUCT_CATEGORY_NAME) values(3,'juice');
 
INSERT INTO CAFE_JOB VALUES (1,'매니저',0,2000000);
INSERT INTO CAFE_JOB VALUES (2,'아르바이트',8590,0);
INSERT INTO CAFE_JOB VALUES (3,'아르바이트pro',9000,0);

INSERT INTO CAFE_POSPASSWORD VALUES ('PASSWORD');
 
commit;

