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