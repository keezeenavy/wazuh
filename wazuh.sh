#!/bin/bash


# set up wazuh agent
read -t 10 -p "Do you want to set wazuh agent? (y/n): " WAZUH
if [ "$WAZUH" == "y" ]; then
    read -p "Enter Agent Name: " AGENTNAME
    wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.3-1_amd64.deb && sudo WAZUH_MANAGER='192.168.1.77' WAZUH_AGENT_GROUP='default' WAZUH_AGENT_NAME='${AGENTNAME}' dpkg -i ./wazuh-agent_4.7.3-1_amd64.deb
    systemctl daemon-reload
    systemctl enable wazuh-agent
    systemctl start wazuh-agent
fi


# End notification
echo Done
exit 0
