FROM maven:3.6.3-openjdk-15

WORKDIR /app

# Define ARG and set default to an empty directory
ARG MAVEN_CACHE_DIR=./empty
RUN mkdir -p /empty

# Copy the Maven cache if it exists
COPY ${MAVEN_CACHE_DIR} /root/.m2/repository

COPY pom.xml ./
COPY src ./src

RUN mvn verify
CMD ["mvn", "verify"]
