/// @description Manage Animations

/* -- MOVEMENT ANIMATIONS -- */
//If not attacking TODO
if (true) {
	
	//Set Direction
	if (hInput != 0) {
		image_xscale = hInput;
	}

	//if touching the floor
	if (touchingFloor) {
		//if moving
		if (hSpeed != 0) {
			//Check for input
			if (hInput != 0) {
				//Running sprite
				sprite_index = asset_get_index(charName + "_Running");
			} else {
				//Stopping Sprite
				sprite_index = asset_get_index(charName + "_Stopping");
			}
		} else {
			//Idle sprite
			sprite_index = asset_get_index(charName + "_Idle");
		}
	} else {	
		//if wallhanging
		if (touchingWall) {
			//Wallhang sprite
			sprite_index = asset_get_index(charName + "_Wallhang");
		}
		//Jumping or Falling
		else {
			if (vSpeed <= 0) {
				//Jumping sprite
				sprite_index = asset_get_index(charName + "_Jumping");
			} else {
				//Falling sprite
				sprite_index = asset_get_index(charName + "_Falling");
			}
		}
	}	
}

/* -- DODGE EFFECTS -- */
//Check if invincible
if (isInvincible) image_blend = make_color_rgb(144, 240, 169); //Flash Bright Green
else image_blend = c_white;

//Fade with Cooldown
if (!canDodge && !isInvincible) {
	if (fadeOut) {
		image_alpha = Approach(image_alpha, 0, 0.25);
		//Check for switch
		if (image_alpha == 0) fadeOut = false;
	} else {
		image_alpha = Approach(image_alpha, 1, 0.25);
		//Check for switch
		if (image_alpha == 1) fadeOut = true;
	}
} else {
	image_alpha = 1;
}

draw_self();