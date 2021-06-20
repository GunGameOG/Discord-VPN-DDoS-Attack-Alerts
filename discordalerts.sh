echo -e "\033[32;5mStarting Attack Logs \033[0m"
interface=eth0
dumpdir=/root/TCPDumps
capturefile=/root/TCPDumps
 url='https://discord.com/api/webhooks/847722211170189313/ENqLj9Hn9K22vFsI9T97_TJdfRPpAC7xk5ZLRb322CS9dhCETjYWRN12dsFbi7Ob0aQ4' ## Change this to your Webhook URL
while /bin/true; do
  pkt_old=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  sleep 1
  pkt_new=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
 
  pkt=$(( $pkt_new - $pkt_old ))
  echo -ne "\r$pkt packets/s\033[0K"
  ## tcpdump -n -s0 -c 1000 -w $dumpdir/dump.`date +"%Y%m%d-%H%M%S"`.cap
  ## echo "Detecting Attack Packets"
  ## sleep 1
  if [ $pkt -gt 30000 ]; then ## Attack alert will display after incoming traffic reach 30000 PPS
    echo "Attack Detected"
    curl -H "Content-Type: application/json" -X POST -d '{
      "embeds": [{
      	"inline": false,
        "title": "Attack Detected",
        "username": "Galaxy Gate Attack Alerts",
        "color": 15158332,
         "thumbnail": {
          "url": "https://imgur.com/a/cZAa3Pu.gif"
        },
         "footer": {
            "text": "New York, US",
            "icon_url": "https://cdn.countryflags.com/thumbs/united-states-of-america/flag-800.png"
          },
    
        "description": "Detection of an attack ",
         "fields": [
      {
        "name": "**Server Provider**",
        "value": "Galaxy Gate Hosting",
        "inline": false
      },
      {
        "name": "**IP Address**",
        "value": "144.172.67.x",
        "inline": false
      },
      {
        "name": "**Location**",
        "value": "Staten Island, New York",
        "inline": false
      }
    ]
      }]
    }' $url
    echo "Paused for."
    sleep 220  ## The "Attack no longer detected" alert will display in 220 seconds
    ## echo "Traffic Attack Packets Scrubbed"
    curl -H "Content-Type: application/json" -X POST -d '{
      "embeds": [{
      	"inline": false,
        "title": "Attack Filtered",
        "username": "Galaxy Gate Attack Alerts",
        "color": 3066993,
         "thumbnail": {
          "url": "https://imgur.com/a/1YNwLCo.gif"
        },
         "footer": {
            "text": "New York, US",
            "icon_url": "https://cdn.countryflags.com/thumbs/united-states-of-america/flag-800.png"
          },    
          
        "description": "End of attack",
         "fields": [
      {
        "name": "**Server Provider**",
        "value": "Galaxy Gate Hosting",
        "inline": false
      },
      {
        "name": "**IP Address**",
        "value": "144.172.67.x",
        "inline": false
      },
      {
        "name": "**Location**",
        "value": "Staten Island, New York",
        "inline": false
      }
    ]
      }]
    }' $url
  fi
done
