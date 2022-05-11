#!/bin/bash


ART=$(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')

cd /home/runner; wget --user admin --password Password@123  https://ksdemo.jfrog.io/artifactory/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/$ART; ls -lrt; 


java -jar /home/runner/spring.jar &

echo $(wget --spider -S "http://localhost:8080/employee" 2>&1 | grep -F HTTP)
