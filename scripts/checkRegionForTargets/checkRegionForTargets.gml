with(argument0) {
	for(var i = 0; i < ds_list_size(game.regions[argument1]); ++i) {
		var tarIndex = ds_list_find_value(game.regions[argument1], i);
		var tar = instance_find(oBot, tarIndex);
		if(tar == noone) {
			panic = true;
		}
		if(tar != self) {
			if(point_distance(x, y, tar.x, tar.y) <= visionRadius && abs(angle_difference(facing, point_direction(x, y, tar.x, tar.y))) < (visionTheta / 2)) {
				target = tar;
				state = 1;
				image_blend = make_color_hsv(0, 255, 255);
				return true;
			}
		}
	}
	return false;
}