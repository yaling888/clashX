#!/bin/bash
set -e
echo "Build Clash core"

cd ClashX/goClash
python3 build_clash_universal.py
cd ../..

echo "Pod install"
pod install
echo "delete old files"
rm -f ./ClashX/Resources/Country.mmdb
rm -f ./ClashX/Resources/geoip.dat
rm -f ./ClashX/Resources/geosite.dat
rm -rf ./ClashX/Resources/dashboard
rm -f GeoLite2-Country.*
echo "install geoip.dat"
curl -LO https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
gzip geoip.dat
mv geoip.dat.gz ./ClashX/Resources/geoip.dat.gz
echo "install geosite.dat"
curl -LO https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
gzip geosite.dat
mv geosite.dat.gz ./ClashX/Resources/geosite.dat.gz
echo "install dashboard"
cd ClashX/Resources
git clone -b gh-pages https://github.com/yaling888/clash-dashboard.git dashboard
