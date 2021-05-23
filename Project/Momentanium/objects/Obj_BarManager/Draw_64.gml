/// @description Draw Damage bars + Winner
if (initialWaitOver && managerID != noone) {
	
	//Draw bar
	for (var i = 0; i < numberOfChars; i++) {
		//Set character ID to variable
		currentID = ds_list_find_value(managerID.playerIDList, i);
		
		//Get the X position
		barXPos = (barWidth * i) + (barGapSize * (i + 1)) + barEdgeToOrigin;
		
		//Check if instance still alive
		if (instance_exists(currentID)) { //Draw bar with health
			
			if (currentID.isDead) { //Character is dead
				
				//Draw permanent damage
				draw_sprite_stretched(Spr_PermDamage, 0, barXPos, barYPos, damageBarWidth, damageHeight);
				
			} else { //Is alive
				
				//Draw combo damage
				damageWidth = (currentID.maxHealth - currentID.currentHealth) / currentID.maxHealth //Get decimal
				damageWidth = damageWidth * damageBarWidth; //Convert decimal to bar width
				draw_sprite_stretched(Spr_ComboDamage, 0, barXPos, barYPos, damageWidth, damageHeight);
		
				//Draw permanent damage
				damageWidth = (currentID.maxHealth - currentID.currentPermHealth) / currentID.maxHealth //Get decimal
				damageWidth = damageWidth * damageBarWidth; //Convert decimal to bar width
				draw_sprite_stretched(Spr_PermDamage, 0, barXPos, barYPos, damageWidth, damageHeight);
			
			}			
		}
		
		//Draw bar frame
		draw_sprite(Spr_Bar, 0, barXPos, barYPos);
	}
	
	//Display winner
	if (managerID.isMatchOver) {
		//Display main text
		draw_sprite(Spr_WinText, 0, screenWidth / 2, screenHeight / 2);
		//Display winner
		winnerSprite = asset_get_index("Spr_Win" + string(managerID.winnerNumber));
		draw_sprite(winnerSprite, 0, screenWidth / 2, screenHeight / 2);
		//Display restart text
		draw_sprite(Spr_RestartText, 0, screenWidth / 2, (screenHeight / 2) + 200);
	}
}