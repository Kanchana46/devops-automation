FROM openjdk:17-alpine
EXPOSE 9090
ADD target/devops.jar devops.jar
ENTRYPOINT ["java", "-jar", "devops.jar"]