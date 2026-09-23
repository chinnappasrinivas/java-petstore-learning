FROM eclipse-temurin:17-jre

COPY target/openapi-spring-0.0.0.jar /app.jar

RUN groupadd --system spring && useradd --system --gid spring spring
USER spring:spring

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]