#!/bin/bash

export SHINY_LOG_LEVEL=DEBUG

# chown apps folder
chmod -R 755 /srv/shiny-server/apps
chown -R shiny /srv/shiny-server/apps

# chown logs folder
chown -R shiny /var/log/shiny-server/

# start shiny
shiny-server --pidfile=/var/run/shiny-server.pid