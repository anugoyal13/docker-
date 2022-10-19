#!/bin/bash
# run 'sudo su' before executing this script
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
# if Error: W: GPG error: https://pkg.jenkins.io/debian-stable binary/ Release: 
#The following signatures couldn’t be verified because the public key is not available: NO_PUBKEY 9B7D32F2D50582E6"
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9B7D32F2D50582E6
systemctl start jenkins
systemctl enable jenkins
echo
echo
echo "Copy the string below and paste it to the Jenkins Web page:"
echo
echo
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo
echo
systemctl status jenkins
