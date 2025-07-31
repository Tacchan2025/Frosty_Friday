use role sysadmin;
use warehouse compute_wh;
use database frosty_friday_db;
use schema public;

-- https://chatgpt.com/c/6889ee09-66d4-8329-b8bc-2977761dcb7e?model=o3-pro

--------------------------------------------------------------
-- week1
-- https://frostyfriday.org/blog/2022/07/14/week-1/


create or replace stage esffw1
    url = 's3://frostyfridaychallenges/challenge_1/'
;


list @esffw1;

select $1 from @esffw1/;

create or replace table ffw1_tbl (c1 varchar);

copy into ffw1_tbl
    from @esffw1
    ;

select * from ffw1_tbl;