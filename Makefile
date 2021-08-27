CC = gcc
LDFLAGS = -Ttext 0x1000 --oformat binary
CFLAGS = -ffreestanding -Iheaders

all: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.iso
	qemu-system-i386 -drive format=raw,file=os-image.iso

boot.bin: ./bootloader/bootloader.s
	nasm -i./bootloader/ ./bootloader/bootloader.s -f bin -o boot.bin
	sudo dd if=boot.bin of=/dev/fd0

kernel.bin: kernel.o kernel_entry.o graphics.o io.o
	ld $(LDFLAGS) -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o graphics.o io.o --oformat binary

kernel.o: ./kernel/kernel.c
	$(CC) $(CFLAGS) -c ./kernel/kernel.c -o kernel.o
	
kernel_entry.o:
	nasm -i./kernel/ ./kernel/kernel_entry.s -f elf64 -o kernel_entry.o

graphics.o: ./graphics/graphics.c
	$(CC) $(CFLAGS) -c ./graphics/graphics.c -o graphics.o

io.o: ./kernel/io.c
	$(CC) $(CFLAGS) -c ./kernel/io.c -o io.o

clean:
	rm -rf boot.bin kernel.bin os-image *.o
