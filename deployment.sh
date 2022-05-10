#!/bin/bash
cd /home/runner
ART=$(wget -O - --no-check-certificate https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')
wget -N https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/wss/wss/0.0.1-SNAPSHOT/$ART
mv /home/runner/$ART /home/runner/spring.jar
java -jar spring.jar &

echo "http://localhost:8080/employee"

echo $(wget --spider -S "http://localhost:8080/employee" 2>&1 | grep -F HTTP)
