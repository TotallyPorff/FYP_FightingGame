//Store all default attack variables
function DefaultieAttacks() constructor {
	neutralAttack = {
		attackName: "NAttck",
		permDamage: 2,
		comboDamage: 5,
		xKnockback: 200,
		yKnockback: -200,
		numOfAttacks: 2,
		KBOnLast: true, //knockback on last hitbox
		xMove: 0, //Move the attacker
		yMove: 0
	}
	
	sideAttack = {
		attackName: "SAttck",
		permDamage: 5,
		comboDamage: 5,
		xKnockback: 300,
		yKnockback: -200,
		numOfAttacks: 1,
		KBOnLast: false,
		xMove: 300,
		yMove: 0
	}
}