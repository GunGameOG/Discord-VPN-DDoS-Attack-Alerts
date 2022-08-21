# Discord DDoS Notification

[D]DoS Notifications sent to your Discord Server from your Dedicated Server, VPS or Discord Bot.

This script sends a notification to discord using a webhook when a DDos attack is detected on your Dedicated Server or VPS server. It was written in Shell Script so it will work with linux execution environments.

# How to start using script

Step 1. Head over to Discord and create a new webhook in a server and channel of your choice.

Step 2. Download the discordalerts.sh and discord.service. You can edit any lines in discordalerts.sh such as the Alert message, Location or host to your liking then save your changes.

Step 3. Use an FTP client to place discordalerts.sh into /root and place discord.service into /etc/systemd/system.


   Move discord.service to Systemd run 
      
      mv /root/discord.service /etc/systemd/system/discord.service
 
   Create a "dumps" folder for PCAPS run 
      
      mkdir /root/dumps

# Commands

Step 4. # Open your SSH terminal and run the following commands. 

    apt-get update && sudo apt-get upgrade -y

    systemctl daemon-reload
  
    systemctl start discord
 
    systemctl enable discord

    service discord start && service discord status
  
# The results after you enter step 4. commands

    root@chivpn1:~# service discord start && service discord status
    ● discord.service - Traffic Alert System
     Loaded: loaded (/etc/systemd/system/discord.service; enabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-08-19 20:42:36 CDT; 59min ago
        Main PID: 149923 (bash)
        Tasks: 2 (limit: 2304)
        Memory: 3.5M
        CGroup: /system.slice/discord.service
             ├─149923 /bin/bash discord.sh
             └─150941 sleep 300

    Aug 19 21:33:42 chivpn1 bash[149923]: [21B blob data]
    Aug 19 21:33:42 chivpn1 bash[150901]: Running as user "root" and group "root". This could be danger>
    Aug 19 21:33:42 chivpn1 bash[150901]: Capturing on 'eth0'
    Aug 19 21:34:00 chivpn1 bash[150901]: 300 packets captured
    Aug 19 21:34:00 chivpn1 bash[149923]: Fri 19 Aug 2022 09:34:00 PM CDT Detecting Attack Packets.
    Aug 19 21:39:00 chivpn1 bash[149923]:  Attack Detected Monitoring Incoming Traffic
    Aug 19 21:39:00 chivpn1 bash[150939]:   % Total    % Received % Xferd  Average Speed   Time    Time>
    Aug 19 21:39:00 chivpn1 bash[150939]:                                  Dload  Upload   Total   Spen>
    Aug 19 21:39:00 chivpn1 bash[150939]: [158B blob data]
    Aug 19 21:39:00 chivpn1 bash[149923]: Paused for.
    
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
