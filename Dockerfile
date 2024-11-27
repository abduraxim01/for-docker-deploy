#FROM ubuntu:latest AS build
#WORKDIR /app
#COPY . .
#RUN ./gradlew bootJar --no-daemon

#FROM openjdk:17-jdk-slim
#EXPOSE 9090
#COPY --from=build /gradle/wrapper/gradle-wrapper.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]

FROM amazoncorretto:17
WORKDIR /app
COPY gradle/wrapper/gradle-wrapper.jar /app/yangi-jar-file.jar
ENTRYPOINT ["java", "-jar","yangi-jar-file.jar"]
