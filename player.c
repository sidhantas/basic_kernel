#include "player.h"
#include "./headers/graphics.h"
#include <stdint.h>

/* Player gets its own box, box is defined with x, y, w, h
 * Upon movement left of the player, clear the box, update x and y
 * of the box, then drawn new box
 */

Player player_create(int pos_x, int pos_y, int w, int h) { 
    drawbox(pos_x, pos_y, w, h, GAME_COLOR);
    Player player = {
        pos_x,
        pos_y,
        w,
        h,
        SPEED
    };
    return player;
}

void clear_player(Player player) {
   drawbox(player.pos_x, player.pos_y, player.w, player.h, 0); 
}

Player player_move(Player player, int move_x) {
    clear_player(player);
    Player new_player = player_create(player.pos_x + move_x, player.pos_y, player.w, player.h);
    return new_player;
}
    
