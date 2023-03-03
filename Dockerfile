FROM openjdk:8-jre-alpine

COPY target/openapi-spring-0.0.0.jar /app.jar

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
