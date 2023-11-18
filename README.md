# uni-switcher

is a shell script written for macOS that aims to detect if the device is currently within the network of the University of Bremen and change Network-Location accordingly.

### Background

At the end of the summers semester 2023 the University of Bremen changed its learning platform [StudIP](https://elearning.uni-bremen.de/) to interal-network only. Since then some months have passed, calling for a permanent solution to still be able to access StudIP from outside the uni-net.

The technique you choose to connect to the uni-net might require a different network location, to distingish between being at the uni where no tunnel is needed, as opposed to outside, where a tunnel is needed for StudIP.

### Instructions

1. clone this repo and note the repo path using `pwd`

2. Configure a network location named `Uni`

3. Run `crontab -e`

4. Append the following:

   ```bash
   MAILTO=""
   * * * * * /Users/kelke/Git/uni-switcher/uni-switcher.sh >> /Users/kelke/Git/uni-switcher/uni-switcher.log
   ```

   With `MAILTO=""` cron will not log everytime the script is ran

   `* * * * *` runs the script every minute, this can, of course, be adjusted. See [crontab.guru](https://crontab.guru/#*/5_*_*_*_*) for help.

5. You might have to approve a pop-up

Now you can add proxy-settings to your `Automatic` network location and still have a direct connection when you are at uni.

### Extras

- If using an SSH-Tunnel for StudIP, the provided [.pac file](https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file) can be used to only tunnel StudIP traffic
  - https://files.kelke.de/studip.pac can be used as well, since macOS does not support local pac files anymore.
    If you do, you need a local DNS rewrite for `socks.kelke.me`for example using [Adguard Home](https://github.com/AdguardTeam/AdGuardHome)