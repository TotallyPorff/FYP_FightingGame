/// @description Base Variables and Function
/* note: all movement variables are in pixels per second
as they are multiplyed by the room speed */

//Horizontal Movement variables
hSpeed = 0; //Horizontal Speed
maxHSpeed = 500; //Maximum horiztonal Speed
hAccel = 40; //Running acceleration
hSlowdown = 20;

//Vertical Movement Variables
vSpeed = 0; //Vertical Speed
maxVSpeed = 500; //Maximum Vertical Speed
gravAccel = 30;

//Fast Falling Movement Variables
fastfalling = false;
maxFFSpeed = 850;
FFAccel = 50;

//Jumping variables
canJump = true;
jumpPower = 750;
maxJumps = 2;
jumpsUsed = 0;

//Wall sliding variables
maxSlideSpeed = 100;
wallJumpPower = 500;
touchingFloor = false;
touchingWall = false;

//Collision Variables
tilemap = layer_tilemap_get_id("CollisionTiles"); //The ID of the collision tiles
deathTilemap = layer_tilemap_get_id("DeathTiles"); //The ID of the death tiles

//Input variables
inpLeft = ord("A");
inpRight = ord("D");
inpUp = ord("W");
inpDown = ord("S");
inpJump = vk_space;
inpDodge = vk_shift;

//Reset variables
spawnX = x;
spawnY = y;