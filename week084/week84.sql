use role sysadmin;
use warehouse compute_wh;
use database frosty_friday_db;

Create schema week084;
use schema week084;


--------------------------------------------------------------
-- week084

CREATE STAGE frosty_aws_stage
  URL = 's3://frostyfridaychallenges/';

LIST @FROSTY_AWS_STAGE/challenge_84/;

CREATE or replace STAGE week84 ;

copy files 
    into @week84
    from @frosty_aws_stage/challenge_84/
    ;

list @week84;

-- drop stage @week84