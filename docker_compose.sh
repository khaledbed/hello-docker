#!/bin/bash
# Docker Compose

# Step 1: Introduction to Docker Compose
echo "Step 1: Introduction to Docker Compose"
echo "Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file to configure the application's services, networks, and volumes."

# Step 2: Installing Docker Compose
echo "Step 2: Installing Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Step 3: Creating a Docker Compose File
echo "Step 3: Creating a Docker Compose File"
touch docker-compose.yml
echo "Open docker-compose.yml in a text editor and define your multi-container application."

# Step 4: Example Docker Compose File
echo "Step 4: Example Docker Compose File"
echo "```
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - '8080:80'
  database:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: examplepassword
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    volumes:
      - db_data:/var/lib/mysql
volumes:
  db_data:
```"

# Step 5: Running Containers with Docker Compose
echo "Step 5: Running Containers with Docker Compose"
docker-compose up -d

# Step 6: Viewing Running Containers
echo "Step 6: Viewing Running Containers"
docker-compose ps

# Step 7: Stopping and Removing Containers
echo "Step 7: Stopping and Removing Containers"
docker-compose down

# Step 8: Cleanup - Removing Docker Compose
echo "Step 8: Cleanup - Removing Docker Compose"
sudo rm /usr/local/bin/docker-compose
echo "---------------------------------------------"


# Docker Compose Advanced Usage

# Step 1: Introduction to Advanced Docker Compose Usage
echo "Step 1: Introduction to Advanced Docker Compose Usage"
echo "Explore advanced features and configurations in Docker Compose for complex multi-container applications."

# Step 2: Environment Variables in Docker Compose
echo "Step 2: Environment Variables in Docker Compose"
echo "Define environment variables in your Docker Compose file to customize container behavior."
echo "Example snippet:"
echo "```
services:
  web:
    image: nginx:latest
    environment:
      MY_VARIABLE: my_value
```"

# Step 3: Scaling Services with Docker Compose
echo "Step 3: Scaling Services with Docker Compose"
echo "Scale a service to run multiple instances."
echo "Example command: docker-compose up -d --scale web=3"

# Step 4: Dependency and Health Check
echo "Step 4: Dependency and Health Check"
echo "Define dependencies and health checks between services."
echo "Example snippet:"
echo "```
services:
  web:
    image: nginx:latest
    depends_on:
      - database
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 30s
      timeout: 10s
      retries: 3
  database:
    image: mysql:latest
```"

# Step 5: Configuring Volumes in Docker Compose
echo "Step 5: Configuring Volumes in Docker Compose"
echo "Define volumes with specific configurations."
echo "Example snippet:"
echo "```
services:
  web:
    image: nginx:latest
    volumes:
      - data_volume:/app/data
volumes:
  data_volume:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /path/on/host
```"

# Step 6: Docker Compose Networking
echo "Step 6: Docker Compose Networking"
echo "Customize networking configurations for your services."
echo "Example snippet:"
echo "```
services:
  web:
    image: nginx:latest
    networks:
      - frontend
networks:
  frontend:
    driver: bridge
```"

# Step 7: Using Docker Compose Overrides
echo "Step 7: Using Docker Compose Overrides"
echo "Create separate override files for different environments."
echo "Example command: docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d"

# Step 8: Cleanup - Removing Docker Compose and Volumes
echo "Step 8: Cleanup - Removing Docker Compose and Volumes"
docker-compose down -v
echo "---------------------------------------------"

# Docker Compose Advanced Configuration

# Step 1: Introduction to Docker Compose Advanced Configuration
echo "Step 1: Introduction to Docker Compose Advanced Configuration"
echo "Explore advanced configuration options and features in Docker Compose to optimize and customize your application deployments."

# Step 2: Using External Compose Files
echo "Step 2: Using External Compose Files"
echo "Organize your Docker Compose configurations by using external files."
echo "Example command (in main docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    ports:
      - 8080:80
  db:
    image: postgres:latest
  ...
x-common-configuration: &common-configuration
  networks:
    - frontend
    - backend

networks:
  frontend:
  backend:
---
version: '3'
services:
  web:
    <<: *common-configuration
  ...
```"

# Step 3: Environment Variables in Docker Compose
echo "Step 3: Environment Variables in Docker Compose"
echo "Use environment variables in your Docker Compose file for dynamic and flexible configurations."
echo "Example command (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    environment:
      - NODE_ENV=production
      - API_KEY=my_secret_key
  ...
```"

# Step 4: Conditional Configuration with Docker Compose
echo "Step 4: Conditional Configuration with Docker Compose"
echo "Leverage conditionals and external tools to control the behavior of your Docker Compose configurations."
echo "Example command (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    command: |
      bash -c 'if [ \"$DEBUG\" == \"true\" ]; then echo \"Debug mode enabled\"; else echo \"Debug mode disabled\"; fi'
  ...
```"

# Step 5: Docker Compose Overrides
echo "Step 5: Docker Compose Overrides"
echo "Use override files to define configuration changes for specific environments or use cases."
echo "Example command (for development override in docker-compose.override.yml):"
echo "```
services:
  web:
    ports:
      - 8081:80
  ...
```"

# Step 6: Sharing Volumes Across Services
echo "Step 6: Sharing Volumes Across Services"
echo "Share volumes between services for persistent data storage and sharing."
echo "Example command (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    volumes:
      - shared_data:/app/data
  db:
    image: postgres:latest
    volumes:
      - shared_data:/var/lib/postgresql/data
volumes:
  shared_data:
```"

# Step 7: Configuring Resource Constraints
echo "Step 7: Configuring Resource Constraints"
echo "Set resource constraints for services in Docker Compose to control CPU and memory usage."
echo "Example command (in docker-compose.yml):"
echo "```
services:
  web:
    image: nginx:latest
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
  ...
```"

# Step 8: Cleanup - Removing Docker Compose Configurations
echo "Step 8: Cleanup - Removing Docker Compose Configurations"
docker-compose down
echo "---------------------------------------------"

