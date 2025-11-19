FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/java_hello_student-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]

