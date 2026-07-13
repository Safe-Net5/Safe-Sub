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

mkdir -p /usr/local/x-ui/sub_templates/safevpn

curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/template.html \
-o /usr/local/x-ui/sub_templates/safevpn/index.html

sed -i "s|Safe.Vpn|$BRAND|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|VpnSafee_bot|$BOT|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|SafeVpn13|$CHANNEL|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|SafeVpn5|$SUPPORT|g" /usr/local/x-ui/sub_templates/safevpn/index.html

cp /usr/local/x-ui/sub_templates/safevpn/index.html \
/usr/local/x-ui/sub_templates/safevpn/sub.html

chmod 644 /usr/local/x-ui/sub_templates/safevpn/index.html
chmod 644 /usr/local/x-ui/sub_templates/safevpn/sub.html

echo
echo "======================================"
echo "Installation completed successfully!"
echo "Template Path:"
echo "/usr/local/x-ui/sub_templates/safevpn"
echo "======================================"
