# Build stage
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Copying the Maven project file and downloading the dependencies 아래 경로는 pom파일의 위치 넣어주기 마지막 .는 /app을 말하는 것임
COPY ./pom.xml .
RUN mvn dependency:go-offline

# Downloading the source code and building the application 펫클리닉가 저장된 깃 경로 적어주기
RUN git clone https://github.com/HBsoon/project-book.git /tmp/petclinic_btc && \
    mv /tmp/petclinic_btc/* ./ && \
    rm -rf /tmp/petclinic_btc
RUN mvn package -P MySQL -DskipTests

# Final stage
FROM tomcat:9.0.53-jdk16-openjdk-slim

# Install MySQL client
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    apt-get clean

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
COPY init-database.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-database.sh
EXPOSE 8080
CMD ["catalina.sh", "run"]