#include "multiboot.h"

.text
.code32                 /* 32bit-protectmode */
.intel_syntax noprefix  /* Intel-style, not use AT&T-style */

.global _start
_start:
        jmp entry
        .align 4
        .long MULTIBOOT_HEADER_MAGIC
        .long MULTIBOOT_HEADER_FLAGS
        .long MULTIBOOT_HEADER_CHECKSUM

entry:
        push    ebx   /* push multiboot_info structure pointer */
        push    eax   /* push MBOOT_HEADER_MAGIC */
        jmp     main  /* jmp kernel main */
