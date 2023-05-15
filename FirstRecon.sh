#!/bin/bash

# Check if lolcat Tool is installed.
if command -v lolcat > /dev/null; then
  echo "lolcat is installed" | lolcat
else
    sudo apt-get -y install lolcat
    exit 1
fi
# Check if figlet Tool is installed.
if command -v figlet > /dev/null; then
  echo "figlet is installed" | lolcat
else
    sudo apt install figlet
    exit 2
fi

# Check if nmap Tool is installed.
if command -v nmap > /dev/null; then
  echo "nmap  is installed" | lolcat
else
    sudo apt-get install nmap
    exit 3
fi

# Check if JQ Tool is installed.
if [[ $(which jq) == "/usr/bin/jq" ]]; then
  echo "JQ is installed" | lolcat
else
   sudo apt-get install jq
exit 4
fi

echo  "Welcome to OmriyxScript That Check Geolocation Info And Common Ports On Target Domain Name Or Ip Address" | lolcat
echo "Using the script for testing purposes only & your own risk" | lolcat
echo ""

figlet "Omriyx" | lolcat
echo "[YOUR ARE USING Omriyx.sh] - (v1.0) CODED BY Omri Yahav 'Omriyx' WITH ❤  FOR  Educational Purposes only!" | lolcat

#check if the user is connected to the internet.
tput bold;echo "CHECKING IF YOU ARE CONNECTED TO THE INTERNET!" | lolcat
# Check connection.
wget -q --spider https://google.com
if [ $? -ne 0 ];then
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING Omriyx.sh!" | lolcat
    exit 5
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat

#Read User IP address Or Domain name :
read -p "Please Enter IP address or Domain name:" IpOrDomain

# If user doesn't enter anything.
if [[ -z $IpOrDomain ]]; then
    echo "Input Cant Be Empty , Please Enter Ip Address Or Domain Name" | lolcat
    echo  "ExitError No.6" | lolcat
  exit 6
 else
 echo "Analyze The Input"
fi

#Checks that the given IP argument is not equal to: '127.0.0.1'.
if [[ $IpOrDomain  == "127.0.0.1" ]]; then
 echo "127.0.0.1 is not valid , try public ip" | lolcat
 echo "ExitError No.7" | lolcat
 exit 7
fi

# Regular expression for validating IPv4 addresses & Domain names.
ip_regex="^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

domain_regex="^([a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]\.)+[a-zA-Z]{2,}$"

if [[ $IpOrDomain =~ $ip_regex ]]; then
  echo "Valid IPv4 address" | lolcat
elif [[ $IpOrDomain =~ $domain_regex ]]; then
  echo "Valid domain name" | lolcat
else
  echo "Invalid domain name or IP address" | lolcat
  echo  "ExitError No.8" | lolcat
exit 8
fi

#Check & start tor proxy service :
#sudo service tor start | lolcat
#service tor status | lolcat


#Query Geolocation info from JSON of ip-api.com:
RESPONSE=$(curl http://ip-api.com/json/$IpOrDomain)
if [[ $? -ne 0 ]]; then
echo "Please check your network  connection , CURL faild" | lolcat
echo "ExitError No.9" | lolcat
exit 9
fi

echo "Country: $(echo $RESPONSE | jq -r '.country' )" | lolcat
echo "City: $(echo $RESPONSE | jq -r '.city' )" | lolcat
echo "Region Name: $(echo $RESPONSE | jq -r '.RegionName' )" | lolcat
echo "TimeZone: $(echo $RESPONSE | jq -r '.timezone' )" | lolcat
echo "ISP: $(echo $RESPONSE | jq -r '.isp' )" | lolcat
echo "Query: $(echo $RESPONSE | jq -r '.query' )" | lolcat
echo "ORG: $(echo $RESPONSE | jq -r '.org' )" | lolcat


echo "Scaning HOST with nmap ports: 80,90,443,21,22,23,554" | lolcat

 nmap -sT -PN -n -sV -p 80,90,443,21,22,23,554 $IpOrDomain | lolcat


echo "Thank you for using my tool, if you feel it has helped you, you can buy us a coffee here: https://www.buymeacoffee.com/omriyahav" | lolcat
sleep 1
echo "Copyrights 2023 - All rights reserved - omriyahav" | lolcat
