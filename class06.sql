drop table if exists auth cascade constraints; 

create table auth(
    USER_ID varchar2(8),
    PW1 varchar2(12),
    PW1Hash varchar2(15),
    PW2 varchar2(12),
    PW2Hash varchar2(15),
    PW3 varchar2(12),
    PW3Hash varchar2(15)
);

insert into auth (USER_ID, PW1) values ('Alan','Skipper99');
insert into auth (USER_ID,PW1) values ('Bob','Gillgan5$');
insert into auth (USER_ID,PW1) values ('Russel','Professor@@');
insert into auth (USER_ID,PW1) values ('Tina','Ginger$*');


select * from auth;

update auth
set PW1Hash = (ORA_HASH(PW1));

select * from auth;


--Task - Alan wants to change his password. Write SQL query(s) that will back up 
--his PW1 and PW!Hash to their respective fields for PW2
-- Add his new password to PW1 (Captain44) 


update auth
set PW2 = PW1,PW2Hash = PW1Hash
where USER_ID = 'Alan';

update auth
set PW1 = 'Captain44'
where USER_ID = 'Alan';

update auth
set PW1Hash = ORA_HASH(PW1) 
where USER_ID = 'Alan';

select * from auth;
