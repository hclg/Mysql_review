# 常见函数

* 概念: 类似与c++的函数，将一组逻辑语句封装在函数体中，对外暴露函数名
* 好处: 
    1. 隐藏了实现细节
    2. 提高代码的重用性
* 调用: `select 函数名(实参列表) 【from 表】;`
* 特点： 
    1. 叫啥
    2. 干啥
* 分类:
    1. 单行函数 如 concat
        > 字符函数
    2. 分组函数

### 1 单行函数
#### 1.1 字符函数
    ```mysql    
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


    ```

    #### 1.2 数字函数

    ```mysql
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

    ```
    