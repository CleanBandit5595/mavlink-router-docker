# Helper script to build and push image to Gitlab Registry.
sudo docker login registry.gitlab.com

sudo docker build -t registry.gitlab.com/amadoruavs/mavlink-router-docker .
sudo docker push registry.gitlab.com/amadoruavs/mavlink-router-docker
