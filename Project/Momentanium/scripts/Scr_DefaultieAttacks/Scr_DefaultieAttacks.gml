//Store all default attack variables
function DefaultieAttacks() constructor {
	neutralAttack = {
		attackName: "NAttck",
		permDamage: 4,
		comboDamage: 3,
		xKnockback: 200,
		yKnockback: -200,
		numOfAttacks: 2,
		KBOnLast: true //knockback on last hitbox
	}
	
	sideAttack = {
		attackName: "SAttck",
		permDamage: 10,
		comboDamage: 10,
		xKnockback: 100,
		yKnockback: -200,
		numOfAttacks: 1,
		KBOnLast: false
	}
	
	neutralAir = {
		attackName: "NAir",
		permDamage: 10,
		comboDamage: 7,
		xKnockback: 200,
		yKnockback: -400,
		numOfAttacks: 2,
		KBOnLast: false
	}
}