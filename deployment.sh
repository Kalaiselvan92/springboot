#!/bin/bash


ART=$(curl https://ksdemo.jfrog.io/artifactory/api/storage/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/ | grep '.uri' | awk ' { print $3} ' | sed s/\"//g | sed s/,//g | tr -d '/' | grep jar | awk 'END{print}')

cd /home/ec2-user; wget --user admin --password Password@123  https://ksdemo.jfrog.io/artifactory/maven-demo/com/javainuse/SpringBootHelloWorld/0.0.1-SNAPSHOT/$ART;


java -jar /home/ec2-user/$ART



