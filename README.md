# Wazuh

# Wazuh Manager And Dashboard
currently Wazuh supports the following operating system versions:

- Ubuntu 16.04  
- Ubuntu 18.04  
- Ubuntu 20.04  
- Ubuntu 22.04  
- Ubuntu 24.04  
- Red Hat Enterprise Linux 7  
- Red Hat Enterprise Linux 8  
- Red Hat Enterprise Linux 9  
- CentOS 7  
- CentOS 8  
- Amazon Linux 2  
- Amazon Linux 2023  


i will be using Ubuntu 22.04
For Wazuh Managaer and Wazuh Dashboard 

Make sure you have curl install if not then use the following command

```
sudo apt update -y && upgrade -y
sudo apt install curl -y
```

To install Wazuh manager Wazuh Managaer and Wazuh Dashboard on Ubuntu 22.04 use the following command

```
sudo curl -sO https://packages.wazuh.com/4.5/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
```

after running the command wait for few minutes you will be provided with login credential in the following format,

- `User : admin`
- `Password : <ADMIN_PASSWORD>`

Access the Wazuh web interface with your admin user credentials. 
This is the default administrator account for the Wazuh indexer and it allows you to access the Wazuh dashboard.
You can access the dashboard by navigating to:
- https://<WAZUH_DASHBOARD_IP_ADDRESS>
or 
- https://localhost

# Wazuh-agent
Wazuh agents are software components installed on the endpoints or end devices (servers, workstations, cloud instances, etc.) you want to monitor. 
They collect security data and log information from the host system and send it to the Wazuh Manager for analysis and further processing.

Download and excute the following script

```
sudo curl -s https://raw.githubusercontent.com/iamsinnerr/wazuhh/main/Linux-Install.sh | sudo bash
```


visit [Wazuh Documentaion](https://documentation.wazuh.com/current/getting-started/index.html) for more details.
