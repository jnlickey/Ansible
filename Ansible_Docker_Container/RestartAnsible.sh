#!/bin/bash
cd /docker-services/ansible
docker-compose down --remove-orphans && docker-compose up -d
source ~/.bashrc
