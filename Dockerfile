FROM openjdk:17
EXPOSE 9090
ADD target/devops.jar devops.jar
ENTRYPOINT ["java", "-jar", "devops.jar"]