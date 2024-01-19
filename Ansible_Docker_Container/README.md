# Ansible Docker Container
1. Setup Docker file store location
  ```mkdir -p /docker-services/ansible```
2. Place all needed Docker files in the file store location
  * Dockerfile
  * docker-compose.yml
3. Verify Docker is installed
  ```docker ps```
4. Download Ubuntu 22.04 Docker Image
  ```docker pull ubuntu:22.04```
5. Build Docker image with ansible installed 
  ```
    cd /docker-services/ansible
    docker build -t ansible:latest .
  ```
6. After build is complete, clean build cache to free up space
  ```sudo docker builder prune --all```
7. Start Docker container via docker-compose
  ```
     cd /docker-services/ansible
     docker-compose up -d
  ```
8. Add ansible function to users /home/$USER/.bashrc file
  * This allows the user to send ad-hoc ansible commands into the docker container and get feedback at the standard server prompt, without needing to login to the container itself.
9. Create Ansible inventory on local server in /etc/ansible/hosts, it gets passed into the container. Any changes to the inventory will require the container to be restarted.
  ```
     mkdir /etc/ansible
     vim /etc/ansible/hosts
  ```
