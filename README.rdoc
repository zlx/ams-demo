### 测试方法

1. 先注释掉 Serializer 里面的 `cached: true`

2. 跑 `bin/rake "benchmark:dynamic[10, 0]"`  得到对照组的数据

3. 指定 Request Count(< 10) 和 Change Count(<30), 跑 `bin/rake "benchmark:dynamic[r, c]"` 得到对应数据 