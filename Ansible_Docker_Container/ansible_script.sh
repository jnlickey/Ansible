#!/bin/bash
# Function for running Docker commands
function docker_command(){
        if [[ ! $args = 0 ]];then
                docker-compose exec ansible bash -c "${docker_cmd} ${arguments2pass}"
        else
                docker-compose exec ansible bash -c "${docker_cmd}"
        fi
}
# Function for allowing ansible command to be ran
function ansible(){
        docker_cmd="ansible"
        export current_dir=$PWD
        cd /docker-services/ansible
        args=("$@")
        arguments2pass=$(
            n=0
            while [ $n -le $# ];do
               printf "%s " ${args[${n}]}
               n=$(( $n + 1 ))
            done
            echo -ne "\n"
        )
        docker_command $args $docker_cmd $arguments2pass
        cd $current_dir
}
# Function for allowing ansible-playbook command to be ran
function ansible-playbook(){
        docker_cmd="ansible-playbook"
        export CURRENT_DIR=${PWD}
        cd /docker-services/ansible
        args=("$@")

        arguments2pass=$(
            n=0
            while [ $n -le $# ];do
               printf "%s " ${args[${n}]}
               n=$(( $n + 1 ))
            done
            echo -ne "\n"
        )
        docker_command $args $docker_cmd $arguments2pass
        cd ${CURRENT_DIR}
}
# Function to generate ansible.cfg
function ansible-config(){
        docker_cmd="ansible-config"
        export current_dir=$PWD
        cd /docker-services/ansible
        args=("$@")
        arguments2pass=$(
            n=0
            while [ $n -le $# ];do
               printf "%s " ${args[${n}]}
               n=$(( $n + 1 ))
            done
            echo -ne "\n"
        )
        docker_command $args $docker_cmd $arguments2pass
        cd $current_dir
}

