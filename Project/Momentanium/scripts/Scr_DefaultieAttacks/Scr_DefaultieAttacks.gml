//Store all default attack variables
function DefaultieAttacks() constructor {
	neutralAttack = {
		attackName: "NAttck",
		permDamage: 2,
		comboDamage: 10,
		xKnockback: 200,
		yKnockback: -200,
		numOfAttacks: 2,
		KBOnLast: true //knockback on last hitbox
	}
	
	sideAttack = {
		attackName: "SAttck",
		permDamage: 5,
		comboDamage: 10,
		xKnockback: 300,
		yKnockback: -200,
		numOfAttacks: 1,
		KBOnLast: false
	}
	
	neutralAir = {
		attackName: "NAir",
		permDamage: 5,
		comboDamage: 10,
		xKnockback: 200,
		yKnockback: -400,
		numOfAttacks: 2,
		KBOnLast: true
	}
}