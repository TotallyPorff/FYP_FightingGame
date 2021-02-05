/// @description Movement checks & Collisions

/* -- HORIZONTAL MOVEMENT -- */
//Grab inputs
keyLeft = 0;
keyRight = 0;
if (keyboard_check(inpLeft)) keyLeft = 1;
if (keyboard_check(inpRight)) keyRight = 1;

//calculate input and speed
hInput = (keyRight - keyLeft);
if (hInput != 0) {
	hSpeed = Approach(hSpeed, maxHSpeed * hInput, hAccel);
} else {
	hSpeed = Approach(hSpeed, 0, hSlowdown);
}

//check for collisions
var bbox_side;
//Set bbox_side to correct side
if (hSpeed > 0) bbox_side = bbox_right + 1; else bbox_side = bbox_left - 1;

//Check if colliding
if ((tilemap_get_at_pixel(tilemap, bbox_side + (hSpeed / room_speed), bbox_top + 1) != 0) ||
(tilemap_get_at_pixel(tilemap, bbox_side + (hSpeed / room_speed), bbox_bottom - 1) != 0)) {
	
	/* Snap to the right if moving right. x - distance to left of grid square + grid width
	- distance from right side to centre of obj*/
	if (hSpeed > 0) {
		x = x - (x mod 16) + 15 - (bbox_right - x);
	}
	/*Snap to the left if moving left. x - distance to left of grid square - distance from
	left side to centre of obj*/
	else {
		x = x - (x mod 16) - (bbox_left - x);
	}
	
	//Reset hor speed
	hSpeed = 0;
}


/* -- VERTICAL MOVEMENT --*/
//Check for jumping
if (keyboard_check_pressed(inpJump) && canJump) {
	//Jump
	canJump = false;
	vSpeed = -jumpPower;
}

//Apply Gravity
vSpeed = Approach(vSpeed, maxVSpeed, gravAccel);

//Set bbox_side to correct side
if (vSpeed > 0) bbox_side = bbox_bottom + 1; else bbox_side = bbox_top - 1;

//Check if colliding
if ((tilemap_get_at_pixel(tilemap, bbox_left + 1, bbox_side + (vSpeed / room_speed)) != 0) ||
(tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_side + (vSpeed / room_speed)) != 0)) {
	
	/*Snap to the bottom. y - distance to top of grid square + grid height - distance
	from bottom to centre*/
	if (vSpeed > 0) {
		y = y - (y mod 16) + 15 - (bbox_bottom - y);
		//Reset jump
		canJump = true;
	}
	/*Snap to the top. y - distance to top of grid square - distance from top to centre*/
	else {
		y = y - (y mod 16) - (bbox_top - y);
	}
	
	//Reset vert speed
	vSpeed = 0;
}


/* -- ADD MOVEMENT -- */
x += hSpeed / room_speed;
y += vSpeed / room_speed;

/* -- DEATH RESET -- */
//Temporary reset for testing
if (y > room_height - 32) {
	x = spawnX;
	y = spawnY;
}