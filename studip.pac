function FindProxyForURL(url, host)
{
    if (dnsDomainIs(host, "elearning.uni-bremen.de")) {
        return "SOCKS yoursshtunnelhost:port";
    } else {
        return "DIRECT";
}
