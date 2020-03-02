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

# 获取
str_to_date('9-12-1999', '%m-%d-%Y'); 月日年 


















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