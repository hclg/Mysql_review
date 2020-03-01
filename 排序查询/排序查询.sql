use test;
show  tables;
# 排序查询
SELECT *
FROM emp;
/*
select 查询列表
from 表
[where  筛选条件]
order by 排序 列表 asc|desc
*/
SELECT
    *
from emp
ORDER by
  cs;
# 查询大于等于90的信息 从小到大
use test;
SELECT
    *
from emp
where
  dep_id BETWEEN 90
  and 100
ORDER by # 放最后
  cs desc;

SELECT * FROM emp
WHERE cs >= 90 and (name_s = 'a%' or name_s = 'c%');
select * from emp where (name_s like 'a%' or name_s like 'c%') && cs >= 90;

select last_name, dep_id, salary*12*(1+IFNULL(comm_pct,0)) fomr