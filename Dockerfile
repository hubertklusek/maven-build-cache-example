FROM maven:3.6.3-openjdk-15

WORKDIR /app

# Set default cache location to empty if not provided
ARG MAVEN_CACHE_DIR="/empty"
RUN mkdir -p /empty  # Ensure this path exists even if empty

# Copy cached Maven dependencies if they exist
COPY ${MAVEN_CACHE_DIR} /root/.m2/repository

COPY pom.xml ./
COPY src ./src

RUN mvn verify
CMD ["mvn", "verify"]
