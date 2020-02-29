# 使用Mysql 的基础查询语句

> ``名称等东西可以加上这个

### 1. show

```mysql
use 数据库名; #进入数据库
show database; #显示数据库
show table; # 显示所有表
show COLUMNS FROM 表名# 显示表列
SHOW STATUS，用于显示广泛的服务器状态信息；
SHOW GRANTS; #显示授予用户的权限
SHOW ERRORS和SHOW WARNINGS; #用来显示服务器错误或警告消息。
desc 表名; #查询表结构
```

### 2. SELECT

```mysql
SELECT 列名1，列名2 from 表名; # 查看表中多个列的元素
SELECT * FROM 表名; # *通配符 所有列
SELECT DISTINCT id FROM TABL_E; #去重放在列名前面
# distinct
SELECT ID FROM TABL_E LIMIT 5; #前5个行
SELECT ID FROM TABL_E LIMIT 5, 5; #从第5行开始的后5个行，行是从0开始的
SELECT ID FROM TABL_E LIMIT 5 OFFSET 1; #从第1行开始的后5个行，行是从0开始的
SELECT TABL_E.ID FROM TABL_E; #完全限定列名

# 查询常量值
SELECT 100;
SELECT 'ssa';
# 查询表达式
SELECT 100%98;
# 查询函数
SELECT VERSION();

# 起别名
/*
便于理解
如果查询字段有重名的情况,使用别名可区分
也可以只加空格
加双引号可以区分
*/
SELECT 100%98 AS 结果;
SELECT last_name AS 姓, first_name AS 名 FROM emp;
SELECT last_name "姓", first_name 名 FROM emp;
SELECT DISTINCT last_name "姓", first_name 名 FROM emp; 去重
SELECT CONCAT('a','b','c') AS 结果; # 如果有null就会自动显示null
# 连接
/*
 结果
 abc
 */
 
SELECT 
  IFNULL(sid, 0) AS id, # 如果为空换成什么值
  CONCAT(sid,',', cid)  #其实就像c++中的 cout << 一样；
FROM
  sc ;

```

> 不能部分使用DISTINCT, DISTINCT关键字应用于所有列而 不仅是前置它的列。如果给出SELECT DISTINCT vend_id, prod_price，除非指定的两个列都不同，否则所有行都将被 检索出来。
>
> <img src="image-20200228172217496.png" alt="image-20200228172217496" style="zoom:100%;" />

### 3. 排序数据

> sql语句是由子句构成的 通常一个人关键字和所提供数据组成

```mysql
SELECT ID FROM TABL_E ORDER BY ID;
# order这条语句除了指示MySQL对prod_name列以字母顺序排序数据的ORDER BY子句外，与前面的语句相同
```

#### 3.1 多级排序

> 就连着在后面写就行了

```mysql
SELECT ID, Iv, Ix FROM TABL_E ORDER BY ID, Iv, Ix; #会先按ID在按Iv在按Ix排序
```

* 排序方向：

```mysql
SELECT ID,Iv FROM TABL_E ORDER BY ID DESC; #降序desc 降序关键字只需要放在需要对应的列后面
SELECT ID,Iv FROM TABL_E ORDER BY ID DESC, Iv;
# ID 降序 Iv没有 
#ASC升序 默认升序
```

* 组合找最值

  ```mysql
  SELECT ID,Iv FROM TABL_E ORDER BY ID DESC LIMIT 1; # 最高的以此可以知道如何找最低的
  limit 必须放在orderby 之后
  ```

  #### 3.2 条件查询
  
  

```mysql
 /*
 语法:
	select
		查询列表 3
	form
		表名 1
	where                  #r如同if 表达的结果不是true就是false
		筛选条件; 2
 */
 
/*
一按条件表达式筛选
条件运算符： >< = != <=  >=
二逻辑表达式
	&& || ！
	and or not
	模糊表达式
	like
	between and
	in
	is null
*/
# 查询大于12000的信息
SELECT 
  * 
FROM
  emp 
 WHILE
    salary > 12000 ;
# 查看不等于90的
SELECT 
	*
FROM
	emp
WHERE
	dep_id!=90; 或者 dep_id<>90;
```

* 按逻辑表达式
  * 用于连接条件表达式的

```mysql
# 90到100之间
SELECT 
	*
FROM 
	emp
WHERE 
	dep_id >= 90 AND dep_id <= 100;

# id 不是在90到100之间的，或者工资高于 cs 不等于90的
SELECT 
*
FROM 
	emp
WHERE
	NOT(90 <= dep_id AND dep_id <= 100) OR cs != 90;
```

* 模糊查询

  ```mysql
  like
  between and
  in
  is null | is not null
  # like
  一般跟通配符一起用
  % 任意多个字符 包含0, not null
  _ 任意单个字符
  \ 如果要转义就用 也可以自己设置 ESCAPE '$'
  # 查询包含字母c的信息
  SELECT * FROM emp WHERE
  	name_s LIKE '%c%'; # %->是通配符
  # 查第二个字符是c的
  SELECT * FROM emp WHERE
  	name_s LIKE '_c%'; # %->是通配符
  ```

  ```mysql
  # between and
  # 90-100
  # 包含临界值
  # 必须从左到右
  SELECT * FROM emp WHERE dep_id BETWEEN 90 AND 100;
  # in
  
  SELECT 
  	*
  FROM
  	emp
  WHERE
  	dep_id = 90 OR dep_id = 100 OR dep_id = 110;
  
  # --------------------------------------------------------
  # 判断是否属于in内的值
  
  SELECT 
  	*
  FROM
  	emp
  WHERE
  	dep_id IN(90, 100, 110);
  
  ```

  * is null | is not null

    > 等于和普通的运算符不能判断null值

```mysql
SELECT 
	*
FROM
	emp
WHERE
	cs is null;
```

* 安全等于

  * `<=>`: 这个可以用null和普通值

  ```mysql
  SELECT 
  	*
  FROM
  	emp
  WHERE
  	cs <=> null;
  ```

  