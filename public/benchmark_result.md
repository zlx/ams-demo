# 性能测试比较

模型：
 
+ Question belongs_to User
+ Answer belongs_to User
+ Answer belongs_to Question


基本情况: 每个 API 请求10次, 分别测试 users, questions， answers 的 API

## AMS 新缓存策略性

### 不缓存时

步骤:

0. 去掉缓存代码
1. Command: `bin/rake benchmark:ams:static`
2. 得到结果

total: 218.552456 answers: 125.086825 questions: 62.398483 users: 31.067148

### 变化率为 0

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: `bin/rake benchmark:ams:static`
3. 得出结果

total: 3.778123 answers: 2.326849 questions: 1.092035 users: 0.359239

#### 每 1 次请求，随机修改 5 个数据， 变化率： 5

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:ams:dynamic[1, 5]"`
3. 得出结果

total: 5.136209 answers: 3.001593 questions: 1.233968 users: 0.900648

#### 每 2 次请求，随机修改 5 个数据， 变化率: 2.5

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: `bin/rake "benchmark:ams:dynamic[2, 5]"`
3. 得出结果

total: 4.284781 answers: 2.714101 questions: 1.124338 users: 0.446342

#### 每 5 次请求，随机修改 2 个数据， 变化率： 0.4

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:ams:dynamic[5, 2]"`
3. 得出结果

total: 6.405287 answers: 4.100956 questions: 1.677337 users: 0.626994

#### 每 10 次请求，随机修改 1 个数据， 变化率： 0.1

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:ams:dynamic[10, 1]"`
3. 得出结果

total: 6.822395 answers: 4.317531 questions: 1.8878 users: 0.617064

## jbuilder 缓存

### 不缓存时

步骤：

0. 去掉缓存代码
1. Command: `bin/rake benchmark:jbuilder:static`
2. 得到结果

total: 220.495259 answers: 126.131296 questions: 62.976411 users: 31.387552


### 变化率为 0

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake benchmark:jbuilder:static`
3. 得出结果


total: 9.845769 answers: 1.962589 questions: 5.801544 users: 2.081636

#### 每 1 次请求，随机修改 5 个数据， 变化率： 5

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:jbuilder:dynamic[1, 5]"`
3. 得出结果


total: 36.496331 answers: 18.457083 questions: 11.107355 users: 6.931893

#### 每 2 次请求，随机修改 5 个数据， 变化率: 2.5

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:jbuilder:dynamic[2, 5]"`
3. 得出结果


total: 27.917461 answers: 15.603559 questions: 8.104411 users: 4.209491

#### 每 5 次请求，随机修改 2 个数据， 变化率： 0.4

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:jbuilder:dynamic[5, 2]"`
3. 得出结果


total: 21.871125 answers: 13.61873 questions: 6.020485 users: 2.23191

#### 每 10 次请求，随机修改 1 个数据， 变化率： 0.1

步骤：

1. 移除现有缓存文件： `rm -rf tmp/cache`
2. Command: ` bin/rake "benchmark:jbuilder:dynamic[10, 1]"`
3. 得出结果

total: 21.373251 answers: 13.384983 questions: 5.966213 users: 2.022055
