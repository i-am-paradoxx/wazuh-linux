#!/bin/bash
# install_or_replace_wazuh_agent.sh – Installs or replaces Wazuh Agent

read -p "Enter your Wazuh Manager IP: " WAZUH_MANAGER

# If wazuh-agent is already installed
if dpkg -l | grep -qw wazuh-agent; then
    echo "[!] Wazuh Agent is already installed."
    echo "[*] Stopping and removing existing agent..."

    sudo systemctl stop wazuh-agent
    sudo systemctl disable wazuh-agent
    sudo dpkg --purge wazuh-agent

    echo "[✔] Existing Wazuh Agent removed."
fi

# Check if Wazuh Manager is installed (conflict)
if dpkg -l | grep -qw wazuh-manager; then
    echo "[⚠️] Wazuh Manager is installed on this system."
    echo "[✖] Cannot install Agent on the same machine. Aborting."
    exit 1
fi

# Download the agent
echo "[*] Downloading Wazuh Agent..."
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.4-1_amd64.deb

# Install agent with environment variables
echo "[*] Installing Wazuh Agent..."
sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP="default" dpkg -i ./wazuh-agent.deb

# Enable and start agent
echo "[*] Enabling and starting Wazuh Agent..."
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

# Cleanup
rm -f wazuh-agent.deb

echo "[✔] Wazuh Agent is now installed and connected to $WAZUH_MANAGER"
