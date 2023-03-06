# FirstRecon

![This is an image](/img/Prog.png)

This is a Bash script designed to  perform various tasks on an IP address or domain name provided by the user.
The script first checks if the user is connected to the internet and then prompts the user to enter an IP address or domain name to analyze.
The script validates the input and then uses the ip-api.com API to retrieve geolocation information about the IP address or domain name.

Finally, the script runs a port scan on common ports (80,90,443,21,22,23,554) using nmap and displays the results. 
