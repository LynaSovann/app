# Stage 1: Build the application
FROM eclipse-temurin:17-jdk-alpine as build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and the pom.xml file to the container
COPY mvnw* pom.xml ./
COPY .mvn .mvn

# Download the dependencies for the build
RUN ./mvnw dependency:go-offline

# Copy the entire source code to the container
COPY src src

# Clean and package the application (skip tests if necessary)
RUN ./mvnw clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
