# Makefile

CC = i686-elf-gcc
ASM = nasm
LD = i686-elf-ld
GRUB = grub-mkrescue

CFLAGS = -ffreestanding -O2 -Wall -Wextra -std=gnu99
ASMFLAGS = -f elf32
LDFLAGS = -ffreestanding -O2 -nostdlib -lgcc -T linker.ld

OBJ = loader.o kernel.o

all: yuki_os.iso

loader.o: loader.S
	$(ASM) loader.S -o loader.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

yuki_os.bin: $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) -o yuki_os.bin

iso: yuki_os.bin
	mkdir -p iso/boot/grub
	cp yuki_os.bin iso/boot/
	cp grub.cfg iso/boot/grub/
	$(GRUB) -o yuki_os.iso iso/

clean:
	rm -f *.o *.bin *.iso
