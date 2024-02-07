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
  ```
     # Add the following line to /home/ansible/.bashrc
     source /docker-services/ansible/ansible-script.sh
  ```
9. Create Ansible inventory on local server in /etc/ansible/hosts, it gets passed into the container. Any changes to the inventory will require the container to be restarted.
  ```
     mkdir /etc/ansible
     vim /etc/ansible/hosts
     # Host entries need to be one per line
     # Various examples:
     # NOTE: Group names are case sensitive
     [Group_Name:children]
     Group1_Name
     Group2_Name

     [Group1_Name]
     server1
     server2 ansible\_host=\<ip\_address\>
     server3 ansible\_host=\<ip\_address\> ansible\_port=\<port\_number\>
 
     [Group2_Name]
     server4 ansible\_host=\<ip\_address\> ansible\_port=\<port\_number\>
   ```
10. Create a directory that will hold all playbooks and roles. Note, the default location for roles is in a directory named "roles" inside the playbook directory. The playbooks directory will get passed into the container on startup, and there is NO NEED to restart the container each time a new playbook is created in the playbooks directory.
  ```
  mkdir /docker-services/ansible/playbooks
  mkdir /docker-services/ansible/playbooks/roles
  ```
11. Start up the ansible container
  ```docker-compose up -d```
12. You now should be able to run the following commands to test the Ansible setup:<\br>
  ```
  ansible -m ping \<server\>
  ansible-playbook hostname.yml [ -l \<server\> | all ]
  ```
