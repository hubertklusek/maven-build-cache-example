FROM maven:3.6.3-openjdk-15

WORKDIR /app

COPY ${MAVEN_CACHE} /root/.m2/repository

COPY pom.xml ./
COPY src ./src

RUN mvn verify

CMD ["mvn", "verify"]
