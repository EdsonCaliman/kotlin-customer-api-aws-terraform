FROM openjdk:19-jdk-alpine

ADD /target/kotlin-customer-api-aws-terraform.jar app.jar

CMD exec java $JAVA_OPTS \
    -Duser.timezone=America/Sao_Paulo \
    -Duser.language=pt-BR \
    -Duser.country=BR \
    -jar app.jar
EXPOSE 8080
