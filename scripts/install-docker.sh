sudo apt-get update

echo "Update Done!"

# sudo apt install apt-transport-https ca-certificates curl software-properties-common
 
sudo apt-get install ca-certificates curl gnupg lsb-release -y
	
echo "Certificates Installed!"

sudo mkdir -p /etc/apt/keyrings

echo "keyrings dir made!"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "gpg Imported!"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
echo "Docker-list Added to Update List!"

sudo apt-get update

echo "Update Done!"

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "Docker Installation Done!"

echo "Post-installation steps..."

sudo groupadd docker

echo "Group added!"

sudo usermod -aG docker $USER

echo "user added to docker group!"

sudo docker run hello-world

echo "Docker is working!"

sudo systemctl enable docker.service

echo "docker.service enabled!"

sudo systemctl enable containerd.service

echo "containerd.service enabled!"
echo "Finished!"
