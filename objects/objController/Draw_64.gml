/// @description Insert description here
// You can write your code in this editor

if (game_time < 3) {
	var alpha = 1;
	if (game_time > 1) {
		alpha = floor((3 - (game_time + 1)) * 10) / 20;
	}
	draw_set_alpha(alpha);
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	var rules_text = "WRECK AS MANY CARS AS YOU CAN IN A MINUTE!";
	draw_text_transformed(512, 100, rules_text, 2.25, 2.25, 0);

}

draw_set_alpha(0.75);

draw_set_halign(fa_left);
draw_set_colour(c_black);
var scale = 1.5
if (game_time > 50) {
	scale = 1.75;
	var _check = floor(game_time * 10) % 2 == 0;
	if (_check) {	
		draw_set_colour(c_red);
	}
}



if (game_time > 57) {
	scale = 2;
	var _check = floor(game_time * 20) % 2 == 0;
	if (_check) {	
		draw_set_colour(c_red);
	}
}
var time_text = "TIME LEFT: " + string(60 - game_time);
draw_text_transformed(4, 576 -(36 / 2 * scale), time_text, scale, scale, 0);


draw_set_halign(fa_center);
draw_set_colour(c_black);
var score_text = "SCORE: " + string(game_score);
draw_text_transformed(1024 / 2, 576 -(36 / 2 * 1.5), score_text, 1.5, 1.5, 0);