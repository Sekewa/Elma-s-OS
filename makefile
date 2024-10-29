floppy: bootloader
	dd if=/dev/zero of=img/floppy.img bs=512 count=2880
	dd if=out/boot/bootloader of=img/floppy.img conv=notrunc

bootloader:
	nasm src/boot/bootloader.asm -o out/boot/bootloader

clean:
	rm out/boot/bootloader img/floppy.img