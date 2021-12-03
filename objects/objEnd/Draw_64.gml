/// @description Insert description here
// You can write your code in this editor

var alpha = 1;
draw_set_alpha(alpha);
draw_set_colour(c_white);
draw_set_halign(fa_center);
var rules_text = "WRECK AS MANY CARS AS YOU CAN IN A MINUTE!";
draw_text_transformed(512, 288 + 100, rules_text, 2, 2, 0);
draw_set_colour(c_white);
draw_text_transformed(512, 288 + 160, "SCORE: " + string(score), 3, 2, 0);

