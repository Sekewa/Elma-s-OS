.DEFAULT_TARGET := floppy

.PHONY:= clean, BUILDDIR, IMGDIR

floppy: BUILDDIR IMGDIR bootloader
	dd if=/dev/zero of=img/floppy.img bs=512 count=2880
	mkfs.fat -F12 img/floppy.img
	dd if=out/boot/bootloader of=img/floppy.img conv=notrunc

bootloader:
	nasm -f bin src/boot/bootloader.asm -o out/boot/bootloader

BUILDDIR:
	cp -r src/ out
	find out -type f -exec rm {} \+

IMGDIR:
	mkdir img

clean:
	rm -rf out img
