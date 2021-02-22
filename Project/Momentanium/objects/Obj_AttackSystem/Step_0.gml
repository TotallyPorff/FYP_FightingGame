///@description Health, Knockback & Attacks

// Inherit the parent event
event_inherited();

/* -- REGEN NON-PERM DAMAGED HEALTH -- */
currentHealth = Approach(currentHealth, currentPermHealth, regenRate / room_speed);

//Check if not invincible
if (!isInvincible && !hitCooldown) {
	
	//Check for getting hit
	hitBy = collision_circle(x, y, charMoveStruct.hurtboxRadius, Obj_AttackHitbox, true, true);
	if (ds_list_find_index(hitboxesCreated, hitBy) == -1 && hitBy != noone) { //Not a hitbox made by this character and not empty
		
		//Check if it hasn't been hit by this before
		if (ds_list_find_index(beenHitBy, hitBy) == -1) {
			
			//take damage and knockback
			takeDamage(hitBy.attackStats.permDamage, hitBy.attackStats.comboDamage);
			if (hitBy.dealKnockback) {
				takeKnockback(hitBy.attackStats.xKnockback * hitBy.image_xscale, hitBy.attackStats.yKnockback);
			} else {
				takeKnockback(10 * hitBy.image_xscale, 0);
			}
			
			//add to DS list
			ds_list_add(beenHitBy, hitBy);
			
			//Start hit cooldown timer
			hitCooldown = true;
			alarm[2] = hitCooldownTime * room_speed;
		}
	}
}

//Die (for testing)
if (currentHealth <= 0) instance_destroy();

/* -- ATTACKS -- */
if (currentAttackState == attackState.idle) {
	
	/* -- NORMAL ATTACKS -- */
	if (keyboard_check_pressed(normAttckInp) && touchingFloor) {
		//check for inputs
		if (vInput == -1) { //Up
			
		} else if (vInput == 1) { //Down
			
		} else if (hInput != 0) { //Side
			
		} else { //Neutral
			//Set attack State
			currentAttackState = attackState.nAttack;
			//Start Attack
			attack(charName, neutralAttack);
		}
	}
}

/* -- CONTINUE ATTACKS -- */
switch (currentAttackState) {
	case attackState.nAttack:
		if (attack(charName, neutralAttack)) {
			currentAttackState = attackState.idle;
		}
		break;
	default:
		break;
}