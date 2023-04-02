# FROM openjdk:17
# EXPOSE 9090
# ADD target/devops.jar devops.jar
# ENTRYPOINT ["java", "-jar", "devops.jar"]


# Build stage
FROM maven:3.9.1-openjdk-17 as build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /app/src/
RUN mvn package -DskipTests

# Final stage
FROM openjdk:17
RUN apt-get update && \
    apt-get install -y docker.io
EXPOSE 9090
COPY --from=build /app/target/devops.jar devops.jar
ENTRYPOINT ["java", "-jar", "devops.jar"]

