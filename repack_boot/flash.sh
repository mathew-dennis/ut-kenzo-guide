
echo ""

echo ""
echo ""
echo "this is only for kenzo please dont proced if you have any other device pluged in "
echo ""
echo "put your device in recovery mode with twrp or orange fox recovery "
echo ""
echo "system is halium 7 base , root fs is ubuntu-touch-hybris-xenial-edge-arm64-rootfs.tar.gz "

#halium install 
./halium-install  -p ut ubuntu-touch-hybris-xenial-edge-arm64-rootfs.tar.gz system.img

#unpack repack and flash boot image
rm -r ha
rm halium
mkdir ha
echo ""
echo "cleaning up"
echo "unpacking and repacking boot image"
echo ""
./unpackbootimg -i halium-boot.img -o ha

./mkbootimg  --kernel  ha/halium-boot.img-zImage  --ramdisk  ha/halium-boot.img-ramdisk.gz --cmdline ha/halium-boot.img-cmdline --base ha/halium-boot.img-base  --header_version 0  --hashtype  sha256  -o halium

echo ""
echo "device  will go to  fastboot mode"
echo ""

adb reboot bootloader

fastboot flash boot halium

fastboot reboot

echo "done"
