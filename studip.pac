function FindProxyForURL(url, host)
{
    // Uni-Bremen Stud-IP
    if (dnsDomainIs(host, "elearning.uni-bremen.de")) {
        return "SOCKS yoursshtunnelhostname:port";
    } else {
        return "DIRECT";
    }
}
