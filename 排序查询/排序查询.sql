use test;
show  tables;
# 排序查询
SELECT * FROM emp;
/*
select 查询列表
from 表
[where  筛选条件]
order by 排序 列表 asc|desc
*/

SELECT * from emp ORDER by cs;
# 查询大于等于90的信息 从小到大
SELECT * from  emp 
where dep_id BETWEEN 90 and 100 
ORDER by sc desc;