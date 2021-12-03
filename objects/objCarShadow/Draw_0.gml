
// if (follow.image_index ==
var deg_angle = (angle + pi/4) / pi * 180;
deg_angle = 22.5 * floor(deg_angle / 22.5) + 15;
// deg_angle = 0;
draw_sprite_ext(sprCarShadow, 0, x, y, 2, 2, deg_angle, c_white, 1);