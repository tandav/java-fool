FROM maven:3.5.2-jdk-8-alpine
COPY . /spring-learn
# VOLUME . /spring-learn
WORKDIR /spring-learn
# ENTRYPOINT ["java", "-jar", "/app.jar"]
CMD ls
