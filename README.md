Firstly, do a "docker login" first, there will be credential generated at ~/.docker/config.json for later to push the docker image to docker hub.


mvn clean package 
mvn dockerfile:build
mvn dockerfile:push
