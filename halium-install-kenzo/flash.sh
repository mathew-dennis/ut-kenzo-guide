
echo ""
 
echo ""
echo ""
echo "copying files "
echo ""

rm -f  system.img 

rm -f halium-boot.img

cp /media/appu/ext4_drv3/halium9_v2/out/target/product/kenzo/halium-boot.img halium-boot.img

cp /media/appu/ext4_drv3/halium9_v2/out/target/product/kenzo/system.img  system.img 
echo "Done ..now we fly with install "
echo ""
echo "system is halium 9 base , root fs is ubuntu-touch-android9-arm64.tar.gz "

#halium install 
./halium-install -v -p ut -s ubuntu-touch-android9-arm64.tar.gz system.img

adb shell mkdir /b
adb shell mount /data/rootfs.img /b
adb shell touch /b/etc/udev/rules.d/70-kenzo.rules
adb shell touch /b/etc/init/wifi.conf 
adb shell umount /b
adb shell  sync

adb shell mkdir /a
adb shell mount /data/android-rootfs.img /a
adb shell mount cust
adb shell rm -R /cust/*
adb shell cp -R /a/system/vendor/* /cust/
echo ""
echo "device  will go to  fastboot mode"
echo ""



#adb reboot bootloader

#fastboot flash boot halium-boot.img

#fastboot reboot

echo "done"
