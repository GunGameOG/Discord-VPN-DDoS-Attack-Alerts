# Discord DDoS Notification

[D]DoS Notifications sent to your Discord Server from your Dedicated Server, VPS or Discord Bot.

This script sends a notification to discord using a webhook when a DDos attack is detected on your Dedicated Server or VPS server. It was written in ShellScript so it will work with linux execution environments.

# How to start using script

Step 1. Head over to Discord and create a new webhook in a server and channel of your choice.

Step 2. Download the discordalerts.sh and discord.service. You can edit any lines in discordalerts.sh such as the Alert message, Location or host to your liking then save your changes.

Step 3. Use an FTP client to place discordalerts.sh into /root and place discord.service into /etc/systemd/system.

- Move detected.service to Systemd run > mv /root/detected.service /etc/systemd/system/detected.service
- Create a dumps folder for pcaps run > mkdir /root/dumps

# Commands

Step 4. # Open your SSH terminal and run the following commands. 

echo "apt-get update && sudo apt-get upgrade -y"

echo "systemctl daemon-reload"
  
echo "systemctl start detected"
  
echo "systemctl enable detected"

echo "service detected start && service detected status"
  
  
# Screenshots

Discord

![alt tag](https://github.com/GunGameOG/Discord-VPN-DDoS-Attack-Alerts/blob/master/AlertPrevDiscord.PNG "Discord")

Guilded

![alt tag](https://github.com/GunGameOG/Discord-VPN-DDoS-Attack-Alerts/blob/master/AlertPrevGuilded.PNG "Guilded")

# Need help?

Discord GunGameOG#9082

Discord Server https://verify.guildre.store/#/oggamingnetwork

# Server Hosting

Galaxy Gate - https://billing.galaxygate.net/aff.php?aff=179

- DDoS Protection
- Web Hosting
- Dedicated Servers
- Virtual Servers
- Domains

# Enjoy 
