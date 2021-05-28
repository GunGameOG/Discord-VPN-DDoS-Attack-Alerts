# Discord DDoS Notification
Discord VPN DDoS Attack Alerts

This script sends a notification to discord using a webhook when a DDos attack is detected on your Dedicated or VPS server. It was written in ShellScript so it will work linux execution environments.

# How to start using script

Step 1. Head over to Discord and create a new webhook in a server and channel of your choice.

Step 2. Download the discordalerts.sh and discord.service edit any lines of code in discordalerts like the Alert message, Location or host to your liking then save your changes.

Step 3. Use an FTP client to transfer the discordalerts.sh in to your root folder.

Step 4. 

Step 5. Open your SSH terminal and run the following commands. 

# Commands to run in your SSH terminal
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install tcpdump -y

sudo apt-get install dos2unix -y

sudo apt-get install curl -y

sudo apt-get install screen -y

#
