#PiEmulator (Linux)
###Raspberry Pi emulator (Qemu) running Hypriot OS or Resin.io

This is not a piece of software but a manual on how to set up a Raspberry Pi emulator.

At first, you have to create a directory for all your files.

```
mkdir PiEmulator && \
  cd PiEmulator
```

Then, you can download the latest version of Hypriot OS as an image file via ```wget```.

```
wget downloads.hypriot.com/hypriot-rpi-20150416-201537.img.zip && \
  unzip hypriot-rpi-20150416-201537.img.zip && \
    mv hypriot-rpi-20150416-201537.img hypriot.img
```

Alternately, you can download the Resin.io OS.

After that, you have to download the right kernel for Qemu to be able to emulate the right environment.
The download of this file cannot be done via ```wget```:

https://mega.nz/#!3URCUJQD!stG2zt3wy-1IDcrg1cuw6UgJYAfNxZRHH5TcKeCYhkY

You have to move the downloaded file (kernel-qemu) to your PiEmulator directory.

Furthermore, from this folder you can start the emulation via your terminal:

```
qemu-system-arm \
-M versatilepb \
-cpu arm1176 \
-kernel kernel-qemu \
-hda hypriot.img \
-m 256 \
-append "root=/dev/sda2" \
-net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::22280-:80
```

To control "your Raspberry Pi", you can use your terminal and SSH as connection:

```
ssh pi@127.0.0.1 -p 2222
```

(Because you are sharing your IP with Qemu, the start command forwards the port from 22 to 2222. You have to use port 2222 for SSH to connect to Qemu instead of the standard port 22.)
