// multiboot.h
#ifndef MULTIBOOT_H
#define MULTIBOOT_H

#define MULTIBOOT_HEADER_MAGIC 0x1BADB002
#define MULTIBOOT_HEADER_FLAGS (0x00010003)

#define MULTIBOOT_BOOTLOADER_MAGIC 0x2BADB002

// このヘッダーの構造体を使って、ブートローダーに必要な情報を渡します
typedef struct {
    uint32_t magic;
    uint32_t flags;
    uint32_t checksum;
    uint32_t header_addr;
    uint32_t load_addr;
    uint32_t load_end_addr;
    uint32_t bss_end_addr;
    uint32_t entry_addr;
} __attribute__((packed)) multiboot_header_t;

#endif
