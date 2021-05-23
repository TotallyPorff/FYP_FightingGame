/// @description Base Variables and Function
/* note: all movement variables are in pixels per second
as they are multiplyed by the room speed */

//Movement Structure
moveStructs = new createMoveStructs();
charMoveStruct = moveStructs.mediumMoveStruct; //It is medium by default

//Variables not in Struct
hSpeed = 0; //Horizontal Speed
vSpeed = 0; //Vertical Speed
fastfalling = false;
canJump = true;
jumpsUsed = 0;
touchingFloor = false;
touchingWall = false;

//Dodge Variables
canDodge = true;
isInvincible = false;
dodgeCooldown = 1;
invincReset = 0.1; //Duration player is invincible
dodgeSpeed = 300;

//Collision Variables
tilemap = layer_tilemap_get_id("CollisionTiles"); //The ID of the collision tiles
deathTilemap = layer_tilemap_get_id("DeathTiles"); //The ID of the death tiles

//Keyboard Input variables
inpLeftKey = ord("A");
inpRightKey = ord("D");
inpUpKey = ord("W");
inpDownKey = ord("S");
inpJumpKey = vk_space;
inpDodgeKey = vk_shift;

//Reset variables
spawnX = x;
spawnY = y;

//Attack States
enum attackState {
	idle,
	nAttack, //neutral
	sAttack, //side
	dAttack, //down
	nAir,
	sAir,
	dAir
}
currentAttackState = attackState.idle;

//Hit cooldown Variables
hitCooldown = false;
hitCooldownTime = 0.25;

//Death variables
visible = true;
isDead = false;
alarmSet = false;
deathTimer = 3; //Seconds

//Stocks
maxStocks = 3;
currentStocks = maxStocks;