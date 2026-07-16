#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

echo "=================================="
echo "   Safe-Sub Installer for 3x-ui"
echo "=================================="
echo

read -p "Brand Name: " BRAND
read -p "Bot Username (without @): " BOT
read -p "Channel Username (without @): " CHANNEL
read -p "Support Username (without @): " SUPPORT

TEMPLATE_PATH="/usr/local/x-ui/sub_templates/Safe-Sub"

mkdir -p "$TEMPLATE_PATH"

curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/template.html \
-o "$TEMPLATE_PATH/index.html"

sed -i "s|Safe.Vpn|$BRAND|g" "$TEMPLATE_PATH/index.html"
sed -i "s|VpnSafee_bot|$BOT|g" "$TEMPLATE_PATH/index.html"
sed -i "s|SafeVpn13|$CHANNEL|g" "$TEMPLATE_PATH/index.html"
sed -i "s|SafeVpn5|$SUPPORT|g" "$TEMPLATE_PATH/index.html"

# ایجاد فایل کانفیگ برای متغیرهای مورد نیاز
cat > "$TEMPLATE_PATH/config.json" <<EOF
{
    "template": "Safe-Sub",
    "variables": {
        "subId": "user.id",
        "subUrl": "user.sub_url",
        "expire": "user.expire_time",
        "lastOnline": "user.last_online",
        "totalByte": "user.total_bytes",
        "downloadByte": "user.download_bytes",
        "uploadByte": "user.upload_bytes",
        "enabled": "user.enabled",
        "subTitle": "user.sub_title",
        "links": "user.links",
        "emails": "user.emails"
    }
}
EOF

cp "$TEMPLATE_PATH/index.html" "$TEMPLATE_PATH/sub.html"

chmod 644 "$TEMPLATE_PATH/index.html"
chmod 644 "$TEMPLATE_PATH/sub.html"
chmod 644 "$TEMPLATE_PATH/config.json"

echo
echo "=================================="
echo " Installation completed!"
echo
echo " Template Path:"
echo " $TEMPLATE_PATH"
echo
echo " Make sure to:"
echo " 1. Upload the new template.html to your repository"
echo " 2. Configure 3x-ui to use 'Safe-Sub' template"
echo "=================================="
