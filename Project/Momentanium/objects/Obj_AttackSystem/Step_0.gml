///@description Health, Knockback & Attacks

// Inherit the parent event
event_inherited();

/* -- REGEN NON-PERM DAMAGED HEALTH -- */
currentHealth = Approach(currentHealth, currentPermHealth, regenRate / room_speed);

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