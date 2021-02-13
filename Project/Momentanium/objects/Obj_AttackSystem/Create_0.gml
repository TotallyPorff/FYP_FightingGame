///@description Set Variables & functions

// Inherit the parent event
event_inherited();

//Animation Variables
charName = "Empty";
fadeOut = false;

//Attack States
enum attackState {
	idle,
	nAttack, //neutral
	sAttack, //side
	dAttack, //down
	uAttack //up
}

//Attack Variables
normAttckInp = ord("J");
specAttckInp = ord("K");
currentAttackState = attackState.idle;

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
		//Apply knockback based on knockback power and current % of health
		hSpeed += xKnockback * ((maxHealth - currentHealth) / maxHealth);
		vSpeed += yKnockback * ((maxHealth - currentHealth) / maxHealth);
	}
}

//Attack functions and States
function attack(charName, attackStruct) {
	
	//Set sprite index to correct attack
	if (sprite_index != asset_get_index(charName + attackStruct.attackName)) {
		image_index = 0;
		sprite_index = asset_get_index(charName + attackStruct.attackName);
	}
	
	
	
	//Check if at end of attack
	if (image_index >= image_number - 1) {
		image_index = 0;
		return true;
	}
	
	return false;
}