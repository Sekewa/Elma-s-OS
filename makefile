launch: bootloader
	qemu-system-i386 out/boot/bootloader

bootloader:
	nasm src/boot/bootloader.asm -o out/boot/bootloader

clear:
	rm out/boot/bootloader
	
