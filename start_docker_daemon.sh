#! /bin/bash
sudo systemctl stop nginx
sudo systemctl stop docker
sudo nohup dockerd &