FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y dos2unix

RUN dos2unix mvnw

RUN chmod +x mvnw && ./mvnw clean package -DskipTests

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java -jar target/*.jar"]
