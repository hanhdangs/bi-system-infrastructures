###Services
- LocalStack
- Sql Server 2019
- MySql 5.7
- MongoDB 3.4
###Spinning up
Start services:
```
docker-compose up
```

Stop services:
```
docker-compose down
```

###Connection strings
- mongodb
```
mongodb://localhost:37017
```
- sql server
```
server=localhost,2433;initial catalog=<DB_NAME>;user id=sa;password=Pass@word;
```
- mysql
```
server=localhost;port=13306;database=<DB_NAME>;uid=root;pwd=Pass@word;
```

###LocalStack
- Endpoint
```
http://localhost:4566/
```
- SQS APIs
```
https://docs.localstack.cloud/aws/sqs/
```
- Create new queue in SQS by adding below function at creation session of file __sqs_bootstrap.sh__. Queues shall be created automatically once LocalStack service started
```
create_queue <QUEUE_NAME>
```