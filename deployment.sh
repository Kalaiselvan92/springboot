#!/bin/bash

#PID= `sudo netstat -ltnp | grep java | awk '{print $NF}' | sed "s/\// /g" | awk '{ print $1 }'`
#kill -9 $PID


ART=$(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')

cd /home/ec2-user; rm -rf *.jar; wget --user admin --password Password@123  https://ksdemo.jfrog.io/artifactory/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/$ART;


nohup java -jar /home/ec2-user/$ART


#wget -O - --no-check-certificate  http://localhost:8080/employee > /dev/null 2>  /home/ec2-user/response.txt; cat /home/ec2-user/response.txt | grep -F HTTP
