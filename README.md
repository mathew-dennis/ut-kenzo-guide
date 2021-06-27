 # kenzo_ubuntu_touch
 notes on possible issues  

- halium boot not working

After builing the halium-boot it may not boot its due to the kernal offsets.  
use the repack boot tool(script included) in  the repo it removes the offsets.  
pleae issue a pr if you were able to remove it form the source itself

- wifi and audio not working

Its coz on buildin system image the rc.local file loses executable permission.   
pleae issue a pr if you were able to fix this.  
work around is to    boot to recovery        and run the following

adb shell

mkdir /b

mount /data/system.img /b

chmod +x /b/halium/etc/rc.local

umount /b

sync

reboot

# work in pogress....
