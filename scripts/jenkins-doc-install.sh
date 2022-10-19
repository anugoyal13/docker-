#!/bin/bash

docker pull jenkins/jenkins:lts

docker run -d --name jenkins -p 8080:8080 jenkins/jenkins:lts

# Initial run
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
