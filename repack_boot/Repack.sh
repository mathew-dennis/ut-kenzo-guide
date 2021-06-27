

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
