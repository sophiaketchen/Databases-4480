select tablespace_name, table_name from user_tables;
drop table orders cascade constraints;

create table orders(
    order_id varchar2(6) primary key,
    client_id varchar2(3),
    price decimal(10,2),
    quantity integer,
    status varchar2(50)
    --timestamp datetime
);

create table clients(
    client_id varchar2(3) primary key,
    last_name varchar2(16),
    first_name varchar2(16)
    --date_joined datetime
);

insert into orders values('100101', '111', 9.80, 10, 'Cancelled');
insert into orders values('100102', '111', 10.00, 10, 'Completed');
insert into orders values('100259', '148', 5.10, 35, 'Completed');
insert into orders values('100264', '148', 4.80, 40, 'Completed');
insert into orders values('100305', '300', 10.00, 15, 'Completed');
insert into orders values('100400', '178', 9.90, 15, 'Completed');
insert into orders values('100565', '265', 25.60, 5, 'Completed');

select * from orders; 

insert into clients values('111', 'Sam', 'Russel');
insert into clients values('148', 'Bob', 'Tierney');
insert into clients values('178', 'Stan', 'Glanton');

select * from clients;

alter table clients
add date_joined date;

update clients
set date_joined = '18-Mar-2026';

update clients
set date_joined = '18/Jun/26';

select * from clients;

select Lname, Fname, Address, Dname
from employee E, department D
where D.dnumber = E.dno
and D.dname = 'Research'; 

select * from employee; 
select * from department; 

select * from employee, department where department.dname = 'Research';
