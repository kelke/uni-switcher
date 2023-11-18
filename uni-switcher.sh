#!/bin/bash

# IP net to check
check_ip="134.102."

services=$(/usr/sbin/networksetup -listallnetworkservices | grep -v '*')

found_uni_ip=false

while read service; do
    # Get network information for the service
    ip_info=$(/usr/sbin/networksetup -getinfo "$service")

    # Extract the IP address from the information
    ip_address=$(echo "$ip_info" | awk -F': ' '/^IP address:/{print $2}')

    if [[ $ip_address == $check_ip* ]]; then
        echo "$(date) --- found uni ip"
        found_uni_ip=true

        if [[ $(/usr/sbin/networksetup -getcurrentlocation) == "Automatic" ]]; then
            echo "$(date) --- changing location to Uni"
            /usr/sbin/networksetup -switchtolocation Uni
            break
        fi
        break
    fi
done < <(echo "$services")


# If outside of uni network, switch to automatic
if [ "$found_uni_ip" == false ]; then
    # echo "not in uni network"

    # switch to automatic only if still in uni network
    if [[ $(/usr/sbin/networksetup -getcurrentlocation) == "Uni" ]]; then
        echo "$(date) --- changing location to Automatic"
        /usr/sbin/networksetup -switchtolocation Automatic
    # else
        # echo "also not using uni location, not changing"
    fi
fi
