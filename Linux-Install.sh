#!/bin/bash
# install_wazuh_agent_manual.sh

read -rp "Enter the IP address of your Wazuh Manager: " MANAGER_IP

echo "[*] Downloading Wazuh Agent .deb package..."
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.4-1_amd64.deb

echo "[*] Installing Wazuh Agent with Manager IP: $MANAGER_IP"
sudo WAZUH_MANAGER="$MANAGER_IP" WAZUH_AGENT_GROUP="default" dpkg -i ./wazuh-agent.deb

echo "[*] Enabling and starting Wazuh Agent..."
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

echo "[✔] Wazuh Agent installed and connected to manager at $MANAGER_IP"
