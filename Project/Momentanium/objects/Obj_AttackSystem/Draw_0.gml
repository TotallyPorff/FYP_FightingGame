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

/* -- DODGE COOLDOWN FADE -- */

draw_self();