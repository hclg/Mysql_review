# Mysql 的正则表达式

> 匹配文本，将一个模式与文本进行比较

例如：

```mysql
select name_s
from pros
where name_s regexp '1000' //表示包含1000的所有行 s1000也是
order by name_s;
```
* `.`是正则表达式语言中的任意匹配一个字符的意思
    ```mysql
    select *
    from emp
    where name_s regexp 'A.' //不区分大小写
    order by name_s;

    where name_s regexp binary 'a.' //区分大小写
    ```
### 1. 进行or匹配
> 为了搜索两个串之一(两种串我都要) `|`
```mysql
select * from emp where name_s REGEXP 'a|c' ORDER by name_s; ///有a或有c
```
### 2. 匹配几个字符之一
> 匹配单一字符。但是，如果想要特定字符就需要`[]`
```mysql
select prod_name from products
WHERE prod_name REGEXP '[123] Ton' # 从123中的任意一个 类似[1|2|3]
select prod_name from products
WHERE prod_name REGEXP '[^123] Ton' # 除了123以外

select prod_name from products
WHERE prod_name REGEXP '1|2|3 Ton' #注意这里是 1 | 2 | 3 Ton
```
#### 3. 匹配范围
* `-`号替换
```mysql
[1-3] = [123] 这两个相同
[a-z] = [a...z]
```
#### 4. 使用特殊字符
> 如`.`我们要使用的话
* `\\`前导这个就可以了
```mysql
select * from products 
WHERE prod_name REGEXP '\\.'
select * from products 
WHERE prod_name REGEXP '[\\t]' --空格
```
|类|说明|
|-------|-----------------------------------|
|[:alnum:] |任意字母和数字（同[a-zA-Z0-9]）|
|[:alpha:] |任意字符（同[a-zA-Z]）|
|[:blank:] |空格和制表（同[\\t]）|
|[:cntrl:] |ASCII控制字符（ASCII 0到31和127）|
|[:digit:] |任意数字（同[0-9]）|
|[:graph:] |与[:print:]相同，但不包括空格|
|[:lower:] |任意小写字母（同[a-z]）|
|[:print:] |任意可打印字符|
|[:punct:] |既不在[:alnum:]又不在[:cntrl:]中的任意字符|
|[:space:] |包括空格在内的任意空白字符（同[\\f\\n\\r\\t\\v]）|
|[:upper:] |任意大写字母（同[A-Z]）
|[:xdigit:] |任意十六进制数字（同[a-fA-F0-9]

|元 字 符 |说 明|
|---------|-----|
|+| 1个或多个匹配（等于{1,}）|
|*| 0个或多个匹配|
|{n}| 指定数目的匹配|
|{n,}| 不少于指定数目的匹配|
|{n,m}| 匹配数目的范围（m不超过255）|

样例：
```sql
SELECT * from products
WHERE prod_name Regexp '[[:digit:]]{4}'
order by prod_name

```

**Query result 2 rows!**

prod_id | vend_id | prod_name | prod_price | prod_desc
--- | --- | --- | --- | ---
JP1000 | 1005 | JetPack 1000 | 35 | JetPack 1000, intended for single use
JP2000 | 1005 | JetPack 2000 | 55 | JetPack 2000, multi-use

|模式|	描述|
|---|------|
|^|	匹配输入字符串的开始位置。如果设置了 RegExp 对象的 Multiline 属性，^ 也匹配 '\n' 或 '\r' 之后的位置。|
|$|	匹配输入字符串的结束位置。如果设置了RegExp 对象的 Multiline 属性，$ 也匹配 '\n' 或 '\r' 之前的位置。|
|.|	匹配除 "\n" 之外的任何单个字符。要匹配包括 '\n' 在内的任何字符，请使用象 '[.\n]' 的模式。|
|[...]|	字符集合。匹配所包含的任意一个字符。例如， '[abc]' 可以匹配 "plain" 中的 'a'。|
|[^...]	|负值字符集合。匹配未包含的任意字符。例如， '[^abc]' 可以匹配 "plain" 中的'p'。|
|* |	匹配前面的子表达式零次或多次。例如，zo* 能匹配 "z" 以及 "zoo"。* 等价于{0,}。|
|+|	匹配前面的子表达式一次或多次。例如，'zo+' 能匹配 "zo" 以及 "zoo"，但不能匹配 "z"。+ 等价于 {1,}。|
|{n}|	n 是一个非负整数。匹配确定的 n 次。例如，'o{2}' 不能匹配 "Bob" 中的 'o'，但是能匹配 "food" 中的两个 o。|
|{n,m}|	m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次。|
```mysql
SELECT *
from products
WHERE prod_name
Regexp '\\([0-9] stic.{0,1}\\)'
order by prod_name
```
