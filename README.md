# Tanay Lab shiny server

## Usage

### Start the server

```bash
sudo ./start-server.sh
```

### Stop the server

```bash
sudo ./stop-server.sh
```

### Restart docker daemon

```bash
sudo ./start_docker_daemon.sh
```

> Note that we are not running docker as systemd due to DNS configuration problems.

### Restart the server 

```bash
sudo ./restart-server.sh
```

> Note: if the server does not start this might be due to apache taking port 80. You can stop it by running `sudo systemctl stop apache2`



### Upload app

On mcluster04 (or any other machine within Weizmann):

```bash
./upload_app app_dir app_name
```

### See docker logs

```bash
sudo ./show-logs.sh
```

### See shiny-server logs

Logs are at `/home/shiny/logs`

## Installation

clone the project from github on mcluster04 (or any other machine):

```bash
git clone git@github.com:tanaylab/shiny-server-config.git
```

Build the images and save them:

```bash
docker-compose build
docker save shiny-server | gzip > shiny-server.tar.gz
docker save traefik | gzip > traefik.tar.gz
```

Copy the images to the shiny-server machine: 

```bash
./upload_images.sh
```

Make sure that the docker daemon is running:

```bash
sudo ./start_docker_daemon.sh
```

Load the images: 

```bash
sudo docker load --input /home/shiny/images/shiny-server.tar.gz
sudo docker load --input /home/shiny/images/traefik.tar.gz
```

## Restart

1. Go to `/home/shiny/docker`

2. Start the docker daemon: 

```bash
sudo ./start_docker_daemon.sh
```

3. Run: 

```bash
sudo ./start-server.sh
```

## Architerture 

The server is using docker-compose to start two docker containers - nginx and shiny-server. See the configuration at `docker-compose.yml`. 

Due to DNS problems (we weren't able to make DNS work inside a container) we have to create the shiny-server container outside of the server (e.g. on mcluster04). 

Also, running docker as systemd we weren't able to pull images (probably again due to DNS problems) so we run it in the background with `nohup` (see `start_docker_daemon.sh`).

Apps are served from `/home/shiny/apps` and uploading can be done using `upload_app.sh` script. Note that docker changes the ownership of this directory so this script cannot be run while the server is up. 

We are running multiple instances of shiny-server, and use traefik to balance the load between them. traefik is also used as a reverse proxy. 

### Static sites

Static sites are served in a somewhat hacky way - they need to be under:
/home/shiny/apps/<app_name>/www 

With special server.R file that can be copiend from `static_app_example.R` under /home/shiny/apps/<app_name>.

The sites are then served by shiny-server. 
