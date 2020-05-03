dying = argument0;

// Remove self from region
ds_list_delete(dying.game.regions[dying.region], ds_list_find_index(dying.game.regions[dying.region], dying.index));

instance_destroy(dying);