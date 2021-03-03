///@description Set Variables & functions

// Inherit the parent event
event_inherited();

//Animation Variables
charName = "Empty";
fadeOut = false;

//Attack Input Variables
normAttckInp = ord("J");
specAttckInp = ord("K");

//Hitbox Variables
hitbox = noone;
beenHitBy = ds_list_create();
hitboxesCreated = ds_list_create();

//Grab Attack Structures
baseAttacks = new DefaultieAttacks();
neutralAttack = baseAttacks.neutralAttack;

//Health & Knockback
maxHealth = 100;
currentPermHealth = maxHealth; //Current health + permanent Damage
currentHealth = maxHealth; //Current health + permanent + combo damage
regenRate = 5;

function takeDamage(permDamage, comboDamage) {
	if (!isInvincible) {
		//Deal Damage to the character
		currentPermHealth = Approach(currentPermHealth, 0, permDamage);
		currentHealth = currentPermHealth;
		currentHealth = Approach(currentHealth, 0, comboDamage);
	}
}
function takeKnockback(xKnockback, yKnockback) { //Parameters are the max knockback dealt
	if (!isInvincible) {
		//Set knockback based on knockback power and current % of health
		hSpeed = xKnockback * ((maxHealth * 2 - currentHealth) / maxHealth);
		vSpeed = yKnockback * ((maxHealth * 2 - currentHealth) / maxHealth);
	}
}

//Attack functions and States
function attack(charName, attackStruct) {
	
	//Set sprite index to correct attack
	if (sprite_index != asset_get_index(charName + attackStruct.attackName)) {
		image_index = 0;
		sprite_index = asset_get_index(charName + attackStruct.attackName);
	}
	
	//Create Hitboxes for object
	//Check if all hitboxes have been made
	if (ds_list_size(hitboxesCreated) < attackStruct.numOfAttacks) {
		
		//Check if none of the hitboxes have been made
		if (ds_list_empty(hitboxesCreated)) {
			
			//Loop through all attack hitboxes and make them
			for (currentHB = 1; currentHB <= attackStruct.numOfAttacks; currentHB++) {
				
				//Create hitbox
				hitbox = instance_create_depth(x, y, 250, Obj_AttackHitbox);
				hitbox.sprite_index = asset_get_index(charName + attackStruct.attackName + "_Hitbox" + string(currentHB));
				
				//Set its variables
				hitbox.image_xscale = image_xscale;
				hitbox.hitboxCreator = id;
				hitbox.attackStats = attackStruct;
				
				//Set whether it does knockback
				if (attackStruct.KBOnLast == true) {
					
					//If last hitbox
					if (currentHB == attackStruct.numOfAttacks) {
						hitbox.dealKnockback = true;
					}
					
				} else {
					hitbox.dealKnockback = true;
				}
				
				//Add to DS list
				ds_list_add(hitboxesCreated, hitbox);
			}
		}
	}
	
	//If hit
	if (hitCooldown == true) {
		image_index = 0;
		
		//Destroy all hitboxes made
		for (currentHB = 0; currentHB < ds_list_size(hitboxesCreated); currentHB++) {
			instance_destroy(ds_list_find_value(hitboxesCreated, currentHB));
		}
		ds_list_clear(hitboxesCreated);
		
		return true;
	}
	
	//Check if at end of attack
	if (image_index >= image_number - 1) {
		image_index = 0;
		
		//Destroy all hitboxes made
		for (currentHB = 0; currentHB < ds_list_size(hitboxesCreated); currentHB++) {
			instance_destroy(ds_list_find_value(hitboxesCreated, currentHB));
		}
		ds_list_clear(hitboxesCreated);
		
		return true;
	}
	
	return false;
}