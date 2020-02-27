# 使用Mysql

### 1. show

```mysql
use 数据库名; #进入数据库
show database; #显示数据库
show table; # 显示所有表
show COLUMNS FROM 表名# 显示表列
SHOW STATUS，用于显示广泛的服务器状态信息；
SHOW GRANTS; #显示授予用户的权限
SHOW ERRORS和SHOW WARNINGS; #用来显示服务器错误或警告消息。
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


```

> 不能部分使用DISTINCT DISTINCT关键字应用于所有列而 不仅是前置它的列。如果给出SELECT DISTINCT vend_id, prod_price，除非指定的两个列都不同，否则所有行都将被 检索出来。

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

  