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
				takeKnockback(25 * hitBy.image_xscale, 25);
			}
			
			//add to DS list
			ds_list_add(beenHitBy, hitBy);
			
			//Start hit cooldown timer
			hitCooldown = true;
			alarm[2] = hitCooldownTime * room_speed;
			
			//Set image scale
			image_xscale = hitBy.image_xscale * -1;
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
			
			//Set attack State
			currentAttackState = attackState.sAttack;
			//Start Attack
			attack(charName, sideAttack);
			//Move player if needed
			if (sideAttack.xMove != 0 || sideAttack.yMove != 0) {
				//Apply movement
				hSpeed = sideAttack.xMove * image_xscale;
				vSpeed = sideAttack.yMove;
			}
			
		} else { //Neutral
			
			//Set attack State
			currentAttackState = attackState.nAttack;
			//Start Attack
			attack(charName, neutralAttack);
			//Move player if needed
			if (neutralAttack.xMove != 0 || neutralAttack.yMove != 0) {
				//Apply movement
				hSpeed = neutralAttack.xMove * image_xscale;
				vSpeed = neutralAttack.yMove;
			}
			
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
	case attackState.sAttack:
		if (attack(charName, sideAttack)) {
			currentAttackState = attackState.idle;
		}
		break;
	default:
		break;
}