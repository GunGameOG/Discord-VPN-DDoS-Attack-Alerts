# Discord DDoS Notification

[D]DoS Notifications sent to your Discord Server from your Dedicated Server, VPS or Discord Bot.

This script sends a notification to discord using a webhook when a DDos attack is detected on your Dedicated Server or VPS server. It was written in ShellScript so it will work with linux execution environments.

# How to start using script

Step 1. Head over to Discord and create a new webhook in a server and channel of your choice.

Step 2. Download the discordalerts.sh and discord.service. You can edit any lines in discordalerts.sh such as the Alert message, Location or host to your liking then save your changes.

Step 3. Use an FTP client to place discordalerts.sh into /root and place discord.service into /etc/systemd/system.

- Move discord.service to Systemd run mv /root/discord.service /etc/systemd/system/discord.service
- Create a dumps folder for pcaps
- 
# Commands

Step 4. Open your SSH terminal and run the following commands. 

  sudo apt-get update && sudo apt-get upgrade -y

  sudo apt-get install tcpdump -y

  sudo apt-get install dos2unix -y

  sudo apt-get install curl -y

  sudo apt-get install screen -y
  
  systemctl daemon-reload
  
  systemctl start discord
  
  systemctl enable discord

  service discord start && service discord status
  
  
# Screenshots

Discord

![alt tag](https://github.com/GunGameOG/Discord-VPN-DDoS-Attack-Alerts/blob/master/AlertPrevDiscord.PNG "Discord")

Guilded

![alt tag](https://github.com/GunGameOG/Discord-VPN-DDoS-Attack-Alerts/blob/master/AlertPrevGuilded.PNG "Guilded")

# Need help?

Discord GunGameOG#9082

Discord Server https://verify.guildre.store/#/oggamingnetwork

# Server Hosting

Galaxy Gate - https://galaxygate.net

- DDoS Protection
- Web Hosting
- Dedicated Servers
- Virtual Servers
- Domains

# Enjoy 
