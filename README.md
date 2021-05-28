# Discord DDoS Notification
Discord VPN DDoS Attack Alerts

This script sends a notification to discord using a webhook when a DDos attack is detected on your Dedicated or VPS server. It was written in ShellScript so it will work linux execution environments.

# How to start using script

Step 1. Head over to Discord and create a new webhook in a server and channel of your choice.

Step 2. Download the discordalerts.sh and discord.service. You can edit any lines in discordalerts.sh such as the Alert message, Location or host to your liking then save your changes.

Step 3. Use an FTP client to place discordalerts.sh into /root and place discord.service into /etc/systemd/system.

# Commands to run in your SSH terminal

Step 4. Open your SSH terminal and run the following commands. 

  sudo apt-get update && sudo apt-get upgrade -y

  sudo apt-get install tcpdump -y

  sudo apt-get install dos2unix -y

  sudo apt-get install curl -y

  sudo apt-get install screen -y

# Screenshots

Discord Preview

![alt text](Discord-VPN-DDoS-Attack-Alerts/Alert Prev discord.PNG "Discord")

Guilded Preview

![alt text](Discord-VPN-DDoS-Attack-Alerts/Alert prev guilded.PNG "Guilded")

# Enjoy 
