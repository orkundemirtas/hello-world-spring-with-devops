# Docker Build Stage
FROM openjdk:11 as build


# Build Stage
WORKDIR /opt/app

COPY ./ /opt/app
RUN mvn clean install -DskipTests


# Docker Build Stage
FROM adoptopenjdk/openjdk11:alpine-jre

COPY --from=build D:\\JenkinsWorkspace\\springboot\\*.jar app.jar

ENV PORT 8081
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]