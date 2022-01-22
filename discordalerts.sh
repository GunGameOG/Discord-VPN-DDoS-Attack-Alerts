echo -e "Discord-VPN-DDoS-Attack-Alerts Software coded by GunGameOG"
echo
echo "If you need any assistence configuring or adding the notify message GunGameOG#9082 on discord for help."
echo
echo -e "033[97mPackets/s \033[36m{}\n\033[97mBytes/s \033[36m{}\n\033[97mKbp/s \033[36m{}\n\033[97mGbp/s \033[36m{}\n\033[97mMbp/s \033[36m{}"
interface=eth0
dumpdir=/root/dumps
url='WEBHOOK HERE' ## Change this to your Webhook URL
while /bin/true; do
  old_b=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $1 }'`
  
  old_ps=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  sleep 1
  new_b=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $1 }'`

  new_ps=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  ##Defining Packets/s
  pps=$(( $new_ps - $old_ps ))
  ##Defining Bytes/s
  byte=$(( $new_b - $old_b ))

  gigs=$(( $byte/1024 ** 3 ))
  mbps=$(( $byte/1024 ** 2 ))
  kbps=$(( $byte/1024 ** 1 ))

  echo -ne "\r$pps packets/s\033[0K"
  tcpdump -n -s0 -c 1500 -w $dumpdir/capture.`date +"%Y%m%d-%H%M%S"`.pcap
  echo "`date` Detecting Attack Packets."
  sleep 1
  if [ $pps -gt 10000 ]; then ## Attack alert will display after incoming traffic reach 30000 PPS
    echo " Attack Detected Monitoring Incoming Traffic"
    curl -H "Content-Type: application/json" -X POST -d '{
      "embeds": [{
      	"inline": false,
        "title": "Attack Detected On",
        "username": "Attack Alerts",
        "color": 15158332,
         "thumbnail": {
          "url": "https://imgur.com/a/cZAa3Pu"
        },
         "footer": {
            "text": "Our system is attempting to mitigate the attack and automatic packet dumping has been activated.",
            "icon_url": "https://cdn.countryflags.com/thumbs/united-states-of-america/flag-800.png"
          },
    
        "description": "Detection of an attack ",
         "fields": [
      {
        "name": "**Server Provider**",
        "value": "OVH LLC",
        "inline": false
      },
      {
        "name": "**IP Address**",
        "value": "x.x.x.x",
        "inline": false
      },
      {
        "name": "**Incoming Packets**",
        "value": " '$pps' Pps ",
        "inline": false
      }
    ]
      }]
    }' $url
    echo "Paused for."
    sleep 120  && pkill -HUP -f /usr/sbin/tcpdump  ## The "Attack no longer detected" alert will display in 220 seconds
    ## echo "Traffic Attack Packets Scrubbed"
    echo -ne "\r$mbps megabytes/s\033[97"
    curl -H "Content-Type: application/json" -X POST -d '{
      "embeds": [{
      	"inline": false,
        "title": "Attack Stopped",
        "username": "  Attack Alerts",
        "color": 3066993,
         "thumbnail": {
          "url": "https://imgur.com/a/1YNwLCo.gif"
        },
         "footer": {
            "text": "Reston, VA",
            "icon_url": "https://cdn.countryflags.com/thumbs/united-states-of-america/flag-800.png"
          },    
          
        "description": "End of attack",
         "fields": [
      {
        "name": "**Server Provider**",
        "value": "OVH LLC",
        "inline": false
      },
      {
        "name": "**IP Address**",
        "value": "x.x.x.x",
        "inline": false
      },
      {
        "name": "**Packets**",
        "value": "'$mbps' Mbps ",
        "inline": false
      }
    ]
      }]
    }' $url
  fi
done
