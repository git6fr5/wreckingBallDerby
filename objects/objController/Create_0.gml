game_time = 0;
game_score = objArena.number_of_cars;
people_killed = 0;
music_playing = false;
alarm_end = false;
alarm_start = false;
alarm_played_10 = false;
alarm_played_3 = false;
alarm_played_2 = false;
alarm_played_1 = false;

var lay_id = layer_get_id("ground_tiles");
var map_id = layer_tilemap_get_id(lay_id);

var data;
data[0] = tilemap_get(map_id, 0, 0);
var size = 4;
for (i = 0; i < size; i+= 1) {
	for (j = 0; j < size; j+= 1) {
		data[size*i + j] = tilemap_get(map_id, i, j);
	}
}

for (i = 0; i < floor(room_width/16); i += 1) {
	for (j = 0; j < floor(room_height/16); j += 1) {
		tilemap_set(map_id, data[random_range(0, size * size)], j, i)
	}
}
