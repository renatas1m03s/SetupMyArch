#!/bin/bash

nmcli con mod "Wired connection 1" ipv4.addresses 192.168.15.100/24
nmcli con mod "Wired connection 1" ipv4.gateway 192.168.15.1
nmcli con mod "Wired connection 1" ipv4.dns "192.168.15.3 8.8.4.4"
nmcli con mod "Wired connection 1" ipv4.method manual
nmcli con down "Wired connection 1" && nmcli con up "Wired connection 1" 
