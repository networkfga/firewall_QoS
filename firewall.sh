iptables -F
iptables -X

# Accept ICMP packages
iptables -A INPUT -p icmp -s 10.0.0.0/16 -j ACCEPT 
iptables -A FORWARD -p icmp -s 10.0.0.0/16 -j ACCEPT

# Accept HTTP and HTTPS packages
iptables -A FORWARD -p tcp --dport 80 -s 10.0.0.0/16 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.0.0.0/16 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -s 10.0.0.0/16 -j ACCEPT
iptables -A FORWARD -p tcp --dport 443 -s 10.0.0.0/16 -j ACCEPT

# Accept DNS resolution
iptables -A FORWARD -p udp --dport 53 -s 10.0.0.0/16 -j ACCEPT
iptables -A FORWARD -p tcp --dport 53 -s 10.0.0.0/16 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -s 10.0.0.0/16 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -s 10.0.0.0/16 -j ACCEPT

# Drop everything else
iptables -A FORWARD -s 10.0.0.0/16 -j DROP
iptables -A INPUT  -s 10.0.0.0/16 -j DROP

# Config NAT
iptables -L -t filter
iptables -L -t nat
