FROM maven:3.6.3-openjdk-15

WORKDIR /app

# Copy cached Maven dependencies if available
ARG MAVEN_CACHE
COPY ${MAVEN_CACHE:-/root/.m2/repository} /root/.m2/repository

COPY pom.xml ./
COPY src ./src

RUN mvn verify

CMD ["mvn", "verify"]
