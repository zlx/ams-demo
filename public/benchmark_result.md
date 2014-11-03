# 性能测试比较

模型：
 
+ Question belongs_to User
+ Answer belongs_to User
+ Answer belongs_to Question


基本情况: 每个 API 请求10次, 分别测试 users, questions， answers 的 API

基本步骤：

1. 移除缓存代码/添加缓存代码
2. 移除现有缓存文件： `rm -rf tmp/cache`
3. 运行命令（Command）
4. 得到结果

生成缓存效果图脚本： [缓存结果脚本](http://jsfiddle.net/u8dg517z/)

## AMS 新缓存策略性

效果： [http://jsfiddle.net/u8dg517z/1/](http://jsfiddle.net/u8dg517z/1/)

### 不缓存时

Command: `bin/rake benchmark:ams:static`

total: 218.552456 answers: 125.086825 questions: 62.398483 users: 31.067148

### 变化率为 0

Command: `bin/rake benchmark:ams:static`

total: 3.592084 answers: 2.444963 questions: 0.833137 users: 0.313984

#### 每 1 次请求，随机修改 5 个数据， 变化率： 5

Command: ` bin/rake "benchmark:ams:dynamic[1, 5]"`

total: 4.45836 answers: 2.860041 questions: 1.055253 users: 0.543066

#### 每 2 次请求，随机修改 5 个数据， 变化率: 2.5

Command: `bin/rake "benchmark:ams:dynamic[2, 5]"`

total: 4.284781 answers: 2.714101 questions: 1.124338 users: 0.446342

#### 每 5 次请求，随机修改 2 个数据， 变化率： 0.4

Command: ` bin/rake "benchmark:ams:dynamic[5, 2]"`

total: 4.272063 answers: 2.865145 questions: 0.974502 users: 0.432416

#### 每 10 次请求，随机修改 1 个数据， 变化率： 0.1

Command: ` bin/rake "benchmark:ams:dynamic[10, 1]"`

total: 3.836938 answers: 2.627063 questions: 0.892995 users: 0.31688


## jbuilder 缓存

效果：[http://jsfiddle.net/4gsnkbfw/1/](http://jsfiddle.net/4gsnkbfw/1/)

### 不缓存时

Command: `bin/rake benchmark:jbuilder:static""`

total: 220.495259 answers: 126.131296 questions: 62.976411 users: 31.387552

### 变化率为 0

Command: ` bin/rake "benchmark:jbuilder:dynamic[10, 0]"`

total: 3.830427 answers: 2.643148 questions: 0.815531 users: 0.371748

#### 每 1 次请求，随机修改 5 个数据， 变化率： 5

Command: ` bin/rake "benchmark:jbuilder:dynamic[1, 5]"`

total: 4.439994 answers: 2.78793 questions: 1.113543 users: 0.538521

#### 每 2 次请求，随机修改 5 个数据， 变化率: 2.5

Command: ` bin/rake "benchmark:jbuilder:dynamic[2, 5]"`

total: 3.943025 answers: 2.497299 questions: 1.001955 users: 0.443771

#### 每 5 次请求，随机修改 2 个数据， 变化率： 0.4

Command: ` bin/rake "benchmark:jbuilder:dynamic[5, 2]"`


total: 3.733144 answers: 2.487776 questions: 0.892729 users: 0.352639

#### 每 10 次请求，随机修改 1 个数据， 变化率： 0.1

Command: ` bin/rake "benchmark:jbuilder:dynamic[10, 1]"`

total: 3.667515 answers: 2.478294 questions: 0.851009 users: 0.338212
