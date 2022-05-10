#!/bin/bash
cd /home/runner
ART= $(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | jq -r ".children[].uri" | tr -d '/' | tail -1)
wget -N https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/wss/wss/0.0.1-SNAPSHOT/$ART && mv $ART spring.jar

java -jar spring.jar &

echo "http://localhost:8080/employee"

echo $(wget --spider -S "http://localhost:8080/employee" 2>&1 | grep -F HTTP)
