/// @description Movement checks & Collisions

//Grab inputs
keyLeft = 0;
keyRight = 0;
keyUp = 0;
keyDown = 0;

if (currentAttackState == attackState.idle && !hitCooldown) {
	if (keyboard_check(inpLeft)) keyLeft = 1;
	if (keyboard_check(inpRight)) keyRight = 1;
	hInput = keyRight - keyLeft;
	if (keyboard_check(inpUp)) keyUp = 1;
	if (keyboard_check(inpDown)) keyDown = 1;
	vInput = keyDown - keyUp;
}

/* -- HORIZONTAL MOVEMENT -- */
//calculate speed
if (hInput != 0) {
	hSpeed = Approach(hSpeed, charMoveStruct.maxHSpeed * hInput, charMoveStruct.hAccel);
} else {
	hSpeed = Approach(hSpeed, 0, charMoveStruct.hSlowdown);
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
		x = x - (x mod 32) + 31 - (bbox_right - x);
	}
	/*Snap to the left if moving left. x - distance to left of grid square - distance from
	left side to centre of obj*/
	else {
		x = x - (x mod 32) - (bbox_left - x);
	}
	
	//Reset hor speed
	hSpeed = 0;
	
	//is touching a wall
	touchingWall = true;
	
} else {
	//Reset touching wall
	touchingWall = false;	
}


/* -- VERTICAL MOVEMENT -- */
//check for fast falling
if (keyboard_check_pressed(inpDown) && !touchingFloor) {
	fastfalling = true;
	
	//reset vSpeed if moving upwards
	if (vSpeed < 0) vSpeed = 0;
}

//Wall sliding & Gravity
if (touchingWall) {
	//Apply wall slide gravity
	vSpeed = Approach(vSpeed, charMoveStruct.maxSlideSpeed, charMoveStruct.gravAccel);
} else {
	//Check if fastfalling
	if (fastfalling) {
		//Apply fastfall
		vSpeed = Approach(vSpeed, charMoveStruct.maxFFSpeed, charMoveStruct.FFAccel);
	} else {
		//Apply Gravity
		vSpeed = Approach(vSpeed, charMoveStruct.maxVSpeed, charMoveStruct.gravAccel);
	}
}

//Check for jump input
if (keyboard_check_pressed(inpJump)) {
	//Check if attacking and not being hit
	if (currentAttackState == attackState.idle && !hitCooldown) {
		//Reset fastfall
		fastfalling = false;
		
		//Wall jump
		if (touchingWall && !touchingFloor) {
			//jump off wall
			vSpeed = -charMoveStruct.wallJumpPower;
			hSpeed = (charMoveStruct.wallJumpPower / 2) * (-1 * hInput);
		}
		//Normal jump
		else if (canJump) {
			//Jump
			vSpeed = -charMoveStruct.jumpPower;
			jumpsUsed = Approach(jumpsUsed, charMoveStruct.maxJumps, 1);
			//Check if can still jump
			if (jumpsUsed == charMoveStruct.maxJumps) {
				canJump = false;
			}
		} 
	}
}

//Set bbox_side to correct side
if (vSpeed > 0) bbox_side = bbox_bottom + 1; else bbox_side = bbox_top - 1;

//Check if colliding
if ((tilemap_get_at_pixel(tilemap, bbox_left + 1, bbox_side + (vSpeed / room_speed)) != 0) ||
(tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_side + (vSpeed / room_speed)) != 0)) {
	
	/*Snap to the bottom. y - distance to top of grid square + grid height - distance
	from bottom to centre*/
	if (vSpeed > 0) {
		y = y - (y mod 32) + 31 - (bbox_bottom - y);
		//Reset jump
		canJump = true;
		jumpsUsed = 0;
		touchingFloor = true;
		
		//Reset fastfall
		fastfalling = false;
	}
	/*Snap to the top. y - distance to top of grid square - distance from top to centre*/
	else {
		y = y - (y mod 32) - (bbox_top - y);
	}
	
	//Reset vert speed
	vSpeed = 0;
	
} else {
	//reset touching floor
	touchingFloor = false;
}

/* -- DODGE -- */
//check if can dodge
if (keyboard_check_pressed(inpDodge) && canDodge) {
	//Check if attacking and not being hit
	if (currentAttackState == attackState.idle && !hitCooldown) {
		//dodge
		canDodge = false;
		isInvincible = true;
		alarm[0] = dodgeCooldown * room_speed; //Dodge cooldown
		alarm[1] = invincReset * room_speed; //invincibility timer
		
		//Add movement
		hSpeed = charMoveStruct.dodgeSpeed * hInput;
		vSpeed = charMoveStruct.dodgeSpeed * vInput;
	}
}

/* -- ADD MOVEMENT -- */
x += hSpeed / room_speed;
y += vSpeed / room_speed;

/* -- DEATH RESET -- */
//Temporary reset for testing
if (tilemap_get_at_pixel(deathTilemap, x, y) != 0) {
	x = spawnX;
	y = spawnY;
	
	//Reset speed
	hSpeed = 0;
	vSpeed = 0;
}