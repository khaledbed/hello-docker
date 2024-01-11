#!/bin/bash
# Docker Swarm

# Step 1: Introduction to Docker Swarm
echo "Step 1: Introduction to Docker Swarm"
echo "Docker Swarm is a native clustering and orchestration solution for Docker. It allows you to create and manage a swarm of Docker nodes."

# Step 2: Initializing a Docker Swarm
echo "Step 2: Initializing a Docker Swarm"
docker swarm init --advertise-addr <manager_node_ip>

# Step 3: Joining Nodes to the Swarm
echo "Step 3: Joining Nodes to the Swarm"
echo "Run the command provided by 'docker swarm init' on worker nodes to join them to the swarm."

# Step 4: Viewing Swarm Nodes
echo "Step 4: Viewing Swarm Nodes"
docker node ls

# Step 5: Deploying a Service in the Swarm
echo "Step 5: Deploying a Service in the Swarm"
docker service create --name my_web_app -p 8080:80 nginx:latest

# Step 6: Scaling a Service in the Swarm
echo "Step 6: Scaling a Service in the Swarm"
docker service scale my_web_app=3

# Step 7: Inspecting a Service in the Swarm
echo "Step 7: Inspecting a Service in the Swarm"
docker service ps my_web_app

# Step 8: Updating a Service in the Swarm
echo "Step 8: Updating a Service in the Swarm"
docker service update --image nginx:alpine my_web_app

# Step 9: Rolling Back a Service Update
echo "Step 9: Rolling Back a Service Update"
docker service update --rollback my_web_app

# Step 10: Removing a Service from the Swarm
echo "Step 10: Removing a Service from the Swarm"
docker service rm my_web_app

# Step 11: Leaving the Swarm
echo "Step 11: Leaving the Swarm (on worker nodes)"
docker swarm leave

# Step 12: Cleanup - Removing Docker Swarm (on manager node)
echo "Step 12: Cleanup - Removing Docker Swarm (on manager node)"
docker swarm leave --force
echo "---------------------------------------------"

# Docker Swarm Advanced Features

# Step 1: Introduction to Advanced Docker Swarm Features
echo "Step 1: Introduction to Advanced Docker Swarm Features"
echo "Explore advanced features and configurations in Docker Swarm for more sophisticated container orchestration."

# Step 2: Configuring Swarm Networking
echo "Step 2: Configuring Swarm Networking"
echo "Define custom overlay networks for better service communication."
echo "Example command: docker network create --driver overlay my_overlay_network"

# Step 3: Deploying Services on Specific Nodes
echo "Step 3: Deploying Services on Specific Nodes"
echo "Use constraints to deploy services on specific nodes."
echo "Example command: docker service create --name my_service --constraint 'node.hostname == node1' my_image"

# Step 4: Global Services in the Swarm
echo "Step 4: Global Services in the Swarm"
echo "Deploy a service on every available node in the swarm."
echo "Example command: docker service create --name global_service --mode global my_image"

# Step 5: Secrets Management in Swarm
echo "Step 5: Secrets Management in Swarm"
echo "Securely manage sensitive information in the swarm using secrets."
echo "Example command: echo 'my_secret' | docker secret create my_secret_data -"

# Step 6: Configs Management in Swarm
echo "Step 6: Configs Management in Swarm"
echo "Manage configuration files for your services in the swarm."
echo "Example command: echo 'config_value' | docker config create my_config_data -"

# Step 7: Health Checks for Services
echo "Step 7: Health Checks for Services"
echo "Define health checks to monitor and automatically recover services."
echo "Example snippet:"
echo "```
services:
  my_service:
    image: my_image
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost"]
      interval: 30s
      timeout: 10s
      retries: 3
```"

# Step 8: Rolling Updates with Health Checks
echo "Step 8: Rolling Updates with Health Checks"
echo "Perform rolling updates for services with health checks."
echo "Example command: docker service update --update-parallelism 1 --update-delay 10s my_service"

# Step 9: Service Logs and Inspecting Tasks
echo "Step 9: Service Logs and Inspecting Tasks"
echo "View service logs and inspect running tasks in the swarm."
echo "Example command: docker service logs my_service"

# Step 10: Cleanup - Removing Networks, Secrets, and Configs
echo "Step 10: Cleanup - Removing Networks, Secrets, and Configs"
docker network rm my_overlay_network
docker secret rm my_secret_data
docker config rm my_config_data
echo "---------------------------------------------"


