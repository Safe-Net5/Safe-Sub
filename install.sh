#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

echo "=============================="
echo " SafeVPN Custom Installer"
echo "=============================="
echo

read -p "Brand Name: " BRAND
read -p "Bot Username (without @): " BOT
read -p "Channel Username (without @): " CHANNEL
read -p "Support Username (without @): " SUPPORT

mkdir -p /usr/local/x-ui/sub_templates

TMP=$(mktemp)

curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/template.html -o "$TMP"

sed -i "s|Safe.Vpn|$BRAND|g" "$TMP"
sed -i "s|VpnSafee_bot|$BOT|g" "$TMP"
sed -i "s|SafeVpn13|$CHANNEL|g" "$TMP"
sed -i "s|SafeVpn5|$SUPPORT|g" "$TMP"

mv "$TMP" /usr/local/x-ui/sub_templates/custom
chmod 644 /usr/local/x-ui/sub_templates/custom

echo
echo "=================================="
echo " Custom template installed."
echo " File:"
echo " /usr/local/x-ui/sub_templates/custom"
echo "=================================="
