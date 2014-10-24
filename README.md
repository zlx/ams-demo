### How to Benchmark

1. comment `cached: true` in every Serializer file
2. run `bin/rake "benchmark:dynamic[10, 0]"` to get the data for reference group
3. uncomment `cached: true`
4. change Request Count(r) and Change Count(c), and run `bin/rake "benchmark:dynamic[r, c]"`
5. rm tmp/cache directory and run Step 4


### Design for The Benchmark 

Models:

Question belongs_to User
Answer belongs_to User
Answer belongs_to Question

+ use seed to mock mass of data
+ provide API to get questions/answers/users
+ use sleep to simulate calculate in real situation
+ request 10 API to zoom in the request time
+ change data between request to simulate data change in real situation
+ Change/Request as an indicator for application data change frequency


### Benchmark Result

![Benchmark Result](https://raw.githubusercontent.com/zlx/ams-demo/master/chart.png)

notes:
+ x is Change/Request, Request total is 10
+ y is No Cache Request Time / Cached Request Time
