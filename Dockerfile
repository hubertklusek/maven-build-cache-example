FROM maven:3.6.3-openjdk-15

WORKDIR /app

COPY pom.xml ./
COPY src ./src

RUN mvn verify

CMD ["mvn", "verify"]
