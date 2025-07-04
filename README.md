# Springfield Resilience4j Demo

## Project Overview
This project demonstrates the use of Resilience4j with Spring Boot to build fault-tolerant applications. It consists of two main components:

1. **API Server**: A Spring Boot application that provides a RESTful API for managing books.
2. **API Client**: A Spring Boot application that consumes the API Server's endpoints using Resilience4j patterns for fault tolerance.

## Features
- **Circuit Breaker Pattern**: Prevents cascading failures by stopping requests to failing services
- **Retry Pattern**: Automatically retries failed requests with configurable backoff strategies
- **Bulkhead Pattern**: Limits concurrent calls to protect the system from overload
- **Fallback Mechanisms**: Provides alternative responses when services are unavailable

## Project Structure
- `api-server/`: Contains the server application that provides the book API
- `api-client/`: Contains the client application that demonstrates Resilience4j patterns
- `docker-compose.yml`: Sets up the PostgreSQL database used by the server

## Prerequisites
- Java 24
- Docker and Docker Compose
- Gradle

## Running the Project

### 1. Start the Database
```bash
docker-compose up -d
```

This will start a PostgreSQL database with the following configuration:
- Database: resilience4j
- Username: postgres
- Password: postgres
- Port: 5432

### 2. Start the API Server
```bash
cd api-server
./gradlew bootRun
```

The server will start on port 8080.

### 3. Start the API Client
```bash
cd api-client
./gradlew bootRun
```

The client will start on port 8081.

## Testing the Application
Once both applications are running:

1. Access the client application at http://localhost:8081/books
2. The client application will display books retrieved from the server
3. You can test resilience patterns by stopping the server application and observing how the client handles the failure

## Configuration
The resilience patterns are configured in the client's `application.properties` file. Key configurations include:

- Circuit breaker settings
- Retry settings with exponential backoff
- Bulkhead concurrency limits
- Timeout settings

## Monitoring
The application exposes Actuator endpoints for monitoring the health and status of the resilience patterns:

- http://localhost:8081/actuator/health
- http://localhost:8081/actuator/circuitbreakers
- http://localhost:8081/actuator/retries
- http://localhost:8081/actuator/bulkheads
