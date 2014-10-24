## AMS 新缓存策略性能测试

模型： 
Question belongs_to User
Answer belongs_to User
Answer belongs_to Question



每个 API 请求10次

不缓存时：

total: 183.301497 s
answers: 91.846896 s
questions: 61.06801 s
users: 30.386591 s

### 变化率为 0

total: 2.497619 answers: 1.539447 questions: 0.642022 users: 0.31615


#### 每 2 次请求，随机修改 5 个数据， 变化率: 2.5

total: 3.542356 answers: 2.009613 questions: 1.0028 users: 0.529943


#### 每 5 次请求，随机修改 2 个数据， 变化率： 0.4

total: 2.308829 answers: 1.355326 questions: 0.603481 users: 0.350022

#### 每 10 次请求，随机修改 1 个数据， 变化率： 0.1

total: 2.293887 answers: 1.466556 questions: 0.632019 users: 0.195312

#### 每 1 次请求，随机修改 5 个数据， 变化率： 5

total: 3.17908 answers: 1.812378 questions: 0.931955 users: 0.434747