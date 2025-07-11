#!/bin/bash
# install_wazuh_agent_clean.sh – Clean install of Wazuh Agent (removes manager/agent if present)

read -rp "Enter your Wazuh Manager IP: " WAZUH_MANAGER_IP < /dev/tty
# Ask user for Wazuh Agent Name
read -rp "Enter a name for this Wazuh Agent Make sure the user name is Unique: " WAZUH_AGENT_NAME < /dev/tty

echo "Checking for existing Wazuh packages..."


# Remove existing Wazuh Agent if found
if dpkg -l | grep -qw wazuh-agent; then
    echo "Wazuh Agent detected. Removing..."
    sudo systemctl stop wazuh-agent
    sudo systemctl disable wazuh-agent
    sudo dpkg --purge wazuh-agent
    echo "Wazuh Agent removed."
fi

# Remove existing Wazuh Manager if found
if dpkg -l | grep -qw wazuh-manager; then
    echo "Wazuh Manager detected. Removing..."
    sudo systemctl stop wazuh-manager
    sudo systemctl disable wazuh-manager
    sudo dpkg --purge wazuh-manager
    echo "Wazuh Manager removed."
fi

# Download latest supported Wazuh Agent package
echo "[*] Downloading Wazuh Agent .deb..."
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.4-1_amd64.deb && sudo WAZUH_MANAGER="$WAZUH_MANAGER_IP" WAZUH_AGENT_NAME="$WAZUH_AGENT_NAME" dpkg -i ./wazuh-agent.deb
# Download latest supported Wazuh Agent package
#echo "[*] Downloading Wazuh Agent .deb..."
#curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.4-1_amd64.deb && sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP="default" dpkg -i ./wazuh-agent.deb

# Enable and start the agent
echo "Enabling and starting Wazuh Agent..."
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

echo "Wazuh Agent installed and connected to $WAZUH_MANAGER_IP"

