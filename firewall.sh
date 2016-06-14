#!/bin/bash
#place it in /usr/local/bin/iptables.sh
IPT="/sbin/iptables"

## Flush and reset counters
$IPT -F
$IPT -X
$IPT -Z

## Loopback
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

## Accept ICMP Ping echo requests
$IPT -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

## Allow SSH 2222 from 49.236.215.20 only
$IPT -A INPUT -p tcp -m tcp --syn --dport 2222 -j ACCEPT

## HTTP/HTTPS
$IPT -A INPUT -p tcp -m tcp --syn --dport 80 -j ACCEPT
$IPT -A INPUT -s 162.158.0.0/16  -j DROP
$IPT -A INPUT -s 199.27.128.0/24 -j DROP
$IPT -A INPUT -s 199.27.133.0/24 -j DROP
$IPT -A INPUT -s 185.106.92.160 -j DROP
$IPT -A INPUT -s 185.130.5.165 -j DROP
## Allow inbound established and related outside communication
$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

## Drop outside initiated connections
$IPT -A INPUT -m state --state NEW -j REJECT

## Allow all outbound tcp, udp, icmp traffic with state
$IPT -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

## Chains
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP
