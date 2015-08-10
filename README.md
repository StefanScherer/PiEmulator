#HypriotEmulator
###Raspberry Pi emulator (Qemu) running Hypriot OS
######blog.hypriot.com

This is not a piece of software but a manual on how to set up a Raspberry Pi emulator.

At first, you have to create a directory for all your files.

```
mkdir HypriotEmulator && \
  cd HypriotEmulator
```

Then, you can download the latest version of Hypriot OS as an image file via ```wget```.

```
wget downloads.hypriot.com/hypriot-rpi-20150416-201537.img.zip && \
  unzip hypriot-rpi-20150416-201537.img.zip && \
    mv hypriot-rpi-20150416-201537.img hypriot.img && \
      dd if=/dev/zero of=hypriot.img seek=32000 obs=1MB count=0 && \
        
        qemu-img create -f raw swap 5G
```

```
qemu-system-arm \
-M versatilepb \
-cpu arm1176 \
-kernel kernel-qemu \
-hda hypriot.img \
-hdb swap \
-m 256 \
-append "root=/dev/sda2" \
-net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::22280-:80
```

```
ssh pi@127.0.0.1 -p 2222
```
