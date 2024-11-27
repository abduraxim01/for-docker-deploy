FROM ubuntu:latest AS yarat
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim
EXPOSE 9090
COPY --from=yarat /build/libs/demo-0.0.1-SNAPSHOT.jar komp-web.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

