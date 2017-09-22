1. Login DockerHub, there will be credential generated at ~/.docker/config.json for later to push the docker image to docker hub.

```
docker login
```
2. Package to get the jar file.

```
mvn clean package 
```
3.Check the jar file build build: get in target folder and do

```
java -jar myapp-0.0.1-SNAPSHOT.jar
```

4.Build and push docker image:

```
mvn dockerfile:build
mvn dockerfile:push
```