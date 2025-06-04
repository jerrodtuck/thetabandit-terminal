# Use Google Distroless Java 21 image for production
FROM gcr.io/distroless/java21-debian12:latest

# Set environment variables
ENV PORT=25510

# Create the ThetaData directory structure
# Copy the ThetaData Terminal JAR file
COPY ThetaTerminal.jar /app/ThetaTerminal.jar

# Copy the configuration file to the expected location
COPY config_0.properties /root/ThetaData/ThetaTerminal/config_0.properties

# Set working directory
WORKDIR /app

# Expose the default ThetaData Terminal port
EXPOSE $PORT

# Run the ThetaData Terminal with your credentials and custom config
# Use --config to specify our configuration file
ENTRYPOINT ["java", "-Xmx2g", "-Xms512m", "-Dfile.encoding=UTF-8", "-Dconsole.encoding=UTF-8", "-jar", "/app/ThetaTerminal.jar"]
CMD ["me@jerrodtuck.com", "2;8SB*Y@Pq7U*V~~j'nD", "--config=/root/ThetaData/ThetaTerminal/config_0.properties"] 