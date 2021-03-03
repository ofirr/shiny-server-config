#! /bin/bash

# Run on mcluster 04 in order to upload shiny-server image. 
# We need it since we weren't able to build the image in the DMZ server

rsync -r shiny-server.tar.gz shiny@10.150.4.18:/home/shiny/images/
rsync -r nginx.tar.gz shiny@10.150.4.18:/home/shiny/images/