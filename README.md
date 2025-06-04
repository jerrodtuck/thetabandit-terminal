# ThetaBandit Terminal - Railway Deployment

This repository contains the Docker configuration for deploying the ThetaData Terminal to Railway for thetabandit.com.

## Overview

The ThetaData Terminal is a Java application that provides a local server for accessing ThetaData's market data API. This Docker container runs the terminal in a production environment using Google Distroless for security and minimal attack surface.

## Prerequisites

1. **ThetaTerminal.jar**: Download the latest version from [ThetaData](https://download-stable.thetadata.us/)
2. **ThetaData Account**: Configured with your account credentials (me@jerrodtuck.com)
3. **Railway Account**: For deployment

## Setup Instructions

### 1. Download ThetaData Terminal

```bash
# Download the latest ThetaTerminal.jar and place it in this directory
wget https://download-stable.thetadata.us/ThetaTerminal.jar
```

### 2. Build Docker Image Locally (Optional)

```bash
docker build -t thetabandit-terminal .
docker run -p 25510:25510 thetabandit-terminal
```

### 3. Deploy to Railway

1. Connect this repository to Railway
2. The container is pre-configured with your ThetaData credentials
3. Railway will automatically build and deploy using the Dockerfile

## Configuration

### Environment Variables

The container is configured with:
- **Username**: me@jerrodtuck.com
- **Password**: [Configured in Dockerfile]
- **Port**: 25510 (ThetaData Terminal default)

### Docker Configuration

- **Base Image**: `gcr.io/distroless/java21-debian12:latest`
- **Java Version**: Java 21 (as recommended by ThetaData)
- **Security**: Distroless image with minimal attack surface
- **Port**: 25510 (ThetaData Terminal default)
- **Memory**: 512MB max, 256MB initial

## Usage

Once deployed, the ThetaData Terminal will be accessible at:
```
https://your-railway-app.railway.app:25510
```

The terminal provides REST API endpoints for:
- Market data snapshots
- Historical data
- Real-time streaming
- Options data and Greeks
- Index and stock data

Refer to the [ThetaData API Documentation](https://http-docs.thetadata.us/) for available endpoints.

## Security Notes

- Uses Google Distroless base image for minimal attack surface
- No shell or package managers in the final image
- Runs as non-root user by default (distroless)
- Only exposes necessary port (25510)
- Credentials are embedded in the container for production use

## Troubleshooting

1. **Container won't start**: Check that ThetaTerminal.jar is present in the build context
2. **Authentication issues**: Verify your ThetaData account is active and credentials are correct
3. **Port issues**: Ensure Railway assigns the correct port (25510)
4. **Memory issues**: Container is configured with 512MB max memory

## Support

For ThetaData Terminal issues, join their [Discord server](https://discord.gg/thetadata).
For Railway deployment issues, refer to [Railway Documentation](https://docs.railway.app/).

## License

This deployment configuration is for thetabandit.com. ThetaData Terminal is proprietary software by ThetaData. 