
select * FROM CAFE_PRODUCT where CAFE_PRODUCT_CODE=1;

select * FROM CAFE_CART where cart_code= (select MAX(cart_code) FROM CAFE_CART);

update CAFE_CART set cart_num=cart_num+1 where cart_code=1;


 
select * from CAFE_CART a , CAFE_CART_ADD b where a.cart_code=b.cart_code and  customer_code=1 and cafe_product_code=3;

select * from CAFE_CART a , CAFE_CART_ADD b where a.cart_code=b.cart_code(+) and  customer_code=1 ;


select a.cart_code,a.customer_code,a.cafe_product_code,a.cart_num, nvl(b.PRODUCT_ADD_CODE,0) product_add_code from CAFE_CART a , CAFE_CART_ADD b where a.cart_code=b.cart_code(+) and  customer_code=1 and cafe_product_code=3 
minus
select a.cart_code,a.customer_code,a.cafe_product_code,a.cart_num, nvl(b.PRODUCT_ADD_CODE,0)   from CAFE_CART a , CAFE_CART_ADD b where a.cart_code=b.cart_code and  customer_code=1 and cafe_product_code=3;


 cart_code number primary key,--��ٱ��� �ڵ�
     customer_code number, --���ڵ�
     cafe_product_code number, --��ǰ�ڵ�
     cart_num number, --��ٱ��Ͽ����� ��ǰ����
cart_code number,--��ٱ��� �ڵ�
    PRODUCT_ADD_CODE number, --�ɼ��ڵ�(fk)

select a.cart_code,a.customer_code,a.cafe_product_code,a.cart_num, nvl(b.PRODUCT_ADD_CODE,0) product_add_code from CAFE_CART a , CAFE_CART_ADD b where a.cart_code=b.cart_code(+) and  customer_code=1 order by cart_code;


select sum(cart_num) from cafe_cart where customer_code=1;  --�ش���� �ֹ� �� �Ǽ�(�����ܼ�)

select a.cart_num , b.cafe_product_price , a.cart_num*b.cafe_product_price order_web_total from CAFE_CART a, CAFE_PRODUCT b where a.cafe_product_code=b.cafe_product_code and customer_code=1;      --�ش���� ��ǰ�� �ݾ�

select sum(order_web_total) from(
select a.cart_num , b.cafe_product_price , a.cart_num*b.cafe_product_price order_web_total from CAFE_CART a, CAFE_PRODUCT b where a.cafe_product_code=b.cafe_product_code and customer_code=1)
;   -- �ش���� �ֹ� �� �ݾ�

select * FROM CAFE_ORDER_WEB;
delete from CAFE_ORDER_WEB;

DESC CAFE_ORDER_WEB;
select * FROM CAFE_ORDER_WEB;
 order_web_code number PRIMARY KEY, --�ֹ� �ڵ�
 order_web_total number, --�� �ݾ�
 order_web_count number,--�Ǽ�
 order_web_date date,--�ֹ� ����
 customer_code number, --���ڵ�(fk
 
 
insert into CAFE_ORDER_WEB(order_web_code,order_web_total,order_web_count,order_web_date,customer_code)
select 
CAFE_ORDERList_web
(
orderList_web_code number primary key,--�ֹ� ���� �ڵ�
cafe_product_code number, --��ǰ�ڵ�
orderList_web_count number,--����
order_web_code number,--�ֹ��ڵ�(fk)

insert into CAFE_ORDERList_web(orderList_web_code)

 select * FROM CAFE_CART where customer_code=1 order by cart_code; 
 select max(order_web_code) from CAFE_ORDER_WEB ;
 
 select * FROM CAFE_ORDER_WEB where customer_code=1 order by order_web_code desc;
 
  
 select a.orderList_web_code,a.cafe_product_code,a.orderList_web_count,a.order_web_code,nvl(b.PRODUCT_ADD_CODE,0) product_add_code
 from CAFE_ORDERList_web a, CAFE_ORDERLIST_ADD_web b
 where a.orderList_web_code=b.orderlist_web_code(+) and a.order_web_code=1 order by a.orderList_web_code,b.product_add_code ;
 
 
 
 select count(*) FROM CAFE_ORDER_WEB where order_web_check=0 ;
 
 