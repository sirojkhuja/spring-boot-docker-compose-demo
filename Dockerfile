FROM gradle:7.6.1-jdk17 AS build

WORKDIR /app
COPY . .
RUN gradle build -x test

FROM openjdk:17-slim

WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar

ENV SPRING_DEVTOOLS_REMOTE_SECRET=mysecret
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "-Dspring.devtools.remote.secret=mysecret", "app.jar"]