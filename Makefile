all: kernel.obj

%.os: %.asm
	nasm -f elf $< -o $@

kernel.o: kernel.adb kernel.ads
	gnat compile -c kernel.adb

multiboot.o: multiboot.ads
	gnat compile -c multiboot.ads

kernel-stdlib.o: kernel-stdlib.ads kernel-stdlib.adb
	gnat compile -c kernel-stdlib.adb

kernel.obj: linker.ld stub.os kernel.o multiboot.o \
	    kernel-stdlib.o kernel-video-cga.o
	ld -Tlinker.ld -o $@ stub.os kernel.o multiboot.o \
		kernel-stdlib.o kernel-video-cga.o

kernel-video-cga.o: kernel-video-cga.ads kernel-video-cga.adb
	gnat compile -c kernel-video-cga.adb

image.iso: kernel.obj grub.conf
	mkdir -p isofiles/boot/grub
	cp -f /usr/share/grub/i386-redhat/stage2_eltorito isofiles/boot/grub
	cp -f grub.conf isofiles/boot/grub
	cp -f kernel.obj isofiles/
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o image.iso isofiles

run: image.iso
	qemu -cdrom image.iso

.PHONY: run clean

clean:
	rm -rf isofiles kernel.obj *.os *.o *~ *.ppu *.iso *.s
