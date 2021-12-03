upixelWidth = shader_get_uniform(shCar, "pixelWidth");
upixelWidth = shader_get_uniform(shCar, "pixelWidth");
texelWidth = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelHeight = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

function Type() {
	
	// decide type
	var gun = instance_create_depth(x, y, -1, prefab_gun);
	gun.car = self;
	gun.type = "machine_gun";
	
}

function Target() {
	
	var index = floor(random_range(0, objArena.number_of_targets));
	target_x = objArena.targets_x[index];	
	target_y = objArena.targets_y[index];
	
}

hp_particle[0] = noone;
hp_particle[1] = noone;
hp_particle[2] = noone;

// shadow = instance_create_depth(x, y, 0, prefab_shadow);
// shadow.follow = self;
// shadow.sprite_index = sprCarShadow;
// shadow.depth = 10000;

// Type();
Target();
