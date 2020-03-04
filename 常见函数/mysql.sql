use test;

# length
select length('john');
/* 4*/
--
# concat
--连接
select concat(last_name, ' '. first_name) 姓名
from emp;

-- upper、lower 小写，大写
-- substr,  substring
-- 索引从1开始
select substr('你好不是我', 3) out_put;
-- 从第三个字符开始截取
select substr('你好不是我', 1, 3) out_put;
-- 从第1个字符开始截取3个长度

-- 姓名中首字符大写、其他小写
select concat(upper(substr('last_name', 1, 1)), '_', lower(substr('last_name', 2)));

# instr 返回第一次出现的起始索引，如果没有0

SELECT instr('你是猪吗，', '你是') as out_put;
# TRIM 去掉前后没用的值
SELECT length(TRIM('    是你   ')) as out_put;
SELECT trim ('a' from 'aaaaaaaaaaaaaaa你好aaaaaaaaaa大苏打aaaaaaaaaaaaaa') as put;

# 7 lpad 用指定的字符实现左填充使总长度为你指定的
SELECT lpad('你是傻子', '10', 'ab');
# 8 rpad 右填充

# REPLACE 替换
# 你是替换成我是
SELECT replace('你是你是你是你是你是很厉害的', '你是', '我是') as put;


# 数学函数

# round 四舍五入
SELECT ROUND(-1.55); # -2
SELECT ROUND(1.55); # 2

# ceil 向上取整 返回大于等于他的

SELECT ceil(-1.02); -1
# floor 向下取整
SELECT FLOOR(-9.99);

# truncate 截断
SELECT TRUNCATE(12.69999, 1); #取几位小数

#mod 取余
SELECT mod(10, -3);
SELECT 10%3;

# 日期函数

# now 返回日期和时间
SELECT now();

# curdate 返回当前日期
SELECT curdate();

#curtime 返回当前时间

SELECT curtime();

# 可以指定获取部分，年月日小时分钟秒

SELECT year(Now()) 年;
SELECT year('1998-1-1') 年;
SELECT MONTH(NOW()) 月;

SELECT MONTHNAME(NOW()) 月;

# 获取 字符转日期
SELECT str_to_date('9-12-1999', '%m-%d-%Y'); 月日年
SELECT * FROM orders; 
SELECT * from orders 
where order_date = str_to_date('10-3-2005', '%c-%d-%Y');

# 日期转字符
SELECT date_format(now(), '%y-%m-%d') as out_put;

# 其他

SELECT version();
SELECT DATABASE();

# 流程函数
# if 
SELECT if(10 < 5, '大', '小');

# case 函数的使用一: switch case

case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句1;
when 常量2 then 要显示的值2或语句2;
else 要显示的值
end

SELECT salary 原始工资, department,
CASE department
when 30 then salary*1.1
when 40 then salary*1.2
else salary
end as 新工资
from emp;

#### 1.5 分组函数
/*
统计函数，
聚合函数，
分组函数

分类
sum  avg max min count
*/

use myemployees;
SELECT sum(salary) from employees;
SELECT AVG(salary) from employees;
# 2参数支持哪些类型
SELECT count(commission_pct) FROM employees;
SELECT sum(distinct commission_pct) FRoM employees;
# 忽略null值

# count
SELECT count(*) from employees;
# 查询最大入职时间和最小入职时间的相差天数
SELECT datediff(MAx(hiredate), min(hiredate ))

# 和分组函数一同查询的字段要求必须事group by
/*
语法：
  select 分组函数, 列(要求出现在group by的后面)
  from 表
  【where 筛选条件】
  group by 分组列表
  order by 字句

*/
# 每个job_id 的最高工资
SELECT MAX(salary), job_id FROM
employees
group by job_id;


# 每个位置 的 的部门个数
SELECT COUnt(*), location_id 
FROM departments
GROUP BY location_id

# 添加筛选条件
# where 分组前筛选
SELECT AVG(salary), department_id
FROM employees
WHERE email LIKE '%a%'
GROUP by department_id;
# 分组后筛选 having
SELECT count(*) num, department_id
FROM employees
GROUP by department_id
HAVING num > 2;

SELECT MAX(salary) ma, job_id
FROM employees
where commission_pct is not null
GROUP by job_id
HAVING ma > 12000

select min(salary) mi, manager_id
from employees
where manager_id > 102
GROUP by manager_id
having mi > 5000

# 多字段
SELECT count(*) con, department_id, job_id
FROM employees
group by job_id,department_id;

# 多表连接
/*
  笛卡尔乘积现象，m行和n行 --n*m行
  添加条件
  分类：
      sql199标准
      功能：
        内连接
            等值连接
            非等值连接
            自连接
        外连接
            左外
            右外
        交叉

    n表连接至少需要n-1个连接条件
    多表的顺序没有要求
*/

SELECT * from beauty;
SELECT * from boys;
SELECT name, boyName 
from boys,beauty
WHERE boyfriend_id = boys.id;

# 等值连接

SELECT name, boyName 
from boys,beauty
WHERE beautty.boyfriend_id = boys.id;

SELECT `last_name`,department_name 
FROM  employees,departments 
WHERE employees.department_id = departments.department_id;

# 两个表的顺序可以交换
SELECT e.last_name, e.job_id, j.job_title
FROM  employees e,jobs j
WHERE e.job_id = j.job_id;


# 查询城市名第二个字符为o的部门名和城市名

select department_name, city
FROM departments d, locations lo
WHERE d.location_id = lo.location_id
AND city like '_o%';

# 查询每个城市的部门个数
SELECT city, count(department_id) 个数
FROM locations c, departments d
WHERE c.location_id = d.location_id
GROUP BY city
order by count('个数') desc;



select *
from emp
where name_s
regexp 'A.' //不区分大小写
order by name_s;


INSERT INTO `
test`.`emp
`
(cs, dep_id, name_s)
VALUES
(
    99,
    201,
    '5c'
  );
select *
from emp
where name_s
REGEXP 'a|c' ORDER by name_s;

select prod_name
from products
WHERE prod_name
REGEXP '[123] Ton'

select prod_name
from products
WHERE prod_name
REGEXP '[^123] Ton'

select prod_name
from products
WHERE prod_name
REGEXP '1|2|3 Ton'

select prod_name
from products
WHERE prod_name
REGEXP '[1-3] Ton'

select *
from products
WHERE prod_name
REGEXP '\\f'

INSERT INTO `
test`.`products
`
(
    prod_desc,
    prod_id,
    prod_name,
    prod_price,
    vend_id
  )
VALUES
(
    'assss',
    '1212',
    ',,',
    '1.2',
    1002
  );

select *
from products
WHERE prod_name
REGEXP '[:alpha:]' 
--空格
# 匹配多个实例
SELECT *
from products
WHERE prod_name
Regexp '\\([0-9] stic.{0,1}\\)'
order by prod_name

SELECT *
from products
WHERE prod_name
Regexp '^[[:digit:]]'
order by prod_name

# 以st开头
SELECT name
FROM person_tbl
WHERE name
REGEXP '^st';

SELECT LPAD('徐雪姣adff', 3, 'sss') AS out_put;
SELECT now();

# 常用函数