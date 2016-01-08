FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y binfmt-support qemu qemu-user-static qemu-system curl zip
RUN curl -Lo kernel-qemu 'https://mega.nz/#!3URCUJQD!stG2zt3wy-1IDcrg1cuw6UgJYAfNxZRHH5TcKeCYhkY'
RUN curl -o hypriot.img.zip downloads.hypriot.com/hypriot-rpi-20150416-201537.img.zip
RUN unzip hypriot.img.zip
RUN mv hypriot*.img hypriot.img
#  - qemu-system-arm -M versatilepb -cpu arm1176 -kernel kernel-qemu -hda hypriot.img -m 256 -append "root=/dev/sda2" -net nic -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::22280-:80

ENV QEMU_AUDIO_DRV=
ENV QEMU_AUDIO_DRV=none

CMD qemu-system-arm -curses -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -append "root=/dev/sda2 rw vga=normal console=ttyAMA0,115200" -nographic -hda hypriot.img -redir tcp:2222::22

