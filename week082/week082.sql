use role sysadmin;
use warehouse compute_wh;
use database frosty_friday_db;

Create schema week082;
use schema week082;


--------------------------------------------------------------
-- week082

create stage starting_stage
    url = 's3://frostyfridaychallenges/challenge_82/'
    ;

create or replace stage ffw084;

copy files 
    into @ffw084
    from @starting_stage
    ;

