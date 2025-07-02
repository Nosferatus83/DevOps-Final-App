# Этап сборки
FROM maven:3.8-openjdk-11 as builder

RUN git clone https://github.com/Nosferatus83/DevOps-Final-App.git
WORKDIR /DevOps-Final-App
RUN mvn clean package war:war

# Финальный этап
FROM jetty:9.4-jre11-alpine

# Копируем WAR в авто-деплой директорию Jetty
COPY --from=builder /DevOps-Final-App/target/Puzzle15-1.0-SNAPSHOT.war /var/lib/jetty/webapps/ROOT.war

EXPOSE 8080
