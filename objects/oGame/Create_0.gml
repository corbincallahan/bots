#region // Move game window
window_set_position(-1500, window_get_y());
#endregion

#region // Make regions
horizontalPartitions = 4;
verticalPartitions = 4; // Doesn't need to be global?
regionWidth = room_width / horizontalPartitions;
regionHeight = room_height / verticalPartitions;
numRegions = verticalPartitions * horizontalPartitions;
for(var i = numRegions - 1; i >= 0; --i) {
	regions[i] = ds_list_create();
	ds_list_clear(regions[i]); // Is this needed?
}
#endregion

#region // Make bots
for(var i = 0; i < 20; ++i) {
	randX = random_range(0, room_width);
	randY = random_range(0, room_height);
	with(instance_create_layer(randX, randY, "Instances", oBot)) {
		type = irandom(2);
		index = i; // Might not work? Alternative commented below
	}
}
/*for(var i = 0; i < 100; ++i) {
	with(instance_find(oBot, i)) {
		index = i;
	}
}*/
#endregion