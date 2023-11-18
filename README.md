# uni-switcher

is a shell script written for macOS that aims to detect if the device is currently within the network of the University of Bremen and change Network-Location accordingly.

### Background

At the end of the summers semester 2023 the University of Bremen changed its learning platform [StudIP](https://elearning.uni-bremen.de/) to interal-network only. Since then some months have passed, calling for a permanent solution to still be able to access StudIP from outside the uni-net.

The technique you choose to connect to the uni-net might require a different network location, to distingish between being at the uni where no tunnel is needed, as opposed to outside, where a tunnel is needed for StudIP.

### Instructions

- You need to configure a network location named `Uni`
- As this script is meant to be ran via cronjob, an install-script is provided for an easily setup process

### Extras

- If using an SSH-Tunnel for StudIP, the provided [.pac file](https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file) can be used to only tunnel StudIP traffic
  - https://files.kelke.de/studip.pac can be used as well, since macOS does not support local pac files anymore