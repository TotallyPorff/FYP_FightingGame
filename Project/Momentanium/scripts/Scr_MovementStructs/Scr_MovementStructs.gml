//Create the various structures for movement variables
function createMoveStructs() constructor {
	
	lightMoveStruct = {
		//Horizontal Movement variables
		maxHSpeed : 400, //Maximum horiztonal Speed
		hAccel : 50, //Running acceleration
		hSlowdown : 30,
		//Vertical Movement Variables
		maxVSpeed : 400, //Maximum Vertical Speed
		gravAccel : 10,	
		//Fast Falling Movement Variables
		maxFFSpeed : 500,
		FFAccel : 40,
		//Jumping variables
		jumpPower : 600,
		maxJumps : 2,
		//Wall sliding variables
		maxSlideSpeed : 100,
		wallJumpPower : 500,
		//Dodge Variables
		dodgeSpeed : 300,
		//Hurtbox Variables
		hurtboxRadius : 6
	};
	
	mediumMoveStruct = {
		//Horizontal Movement variables
		maxHSpeed : 350, //Maximum horiztonal Speed
		hAccel : 40, //Running acceleration
		hSlowdown : 20,
		//Vertical Movement Variables
		maxVSpeed : 400, //Maximum Vertical Speed
		gravAccel : 30,	
		//Fast Falling Movement Variables
		maxFFSpeed : 650,
		FFAccel : 50,
		//Jumping variables
		jumpPower : 550,
		maxJumps : 2,
		//Wall sliding variables
		maxSlideSpeed : 125,
		wallJumpPower : 400,
		//Dodge Variables
		dodgeSpeed : 250,
		//Hurtbox Variables
		hurtboxRadius : 8
	};
	
	heavyMoveStruct = {
		//Horizontal Movement variables
		maxHSpeed : 300, //Maximum horiztonal Speed
		hAccel :30, //Running acceleration
		hSlowdown : 10,
		//Vertical Movement Variables
		maxVSpeed : 400, //Maximum Vertical Speed
		gravAccel : 10,	
		//Fast Falling Movement Variables
		maxFFSpeed : 800,
		FFAccel : 50,
		//Jumping variables
		jumpPower : 500,
		maxJumps : 2,
		//Wall sliding variables
		maxSlideSpeed : 150,
		wallJumpPower : 400,
		//Dodge Variables
		dodgeSpeed : 200,
		//Hurtbox Variables
		hurtboxRadius : 10
	};
}