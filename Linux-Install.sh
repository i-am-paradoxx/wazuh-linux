#!/bin/bash
# install_wazuh_agent.sh – Installs Wazuh Agent with user-provided manager IP

# Prompt user for Wazuh Manager IP
read -rp "Enter your Wazuh Manager IP: " WAZUH_MANAGER

# Download and install the agent
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.4-1_amd64.deb && \
sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent.deb
