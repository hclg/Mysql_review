# Mysql 的正则表达式

> 匹配文本，将一个模式与文本进行比较

例如：

```mysql
select name_s
from pros
where name_s pegexp '1000'
order by name_s;
```

