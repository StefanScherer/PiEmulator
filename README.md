mkdir HypriotEmulator
  cd HypriotEmulator

wget downloads.hypriot.com/hypriot-rpi-20150416-201537.img.zip
  unzip hypriot-rpi-20150416-201537.img.zip
    mv hypriot-rpi-20150416-201537.img hypriot.img

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

ssh pi@127.0.0.1 -p 2222
