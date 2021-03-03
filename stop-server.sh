#!/bin/bash

sudo docker-compose down

sudo chown -R shiny:shiny /home/shiny/apps
sudo chown -R shiny:shiny /home/shiny/logs