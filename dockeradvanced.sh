#!/bin/bash
# Docker Multi-Stage Builds

# Step 1: Introduction to Docker Multi-Stage Builds
echo "Step 1: Introduction to Docker Multi-Stage Builds"
echo "Docker Multi-Stage Builds allow you to create smaller and more efficient Docker images by using multiple build stages."

# Step 2: Creating a Basic Multi-Stage Dockerfile
echo "Step 2: Creating a Basic Multi-Stage Dockerfile"
echo "Build a multi-stage Dockerfile to compile source code and create a smaller runtime image."
echo "Example Dockerfile:"
echo "```
# Build Stage
FROM some-builder-image as builder
WORKDIR /app
COPY . .
RUN some-build-command

# Final Stage
FROM some-runtime-image
WORKDIR /app
COPY --from=builder /app/output /app
CMD [\"./my_app\"]
```"

# Step 3: Building and Running the Multi-Stage Docker Image
echo "Step 3: Building and Running the Multi-Stage Docker Image"
echo "Build the multi-stage Dockerfile and run the resulting image."
echo "Example commands:"
echo "docker build -t my_multi_stage_app ."
echo "docker run my_multi_stage_app"

# Step 4: Optimizing Image Size with Multi-Stage Builds
echo "Step 4: Optimizing Image Size with Multi-Stage Builds"
echo "Compare the size of the multi-stage image with a traditional Dockerfile to see the reduction in size."

# Step 5: Using Multi-Stage Builds for Language-specific Apps
echo "Step 5: Using Multi-Stage Builds for Language-specific Apps"
echo "Apply multi-stage builds to different language environments such as Java, Python, or Node.js."

# Step 6: Cleaning up Intermediate Images
echo "Step 6: Cleaning up Intermediate Images"
echo "Remove intermediate images created during the multi-stage build process to save disk space."
echo "Example command: docker image prune -f"

# Step 7: Cleanup - Removing Multi-Stage Docker Image
echo "Step 7: Cleanup - Removing Multi-Stage Docker Image"
docker rmi my_multi_stage_app
echo "---------------------------------------------"

# Docker Compose Advanced Networking

# Step 1: Introduction to Docker Compose Advanced Networking
echo "Step 1: Introduction to Docker Compose Advanced Networking"
echo "Explore advanced networking configurations in Docker Compose to facilitate communication between services and containers."

# Step 2: Customizing Service Networks
echo "Step 2: Customizing Service Networks"
echo "Define custom networks for services to control their communication."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      - frontend
      - backend
networks:
  frontend:
  backend:
```"

# Step 3: Assigning IP Addresses to Containers
echo "Step 3: Assigning IP Addresses to Containers"
echo "Specify static IP addresses for containers in a custom network."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      frontend:
        ipv4_address: 172.18.0.2
networks:
  frontend:
    driver: bridge
    ipam:
      config:
        - subnet: 172.18.0.0/24
```"

# Step 4: Exposing Ports on Specific Interfaces
echo "Step 4: Exposing Ports on Specific Interfaces"
echo "Bind container ports to specific network interfaces for enhanced security."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    ports:
      - '127.0.0.1:8080:80'
networks:
  frontend:
    driver: bridge
```"

# Step 5: Connecting Containers to External Networks
echo "Step 5: Connecting Containers to External Networks"
echo "Attach containers to external networks for communication with non-Dockerized services."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      - frontend
      - external_network
networks:
  frontend:
    driver: bridge
  external_network:
    external: true
```"

# Step 6: Isolating Containers with User-defined Networks
echo "Step 6: Isolating Containers with User-defined Networks"
echo "Create user-defined networks to isolate containers and control their communication."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      - isolated_network
networks:
  isolated_network:
```"

# Step 7: Controlling DNS Options
echo "Step 7: Controlling DNS Options"
echo "Customize DNS options for services within Docker Compose."
echo "Example snippet (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      - frontend
networks:
  frontend:
    driver: bridge
    dns: 8.8.8.8
```"

# Step 8: Cleanup - Removing Docker Compose Networks
echo "Step 8: Cleanup - Removing Docker Compose Networks"
docker-compose down
echo "---------------------------------------------"



