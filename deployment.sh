#!/bin/bash


ART=$(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')

cd /home/runner; wget --user admin --password Password@123  https://ksdemo.jfrog.io/artifactory/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/$ART; ls -lrt; 


nohup java -jar /home/runner/$ART > log.log 2>&1 & 

wget --spider -S "http://localhost:8080/employee" > /home/runner/response.txt
cat /home/runner/reponse.txt | grep -F HTTP
