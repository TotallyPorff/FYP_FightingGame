/// @description Base Variables and Function
/* note: all movement variables are in pixels per second
as they are multiplyed by the room speed */

//Horizontal Movement variables
hSpeed = 0; //Horizontal Speed
maxHSpeed = 200; //Maximum horiztonal Speed
hAccel = 20; //Running acceleration
hSlowdown = 10;

//Vertical Movement Variables
vSpeed = 0; //Vertical Speed
maxVSpeed = 300; //Maximum Vertical Speed
canJump = true;
jumpPower = 250;
gravAccel = 15;

//Collision Variables
tilemap = layer_tilemap_get_id("CollisionTiles"); //The ID of the collision tiles

//Input variables
inpLeft = ord("A");
inpRight = ord("D");
inpUp = ord("W");
inpDown = ord("S");
inpJump = vk_space;

//Reset variables
spawnX = x;
spawnY = y;