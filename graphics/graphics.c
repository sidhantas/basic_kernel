#include "../headers/graphics.h"

void putpixel (int pos_x, int pos_y, unsigned char VGA_COLOR) {
    unsigned char *base = (unsigned char *) 0xA0000;
    unsigned short  offset = 320 * pos_y + pos_x;
    base[offset] = VGA_COLOR;
}

void drawbox (int pos_x, int pos_y, int w, int h, unsigned char VGA_COLOR) {
    for (int i = 0; i < w; i++) {
        for (int j = 0; j < h; j++) {
            putpixel(pos_x + i, pos_y + j, VGA_COLOR);
        }
    }
}
