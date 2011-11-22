all: kernel.obj image.iso

%.os: %.asm
	nasm -f elf $< -o $@

backlight-kernel-kmain.o: backlight-kernel-kmain.adb backlight-kernel-kmain.ads
	gnat compile -c backlight-kernel-kmain.adb

backlight-kernel-multiboot.o: backlight-kernel-multiboot.ads
	gnat compile -c backlight-kernel-multiboot.ads

kernel.obj: linker.ld stub.os backlight-kernel-kmain.o backlight-kernel-multiboot.o
	ld -Tlinker.ld -o $@ stub.os backlight-kernel-kmain.o backlight-kernel-multiboot.o

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
	rm -rf isofiles kernel.obj *.os *.o *~ *.ppu *.iso *.s *.ali
