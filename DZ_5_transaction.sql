set autocommit = 0;
set transaction_isolation = serializable;
show variables like 'transaction_isolation';
begin;
select * from brand where id > 3;
insert into brand(model) values(concat('brand',current_time()));
select * from brand;
commit;