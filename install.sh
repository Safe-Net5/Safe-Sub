mkdir -p /usr/local/x-ui/sub_templates/safevpn

curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/template.html \
-o /usr/local/x-ui/sub_templates/safevpn/index.html

cp /usr/local/x-ui/sub_templates/safevpn/index.html \
/usr/local/x-ui/sub_templates/safevpn/sub.html

sed -i "s|Safe.Vpn|$BRAND|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|VpnSafee_bot|$BOT|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|SafeVpn13|$CHANNEL|g" /usr/local/x-ui/sub_templates/safevpn/index.html
sed -i "s|SafeVpn5|$SUPPORT|g" /usr/local/x-ui/sub_templates/safevpn/index.html

cp /usr/local/x-ui/sub_templates/safevpn/index.html \
/usr/local/x-ui/sub_templates/safevpn/sub.html
