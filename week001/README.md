# Frosty Friday – Week 1 🧊  External Stages (Basic)

| 項目 | 内容 |
|------|------|
| **Goal** | S3 上の CSV を外部ステージ経由で取り込み、集計結果を確認する |
| **Snowflake Edition** | Enterprise, AWS us-west-2 |
| **Tools** | SnowSQL 1.4.24, VS Code |

## How to run
```sql
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
