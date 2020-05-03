with(argument0) {
	// Check current region
	if(checkRegionForTargets(self, region)) {
		return;
	}
	
	var leftPointX = clamp(x + lengthdir_x(visionRadius, facing + visionTheta / 2), 0, room_width - 1);
	var leftPointY = clamp(y + lengthdir_y(visionRadius, facing + visionTheta / 2), 0, room_height - 1);
	var leftPointRow = floor(leftPointY / game.regionHeight);
	var leftPointColumn = floor(leftPointX / game.regionWidth);
	var leftPointRegion = game.horizontalPartitions * leftPointRow + leftPointColumn;
	
	var rightPointX = clamp(x + lengthdir_x(visionRadius, facing - visionTheta / 2), 0, room_width - 1);
	var rightPointY = clamp(y + lengthdir_y(visionRadius, facing - visionTheta / 2), 0, room_height - 1);
	var rightPointRow = floor(rightPointY / game.regionHeight);
	var rightPointColumn = floor(rightPointX / game.regionWidth);
	var rightPointRegion = game.horizontalPartitions * rightPointRow + rightPointColumn;
	
	if(leftPointRegion != region) {
		if(checkRegionForTargets(self, leftPointRegion)) {
			return;
		}
	}
	if(rightPointRegion != region and rightPointRegion != leftPointRegion) {
		checkRegionForTargets(self, rightPointRegion);
	}
}