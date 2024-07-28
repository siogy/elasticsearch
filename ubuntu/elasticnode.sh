#!/bin/bash

# Fetch the Elasticsearch GPG key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Install apt-transport-https
sudo apt-get install -y apt-transport-https

# Add the Elasticsearch APT repository
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# Update package lists and install Elasticsearch
sudo apt-get update && sudo apt-get install -y elasticsearch

# Prompt the user to enter the enrollment token
read -p "Please enter the enrollment token: " enrollment_token

# Reconfigure the Elasticsearch node with the provided enrollment token
sudo /usr/share/elasticsearch/bin/elasticsearch-reconfigure-node --enrollment-token $enrollment_token

echo "Elasticsearch installation and reconfiguration complete."
