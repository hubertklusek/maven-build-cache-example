FROM maven:3.6.3-openjdk-15

WORKDIR /workspace/app

COPY pom.xml .

COPY src src

COPY m2 /root/m2

RUN mv /root/m2 /root/.m2

RUN mvn verify
