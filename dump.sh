#!/bin/bash
echo ""
echo "LineageOS 20.x dump blob for ANNE"
echo "please put *.img in raw format here before start"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

mkdir dump/
mkdir dump/system/
mkdir dump/vendor/
mkdir dump/product/
mkdir dump/odm/

sudo mount -o ro SYSTEM-RAW.img dump/system/
sudo mount -o ro VENDOR-RAW.img dump/vendor/
sudo mount -o ro PRODUCT-RAW.img dump/product/
sudo mount -o ro ODM-RAW.img dump/odm/

echo "Start extraction"
sleep 5
sudo ./extract-files.sh anne ./dump/ > dump.log

echo "Reset owner"
sudo chown -R $(id -u):$(id -g) ./../../../vendor/huawei/*


echo "Umount all"
sleep 5
sudo umount dump/system/
sudo umount dump/vendor/
sudo umount dump/product/
sudo umount dump/odm/

rm -rf dump/system/
rm -rf dump/vendor/
rm -rf dump/product/
rm -rf dump/odm/

