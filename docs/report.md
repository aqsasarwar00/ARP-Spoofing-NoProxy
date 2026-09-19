# ARP Spoofing Practice Report

## Target Details
- Target IP: 192.168.0.102 (Phone)
- Gateway IP: 192.168.0.1 (Router)
- Interface: wlan0

## What I Did
1. Scanned network using netdiscover.
2. Enabled IP forwarding.
3. Configured Burp Suite for Invisible Proxying.
4. Set iptables rules to redirect port 80 and 443 to Burp (8080).
5. Ran arpspoof on both target and gateway.
6. Captured traffic in Burp Suite.

## Findings
- HTTP traffic was captured in plain text.
- HTTPS traffic required CA certificate installation.
- No proxy was needed on the target device.

## Conclusion
ARP Spoofing without proxy is possible using iptables and Burp Suite's invisible proxying feature.
