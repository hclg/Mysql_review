use test;

# length
select length('john'); /* 4*/
--
# concat --连接
select concat(last_name, ' '. first_name) 姓名 from emp;

-- upper、lower 小写，大写
-- substr,  substring
-- 索引从1开始
select substr('你好不是我', 3) out_put; -- 从第三个字符开始截取
select substr('你好不是我', 1, 3) out_put; -- 从第1个字符开始截取3个长度

-- 姓名中首字符大写、其他小写
select concat(upper(substr('last_name', 1, 1)), '_', lower(substr('last_name', 2)));
select *
from emp
where name_s regexp 'a'
order by name_s;