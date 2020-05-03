with(argument0) {
	var row = floor(y / game.regionHeight);
	var column = floor(x / game.regionWidth);

	var currentRegionIndex = region;
	var newRegionIndex = game.horizontalPartitions * row + column;

	if(region != newRegionIndex) {
		// Remove from current region
		if(currentRegionIndex != -1) {
			var indexToRemove = ds_list_find_index(game.regions[currentRegionIndex], index);
			ds_list_delete(game.regions[currentRegionIndex], indexToRemove);
		}
		// Add to new region
		region = newRegionIndex;
		var newRegion = game.regions[newRegionIndex];
		ds_list_add(newRegion, index);
	}
}