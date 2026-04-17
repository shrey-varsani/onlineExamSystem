# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-focal
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Create directories for persistent data (Note: Render Free tier disk is ephemeral)
RUN mkdir -p /app/data /app/uploads

# Render sets the PORT environment variable, so we use it
EXPOSE 7890

# Run the jar file, ensuring we bind to 0.0.0.0 and the port Render expects
ENTRYPOINT ["java", "-Dserver.port=${PORT:-7890}", "-jar", "app.jar"]
