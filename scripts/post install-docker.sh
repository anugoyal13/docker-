#!/bin/bash
sudo newgrp docker

sudo docker run hello-world

echo "Done!"

sudo systemctl enable docker.service

echo "docker.service enabled!"

sudo systemctl enable containerd.service

echo "containerd.service enabled!"
echo "Finished!"

# sudo newgrp docker   doesn't work automatically :-(
