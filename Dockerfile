FROM openjdk:11
ARG JAR_FILE=target/*.jar
ENV SERVER_PORT=80
COPY ${JAR_FILE} app.jar
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]