#!/bin/bash
mkdir /root/usr && mkdir /root/usr/bin && echo 'PATH="/root/usr/bin:$PATH"' >> .bashrc
PATH="/root/usr/bin:$PATH"

echo '#!/bin/bash
#
#https://docs.docker.com/engine/install/debian/
#https://docs.docker.com/compose/install/
#
apt-get update -y
#
apt-get install ca-certificates curl gnupg lsb-release -y
#
mkdir -p /etc/apt/keyrings
#
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
#
apt-get update -y
#
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
#
docker run hello-world
#
' > /root/usr/bin/olysoft-install-docker.sh

chmod o+x /root/usr/bin/olysoft-install-docker.sh

systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service

mkdir docker-pods
mkdir docker-pods/pihole

echo -n 'version: "3"

# More info at https://github.com/pi-hole/docker-pi-hole/ and https://docs.pi-hole.net/
services:
  pihole:
    container_name: pihole
    image: pihole/pihole:latest
    # For DHCP it is recommended to remove these ports and instead add: network_mode: "host"
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "80:80/tcp"
    environment:
      TZ: ' > docker-pods/pihole/docker-compose.yaml
echo "'America/LosAngeles'
    # WEBPASSWORD: 'open-source-the-thing'
    # Volumes store your data between container upgrades
    volumes:
      - './etc-pihole:/etc/pihole'
      - './etc-dnsmasq.d:/etc/dnsmasq.d'
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    deploy:
      restart_policy:
        condition: any" >> docker-pods/pihole/docker-compose.yaml

sh /root/usr/bin/olysoft-install-docker.sh

cd /root/docker-pods/pihole

docker compose up -d

exit

