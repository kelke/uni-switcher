#!/bin/bash

# IP net to check
check_ip="134.102."

services=$(networksetup -listallnetworkservices | grep -v '*')

found_uni_ip=false

while read service; do
    # Get network information for the service
    ip_info=$(networksetup -getinfo "$service")

    # Extract the IP address from the information
    ip_address=$(echo "$ip_info" | awk -F': ' '/^IP address:/{print $2}')

    if [[ $ip_address == $check_ip* ]]; then
        echo "found uni ip"
        found_uni_ip=true

        if [[ $(networksetup -getcurrentlocation) == "Automatic" ]]; then
            echo "changing location to Uni"
            # networksetup -switchtolocation Uni
            # break
        fi
        break
    fi
done < <(echo "$services")


# If outside of uni network, switch to automatic
if [ "$found_uni_ip" == false ]; then
    # echo "not in uni network"

    # switch to automatic only if still in uni network
    if [[ $(networksetup -getcurrentlocation) == "Uni" ]]; then
        echo "changing location to Automatic"
        networksetup -switchtolocation Automatic
    # else
        # echo "also not using uni location, not changing"
    fi
fi
