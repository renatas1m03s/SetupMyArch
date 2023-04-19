#!/bin/bash

sudo nmcli connection add type vpn con-name VPN_LLK vpn-type pptp
sudo nmcli connection modify VPN_LLK vpn.data gateway=vpn3.lanlink.com.br ipv4.dns-search lanlink.com.br
sudo nmcli connection modify VPN_LLK ipv4.ignore-auto-routes true ipv4.never-default yes ipv4.method auto
sudo nmcli connection modify VPN_LLK ipv4.routes "10.85.0.0/16 192.168.211.1"
