ARG BUILD_STAGE=default

FROM maven:3.6.3-openjdk-15 AS base

WORKDIR /workspace/app

COPY pom.xml .

COPY src src



FROM base AS cicd

COPY m2 /root/m2

RUN mv /root/m2 /root/.m2

RUN mvn verify


FROM base AS default

RUN mvn verify



FROM ${BUILD_STAGE}

CMD ["echo", "Running the ${BUILD_STAGE} build"]
