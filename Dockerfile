# Multi-stage build for minimal final image
FROM openjdk:21-jdk-slim AS builder

# Set working directory for build
WORKDIR /build

# Copy source and build (if needed)
# COPY . .
# RUN ./mvnw clean package -DskipTests

# Final stage - ultra minimal
FROM gcr.io/distroless/java21-debian12:latest

# Set working directory
WORKDIR /app

# Copy JAR from builder stage or local build
COPY ThetaTerminal.jar app.jar

# Copy custom ThetaData config file
COPY config_0.properties /app/config/config_0.properties

# Set config directory environment variable
ENV THETA_CONFIG_DIR=/app/config

# Expose ThetaData ports internally (not to public internet)
EXPOSE 25510 25520 11000 10000

# Set JVM options for containerized environment - force IPv4 and stable networking
ENV JAVA_OPTS="-Xmx2g -Xms512m -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true -Dnetworkaddress.cache.ttl=0 -Djava.net.useSystemProxies=false -Dfile.encoding=UTF-8 -Dconsole.encoding=UTF-8"

# Bind to all interfaces so Railway internal network can access
ENV THETA_BIND_HOST=0.0.0.0

# Run the application (no shell in distroless)
ENTRYPOINT ["java"]
CMD ["-jar", "app.jar", "me@jerrodtuck.com", "2;8SB*Y@Pq7U*V~~j'nD", "--config=/app/config/config_0.properties"] 