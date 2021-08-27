#include "../headers/graphics.h"
#include "../headers/io.h"

#include <stdint.h>

void disable() {
    __asm__ volatile("cli");
}

void _start() {
    disable();
    outb(0x03C8, (unsigned char)4);
    outb(0x03C9, (unsigned char)0);
    outb(0x03C9, (unsigned char)0);
    outb(0x03C9, (unsigned char)0);
    drawbox(120, 170, 80, 10, 4);
}
