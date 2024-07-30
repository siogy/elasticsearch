#!/bin/bash

# Fetch the Elasticsearch GPG key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Install apt-transport-https
sudo apt-get install -y apt-transport-https

# Add the Elasticsearch APT repository
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# Update package lists and install Elasticsearch
sudo apt-get update && sudo apt-get install -y elasticsearch

# Notify user of successful installation
echo "Elasticsearch has been successfully installed. Please edit the configuration file at /etc/elasticsearch/elasticsearch.yml as needed."

# Optionally, you can start and enable the Elasticsearch service
sudo systemctl enable elasticsearch.service

# Confirm Elasticsearch is running
sudo systemctl status elasticsearch.service
