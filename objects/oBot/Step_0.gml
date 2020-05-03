updateRegion(self); // Should this be done at the end? Does it really matter?

#region // Roaming/searching
if(state == 0) {
	// Meander
	if(random(1) < .01) { // Change turning
		meandering = irandom(2);
	}
	if(meandering == 0) {
		facing += 1; // Could replace 1 with variable
	}
	else if(meandering == 2) {
		facing -= 1;
	}
	lookForTarget(self); // Sets target if it finds one
}
#endregion

#region // Chasing
else if(state == 1) {
	// Enable sprint here or on finding target?
	
	// Turn toward target
	var dirToTarget = point_direction(x, y, target.x, target.y);
	if(abs(angle_difference(dirToTarget, facing)) < turnRate) {
		facing = dirToTarget;
	}
	else {
		facing += turnRate * sign(dirToTarget);
	}
	
	// Attack if in range
	if(point_distance(x, y, target.x, target.y) <= attackRange) {
		attack(self, target);
	}
}
#endregion

#region // Attacking
else if(state == 2) {
	--attackTimer;
	if(attackTimer <= 0) {
		state = 1;
	}
}
#endregion

#region // Fleeing
else if(state == 3) {
	
}
#endregion

#region //Update position
var dx = lengthdir_x(velocity, facing);
var dy = lengthdir_y(velocity, facing);

x += dx; // Could skip dx and dy if they're never used elsewhere
y += dy;

if(x < 0 or x >= room_width) {
	x = clamp(x, 0, room_width - 1);
	facing = 180 - facing;
}
if(y < 0 or y >= room_height) {
	y = clamp(y, 0, room_height - 1);
	facing *= -1;
}

facing %= 360;
image_angle = facing;
#endregion