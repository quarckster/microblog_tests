#!/bin/bash

function install_docker() {
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker `whoami`
}

function install_docker_compose() {
    curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

function install_vnc_viewer() {
    apt install -y tigervnc-viewer
}

function install_virtual_env() {
    virtualenv -p python3 $HOME/test_venv
    $HOME/test_venv/bin/python setup.py install
    $HOME/test_venv/bin/pip install jupyter
}

function run_docker_compose() {
    docker-compose up
}

function open_vncviewer() {
    tigervnc-viewer localhost:5900
}

install_docker
install_docker_compose
install_vnc_viewer
install_virtual_env
run_docker_compose
