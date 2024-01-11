#!/bin/bash
# Docker first steps

# Step 1: Introduction to Docker
echo "Step 1: Introduction to Docker"
echo "Docker is a platform for developing, shipping, and running applications in containers."
echo "Containers allow you to package an application with its dependencies into a standardized unit."
echo "---------------------------------------------"

# Step 2: Docker Installation
echo "Step 2: Docker Installation"

# Check if Docker is already installed
if command -v docker &> /dev/null
then
    echo "Docker is already installed. Skipping installation."
else
    # Install Docker for Ubuntu
    echo "Installing Docker for Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
        "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Add the current user to the docker group to run Docker without sudo
    sudo usermod -aG docker $USER

    echo "Docker has been installed. Please log out and log back in to apply group changes."
fi

# Step 3: Verify Docker Installation
echo "Step 3: Verify Docker Installation"
docker --version
docker run hello-world
echo "---------------------------------------------"

# Docker Images and Containers

# Step 1: Introduction to Docker Images and Containers
echo "Step 1: Introduction to Docker Images and Containers"
echo "Docker images are lightweight, stand-alone, and executable packages that include everything needed to run a piece of software, including the code, runtime, libraries, and system tools."
echo "Containers are instances of Docker images that can be run as isolated processes on the host machine."

# Step 2: Pulling a Docker Image
echo "Step 2: Pulling a Docker Image"
docker pull ubuntu:latest

# Step 3: Listing Docker Images
echo "Step 3: Listing Docker Images"
docker images

# Step 4: Running a Docker Container
echo "Step 4: Running a Docker Container"
docker run -it --name my_ubuntu_container ubuntu:latest

# Step 5: Inside the Docker Container
echo "Step 5: Inside the Docker Container"
echo "You are now inside the Docker container. Perform any necessary tasks."
echo "To exit the container, use the 'exit' command."

# Step 6: Listing Running Containers
echo "Step 6: Listing Running Containers"
docker ps

# Step 7: Stopping and Removing a Container
echo "Step 7: Stopping and Removing a Container"
docker stop my_ubuntu_container
docker rm my_ubuntu_container

# Step 8: Removing Docker Images
echo "Step 8: Removing Docker Images"
docker rmi ubuntu:latest

# Step 9: Cleaning Up Stopped Containers
echo "Step 9: Cleaning Up Stopped Containers"
docker container prune -f

# Step 10: Cleaning Up Unused Images
echo "Step 10: Cleaning Up Unused Images"
docker image prune -a -f
echo "---------------------------------------------"

# Docker Basic Commands

# Step 1: Introduction to Additional Docker Commands
echo "Step 1: Introduction to Additional Docker Commands"
echo "Explore more basic Docker commands for managing containers and images."

# Step 2: Listing All Containers
echo "Step 2: Listing All Containers"
docker ps -a

# Step 3: Displaying Container Logs
echo "Step 3: Displaying Container Logs"
docker logs <container_id_or_name>

# Step 4: Inspecting a Container
echo "Step 4: Inspecting a Container"
docker inspect <container_id_or_name>

# Step 5: Executing Commands Inside a Running Container
echo "Step 5: Executing Commands Inside a Running Container"
docker exec -it <container_id_or_name> bash

# Step 6: Copying Files Between Host and Container
echo "Step 6: Copying Files Between Host and Container"
docker cp <host_path> <container_id_or_name>:<container_path>
docker cp <container_id_or_name>:<container_path> <host_path>

# Step 7: Pausing and Unpausing a Container
echo "Step 7: Pausing and Unpausing a Container"
docker pause <container_id_or_name>
docker unpause <container_id_or_name>

# Step 8: Restarting a Stopped Container
echo "Step 8: Restarting a Stopped Container"
docker start <container_id_or_name>

# Step 9: Restarting a Running Container
echo "Step 9: Restarting a Running Container"
docker restart <container_id_or_name>

# Step 10: Committing Changes to a Container as a New Image
echo "Step 10: Committing Changes to a Container as a New Image"
docker commit <container_id_or_name> my_custom_image

# Step 11: Tagging and Pushing Images to Docker Hub
echo "Step 11: Tagging and Pushing Images to Docker Hub"
docker tag my_custom_image username/my_custom_image:latest
docker login
docker push username/my_custom_image:latest
echo "---------------------------------------------"
