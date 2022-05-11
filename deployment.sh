#!/bin/bash


ART=$(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')

cd /home/ec2-user; rm -rf *.jar; wget --user admin --password Password@123  https://ksdemo.jfrog.io/artifactory/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/$ART;


nohup java -jar /home/runner/$ART > log.log 2>&1 & 

wget -O /dev/null http://localhost:8080/employee 2> /home/ec2-user/response.txt
ls -lrt
cat /home/ec2-user/response.txt | grep "200 OK"
