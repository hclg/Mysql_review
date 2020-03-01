USE test;
CREATE  TABLE student(
 sid     INT(11) PRIMARY KEY NOT NULL,
 sname   CHAR(25) NOT NULL,
 age     INT(11) NOT NULL,
 sex     CHAR(2) NOT NULL,
 department CHAR(40) ,
 address  CHAR(200) ,
 birthplace  VARCHAR(256)
);
CREATE  TABLE sc(
  sid   INT(11) NOT NULL,
  cid   INT(11) NOT NULL,
  grade INT(11)
);
CREATE  TABLE course(
  cid    INT(11) NOT NULL PRIMARY KEY DEFAULT 4,
  cname  CHAR(40),
  teacher  CHAR(40)
);

CREATE TABLE emp (
	dep_id INT(11) PRIMARY KEY NOT NULL,
	name_s CHAR(40),
	cs INT(11)
);

#以下是插入课程表的数据
DELETE FROM course ;
INSERT INTO course VALUES('8108001','math','sandy');
INSERT INTO course VALUES('8108002','english','sherry');
#以下是插入成绩级表的数据
DELETE FROM sc;
INSERT INTO sc VALUES('3108001','8108010','90');
INSERT INTO sc VALUES('3108001','8108003','67');
INSERT INTO sc VALUES('3108002','8108003','54');
INSERT INTO sc VALUES('3108002','8108010','84');

INSERT INTO emp VALUES(89, 'a',90);
INSERT INTO emp VALUES(90, 'b',90);
INSERT INTO emp VALUES(91, 'c',90);
INSERT INTO emp VALUES(92, 'd',90);
INSERT INTO emp VALUES(93, 'e',90);
INSERT INTO emp VALUES(94, 'h',90);
INSERT INTO emp VALUES(100, 'i',NULL);
INSERT INTO emp VALUES(110, 'ab',90);
INSERT INTO emp VALUES(88, 'ac',90);

INSERT INTO emp VALUES(95, 'ac',99);
INSERT INTO emp VALUES(10000, 'ac',99);

# 条件查询
/*
一按条件表达式筛选
条件运算符： >< = != <=  >=
二逻辑表达式
	&& || ！
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


# 查询包含字母c的信息
SELECT
	*
FROM 
	emp
WHERE
	name_s LIKE '%c%'; # %->是通配符
# 查第二个字符是c的
SELECT
	*
FROM 
	emp
WHERE
	name_s LIKE '_c%'; # %->是通配符


# 90-100
SELECT * FROM emp WHERE dep_id BETWEEN 90 AND 100;


#3. in

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
	
IS NULL

SELECT 
	*
FROM
	emp
WHERE
	cs IS NULL;


SELECT 
	*
FROM
	emp
WHERE
	cs <=> NULL;





