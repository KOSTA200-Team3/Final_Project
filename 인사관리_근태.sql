
--�λ�
DROP TABLE cafe_salary;
DROP TABLE cafe_emptna;
DROP TABLE CAFE_EMPLOYEE;
DROP TABLE CAFE_JOB;


 --�������̺�
create table CAFE_JOB(      
    job_code number not null unique,          
    job_name varchar(20) primary key,          
    job_tpay number(20),                    
    job_mpay number(20)                      
    );

--�������̺�
create table CAFE_EMPLOYEE(  
    employee_code number primary key,          
    employee_name varchar(20) not null unique,   
    employee_jumin varchar(20) not null ,          
    employee_phone varchar(20) ,                
    employee_address varchar(50),               
    employee_startdate date not null,            
    employee_enddate date,                       
    employee_endyn varchar(1),                   
    employee_bank varchar(20),                   
    employee_bankaddress varchar(30),            
    employee_jobname varchar(20) not null REFERENCES CAFE_JOB(job_name)   
    );

--���� ���̺�
create table cafe_emptna(   
        emptna_code number primary key,                                                  
        emptna_empcode number REFERENCES CAFE_EMPLOYEE (employee_code),   
        emptna_year number not null,                                          
        emptna_month number not null,                                       
        emptna_day number not null,     
        emptna_starttime date not null,                                              
        emptna_endtime date,                                                
        emptna_daytotaltime number                                                                                 
    );


INSERT INTO CAFE_JOB VALUES (1,'�Ŵ���',0,2000000);
INSERT INTO CAFE_JOB VALUES (2,'�Ƹ�����Ʈ',8590,0);
INSERT INTO CAFE_JOB VALUES (3,'�Ƹ�����Ʈpro',9000,0);

