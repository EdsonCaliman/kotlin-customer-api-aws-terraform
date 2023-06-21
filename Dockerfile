FROM openjdk:19-jdk-alpine

VOLUME /tmp

COPY target/*.jar app.jar

CMD exec java $JAVA_OPTS \
    -Duser.timezone=America/Sao_Paulo \
    -Duser.language=pt-BR \
    -Duser.country=BR \
    -jar app.jar
EXPOSE 8080
