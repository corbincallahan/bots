dying = argument0;

// Fix rest of bots indicies
for(var i = dying.index + 1; i < instance_number(oBot); ++i) {
	tar = instance_find(oBot, i);
	
	tarRegion = tar.game.regions[tar.region]
	tarIndexInRegion = ds_list_find_index(tarRegion, tar.index);
	ds_list_replace(tarRegion, tarIndexInRegion, tar.index - 1);
	
	tar.index--;
}

// Remove self from region
ds_list_delete(dying.game.regions[dying.region], ds_list_find_index(dying.game.regions[dying.region], dying.index));

instance_destroy(dying);