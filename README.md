# OSDev_MeatySkeleton_Docker

In continuing experimentations with Docker, I built a  Docker image based on Ubuntu 16.04, that
contains a cross-compiler for i686-elf, built with the [OSDev.org Meaty Skeleton Tutorial](http://wiki.osdev.org/Meaty_Skeleton).
The intended use of this image is so that I can mess with the base OS code on several different computers that I own,
without having to set up the environment on each independently, and to make sure I don't run into any problems that slightly
different environments might cause. This is a more advanced version of the 
[Bare Bones Tutorial](https://github.com/zachbrennan/OSDev_BareBones_Docker).

### Building the Image

*This section assumes Docker is installed. If it is not, follow
the instructions 
[HERE](https://docs.docker.com/engine/installation/)*

```
make image
```
will create the image. Be aware, it will take a very long time. Along with installing a bunch of packages, the image needs
to build *gcc* and *binutils* from the source, which can be very time consuming. The created image is just over 3GB,
which is insane. I did this with an Ubuntu base, because I am most familiar with Ubuntu, but I might try to move it 
to an Alpine system, to make it a bit lighter.

### Compiling the OS

The actual compilation of the OS uses some provided Makefiles from the tutorial, and you should be able to find
all the information you need on them on the [Meaty Skeleton](http://wiki.osdev.org/Meaty_Skeleton) page.

However, if you just want to compile and run it, and you don't want to deal with figuring out that Makefile, just use
the default ```make``` command from the Makefile in the parent directory, and that will build the code with the other
Makefile, inside of Docker, and then run the *.iso* that is created with QEMU.

If QEMU is not installed, you should be able to install it with:

* Arch: ```pacman -S qemu```

* Debian/Ubuntu: ```apt-get install qemu```

* Fedora: ```dnf install @virtualization```

* Gentoo: ```emerge --ask app-emulation/qemu```

* RHEL/CentOS: ```yum install qemu-kvm```

* SUSE: ```zypper install qemu```

### Modified Files

Although this was built to run the Meaty Skeleton Tutorial code, I have been, and will
continue to, edit the given code. If you want to run the original tutorial code,
you can simply ```git clone``` the OSDev Meaty Skeleton repo, and then move the *Makefile* and *Dockerfile*
from this repo into the new one that you cloned.

Current Goals:
[✓]Builds image
[✓]Compiles code in Docker
[✓]Newline support
[✓]Terminal scrolling
[]Interrupt support (Needed for KB support)
[]PS/2 Keyboard support
[]USB Keyboard support???
[]Basic shell ([got an idea of how that works](https://github.com/zachbrennan/shell))
