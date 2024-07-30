#!/bin/bash

# Download and install the Elasticsearch GPG key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Install apt-transport-https
sudo apt-get update
sudo apt-get install -y apt-transport-https

# Add the Kibana repository to the sources list
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# Update the package list
sudo apt-get update

# Install Kibana
sudo apt-get install -y kibana

# Enable the Kibana service to start on boot
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service

# Start the Kibana service
sudo systemctl start kibana.service

# Confirm Kibana is running
sudo systemctl status kibana.service
