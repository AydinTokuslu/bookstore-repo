#! /bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
sudo usermod -a -G docker ec2-user
newgrp docker
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
TOKEN=${var.git-token}
USER=${var.git-name}

cd /home/ec2-user && git clone https://$TOKEN@github.com/$USER/bookstore.git
cd /home/ec2-user/bookstore
docker-compose up -d 

# mkdir -p /home/ec2-user/bookstore
# cd /home/ec2-user/bookstore
# FOLDER="https://$TOKEN@raw.githubusercontent.com/$USER/bookstore-repo/main/" 
# curl -s -o docker-compose.yml -L "$FOLDER"docker-compose.yml
# docker-compose up -d
