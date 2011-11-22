GCCFLAGS=-m32
LDFLAGS=-melf_i386

all: kernel.obj image.iso

%.os: %.asm
	nasm -f elf $< -o $@

%.adbo: %.adb %.ads
	gcc $(GCCFLAGS) -c $<
	mv $(@:.adbo=.o) $@

%.adso: %.ads
	gcc $(GCCFLAGS) -c $<
	mv $(@:.adso=.o) $@

kernel.obj: linker.ld stub.os backlight-kernel-kmain.adbo backlight-kernel-multiboot.adso
	ld $(LDFLAGS) -Tlinker.ld -o $@ $(^:linker.ld=)

image.iso: kernel.obj grub.conf
	mkdir -p isofiles/boot/grub
	cp -f stage2_eltorito isofiles/boot/grub
	cp -f grub.conf isofiles/boot/grub
	cp -f kernel.obj isofiles/
	genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o image.iso isofiles

run: image.iso
	qemu -cdrom image.iso

.PHONY: run clean

clean:
	rm -rf isofiles kernel.obj *.os *.o *~ *.ppu *.iso *.s *.ali *.adbo *.adso
