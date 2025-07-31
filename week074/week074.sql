use role sysadmin;
use warehouse compute_wh;
use database frosty_friday_db;

Create schema week074;
use schema week074;


--------------------------------------------------------------
-- week074

create stage raw;

list @raw;

create or replace table raw_tbl (birthdate varchar);

copy into raw_tbl
    from @raw/birthdate
    file_format = (skip_header = 1)
    ;

select * from raw_tbl;

insert into raw_tbl (birthdate)
    values ('453921');

select
    birthdate,
    try_to_date(birthdate),
    --try_to_date(birthdate, 'DD/MM/YYYY'),
    iff(try_to_date(birthdate)=null, ''try_to_date(birthdate, 'DD/MM/YYYY')'', try_to_date(birthdate))
from raw_tbl;

select
    birthdate,
    try_to_date(birthdate),
    --try_to_date(birthdate, 'DD/MM/YYYY'),
    iff(is_date(try_to_date(birthdate)::variant), try_to_date(birthdate), try_to_date(birthdate, 'DD/MM/YYYY'))
from raw_tbl;

select
    coalesce(
        try_to_date(birthdate),
        try_to_date(birthdate, 'DD/MM/YYYY')
    ) as v
from raw_tbl