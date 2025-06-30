#!/bin/bash

# Wazuh Agent Installation Script for Linux

# Update and install required packages
echo "Updating system and installing required dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl apt-transport-https lsb-release -y

# Add the Wazuh repository
echo "Adding Wazuh repository..."
curl -s https://packages.wazuh.com/4.5/wazuh-key.gpg | sudo apt-key add -
echo "deb https://packages.wazuh.com/4.5/apt/ stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list


# Install Wazuh agent
echo "Installing Wazuh agent..."
sudo apt update -y
sudo apt install wazuh-agent -y

# Ask for the Wazuh Manager IP
echo "Please enter the IP address of your Wazuh Manager:"
read -p "Wazuh Manager IP: " manager_ip

# Update the Wazuh agent configuration file
echo "Configuring the Wazuh agent to connect to the Wazuh Manager..."
sudo sed -i "s|<server>127.0.0.1</server>|<server>${manager_ip}</server>|" /var/ossec/etc/ossec.conf

# Start the Wazuh agent
echo "Starting Wazuh agent..."
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

# Check the status of the Wazuh agent
echo "Checking Wazuh agent status..."
sudo systemctl status wazuh-agent

# Output instructions
echo "Wazuh agent installation is complete. The agent is now configured to connect to the Wazuh Manager at ${manager_ip}."
echo "You can verify the agent's status by running: sudo systemctl status wazuh-agent"
