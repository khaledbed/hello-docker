#!/bin/bash
# Dockerfile and Containerization and Docker Networking

# Step 1: Introduction to Dockerfile and Containerization
echo "Step 1: Introduction to Dockerfile and Containerization"
echo "Dockerfile is a script that contains instructions for building a Docker image. It allows you to automate the process of creating custom images."

# Step 2: Creating a Dockerfile
echo "Step 2: Creating a Dockerfile"
touch Dockerfile
echo "Open the Dockerfile in a text editor and add instructions for building your custom image."
echo "Example Dockerfile:"
echo "```
FROM ubuntu:latest
LABEL maintainer='Your Name <your.email@example.com>'
RUN apt-get update && apt-get install -y \
    package1 \
    package2
COPY . /app
WORKDIR /app
CMD [\"./your_script.sh\"]
```"

# Step 3: Building an Image from a Dockerfile
echo "Step 3: Building an Image from a Dockerfile"
docker build -t my_custom_image:latest .

# Step 4: Running a Container from the Custom Image
echo "Step 4: Running a Container from the Custom Image"
docker run -it my_custom_image:latest

# Step 5: Publishing the Custom Image to Docker Hub
echo "Step 5: Publishing the Custom Image to Docker Hub"
echo "Ensure you have a Docker Hub account and are logged in."
docker tag my_custom_image:latest username/my_custom_image:latest
docker push username/my_custom_image:latest

# Step 6: Cleaning Up Unused Images and Containers
echo "Step 6: Cleaning Up Unused Images and Containers"
docker container prune -f
docker image prune -a -f
echo "---------------------------------------------"

# Docker Volumes and Persistent Data

# Step 1: Introduction to Docker Volumes
echo "Step 1: Introduction to Docker Volumes"
echo "Docker volumes provide a way to persist data across container instances. They can be used to share data between containers and with the host."

# Step 2: Creating a Docker Volume
echo "Step 2: Creating a Docker Volume"
docker volume create my_volume

# Step 3: Listing Docker Volumes
echo "Step 3: Listing Docker Volumes"
docker volume ls

# Step 4: Running a Container with a Volume
echo "Step 4: Running a Container with a Volume"
docker run -it -v my_volume:/data --name container_with_volume ubuntu:latest
echo "Inside the container, create or modify files in /data. They will be persisted in the volume."

# Step 5: Mounting a Host Directory as a Volume
echo "Step 5: Mounting a Host Directory as a Volume"
docker run -it -v /host/path:/container/path --name container_with_host_volume ubuntu:latest
echo "Files in /host/path on the host will be accessible in /container/path within the container."

# Step 6: Inspecting a Container's Volumes
echo "Step 6: Inspecting a Container's Volumes"
docker inspect container_with_volume | grep Source

# Step 7: Removing a Docker Volume
echo "Step 7: Removing a Docker Volume"
docker volume rm my_volume

# Step 8: Cleanup - Stopping and Removing Containers
echo "Step 8: Cleanup - Stopping and Removing Containers"
docker stop container_with_volume container_with_host_volume
docker rm container_with_volume container_with_host_volume
echo "---------------------------------------------"


# Docker Networking

# Step 1: Introduction to Docker Networking
echo "Step 1: Introduction to Docker Networking"
echo "Docker provides networking features to allow communication between containers and with the external world."

# Step 2: Listing Docker Networks
echo "Step 2: Listing Docker Networks"
docker network ls

# Step 3: Creating a Docker Bridge Network
echo "Step 3: Creating a Docker Bridge Network"
docker network create my_bridge_network

# Step 4: Running Containers on a Specific Network
echo "Step 4: Running Containers on a Specific Network"
docker run -it --name container_on_network --network my_bridge_network ubuntu:latest
docker run -it --name another_container_on_network --network my_bridge_network ubuntu:latest

# Step 5: Inspecting a Container's Network
echo "Step 5: Inspecting a Container's Network"
docker inspect container_on_network | grep Networks

# Step 6: Creating a Docker Overlay Network
echo "Step 6: Creating a Docker Overlay Network"
docker network create --driver overlay my_overlay_network

# Step 7: Running Services on the Overlay Network
echo "Step 7: Running Services on the Overlay Network"
docker service create --name service_on_overlay --network my_overlay_network alpine ping google.com

# Step 8: Inspecting a Service's Network
echo "Step 8: Inspecting a Service's Network"
docker inspect service_on_overlay | grep Networks

# Step 9: Cleaning Up - Removing Networks and Containers
echo "Step 9: Cleaning Up - Removing Networks and Containers"
docker network rm my_bridge_network my_overlay_network
docker stop container_on_network another_container_on_network
docker rm container_on_network another_container_on_network
docker service rm service_on_overlay
echo "---------------------------------------------"
